import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/uuid.dart';
import '../../data/models/app_db.dart';
import '../../services/settings_store.dart';

/// 积分/勋章/皮肤仓库。
class RewardRepository {
  final Ref ref;

  RewardRepository(this.ref);

  AppDb get _db => ref.read(appDbProvider);
  AppDb get db => _db;
  SettingsStore get _settings => ref.read(settingsStoreProvider);

  // ---- Points ----

  /// 当前可用余额（最新 balance_after）。
  Future<int> balance() async {
    final row = await (_db.select(_db.pointsLedger)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .getSingleOrNull();
    return row?.balanceAfter ?? 0;
  }

  /// 累计总积分（只增不减，用于阈值解锁）。
  Future<int> totalEarned() async {
    final rows = await _db.select(_db.pointsLedger).get();
    var total = 0;
    for (final r in rows) {
      if (r.delta > 0) total += r.delta;
    }
    return total;
  }

  /// 记一笔积分（delta 可为负 = 兑换扣减）。返回新余额。
  Future<int> addPoints({
    required int delta,
    required String source,
    String? quizId,
    String reason = '',
  }) async {
    final current = await balance();
    final newBalance = current + delta;
    await _db.into(_db.pointsLedger).insert(
          PointsLedgerCompanion.insert(
            id: newUuid(),
            delta: delta,
            source: source,
            quizId: Value(quizId),
            reason: Value(reason),
            balanceAfter: newBalance,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
    return newBalance;
  }

  Future<List<PointsLedgerData>> ledger({int limit = 50}) =>
      (_db.select(_db.pointsLedger)
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
            ..limit(limit))
          .get();

  // ---- Badges ----

  Future<List<Badge>> allBadges() => (_db.select(_db.badges)
        ..orderBy([(t) => OrderingTerm.desc(t.earnedAt)]))
      .get();

  /// 发勋章（period_key 幂等：同类型同周期只发一次）。返回是否新发。
  Future<bool> grantBadge({
    required String kind,
    required String periodKey,
    String? quizId,
  }) async {
    final existing = await (_db.select(_db.badges)
          ..where((t) => t.kind.equals(kind) & t.periodKey.equals(periodKey)))
        .getSingleOrNull();
    if (existing != null) return false;
    await _db.into(_db.badges).insert(
          BadgesCompanion.insert(
            id: newUuid(),
            kind: kind,
            periodKey: periodKey,
            quizId: Value(quizId),
            earnedAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
    return true;
  }

  Future<Map<String, int>> badgeCounts() async {
    final rows = await allBadges();
    final counts = <String, int>{'weekly': 0, 'monthly': 0, 'annual': 0};
    for (final r in rows) {
      counts[r.kind] = (counts[r.kind] ?? 0) + 1;
    }
    return counts;
  }

  // ---- Skins ----

  Future<List<Skin>> allSkins() => (_db.select(_db.skins)
        ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
      .get();

  Future<Skin?> skinById(String id) =>
      (_db.select(_db.skins)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 兑换（扣积分）。返回错误信息，null = 成功。
  Future<String?> redeem(String skinId) async {
    final skin = await skinById(skinId);
    if (skin == null) return '皮肤不存在';
    if (skin.ownedAt != null) return '已拥有';
    final bal = await balance();
    if (bal < skin.costPoints) return '积分不足（还需 ${skin.costPoints - bal} 分）';
    final badgesOk = await satisfiesBadges(skin.requiredBadgesJson);
    if (!badgesOk) return '勋章数量不足';
    await addPoints(
        delta: -skin.costPoints, source: 'redeem', reason: '兑换皮肤 ${skin.name}');
    await (_db.update(_db.skins)..where((t) => t.id.equals(skinId)))
        .write(SkinsCompanion(ownedAt: Value(DateTime.now().millisecondsSinceEpoch)));
    return null;
  }

  /// 阈值自动解锁（达到累计积分即拥有，不扣分）。返回刚解锁的皮肤列表。
  Future<List<Skin>> checkThresholdUnlocks() async {
    final total = await totalEarned();
    final locked = await (_db.select(_db.skins)
          ..where((t) =>
              t.unlockType.equals('threshold') &
              t.ownedAt.isNull()))
        .get();
    final unlocked = <Skin>[];
    for (final skin in locked) {
      if (total >= skin.thresholdPoints &&
          await satisfiesBadges(skin.requiredBadgesJson)) {
        await (_db.update(_db.skins)..where((t) => t.id.equals(skin.id)))
            .write(SkinsCompanion(
                ownedAt: Value(DateTime.now().millisecondsSinceEpoch)));
        unlocked.add(skin);
      }
    }
    return unlocked;
  }

  /// 勋章约束检查。
  Future<bool> satisfiesBadges(String requiredBadgesJson) async {
    final required = jsonDecode(requiredBadgesJson) as Map<String, dynamic>;
    if (required.isEmpty) return true;
    final counts = await badgeCounts();
    for (final entry in required.entries) {
      final need = (entry.value as num).toInt();
      if ((counts[entry.key] ?? 0) < need) return false;
    }
    return true;
  }

  /// 装备皮肤（同类别互斥）。
  Future<void> equip(String skinId) async {
    final skin = await skinById(skinId);
    if (skin == null || skin.ownedAt == null) return;
    final siblings = await (_db.select(_db.skins)
          ..where((t) => t.category.equals(skin.category) & t.equipped.equals(true)))
        .get();
    for (final s in siblings) {
      await (_db.update(_db.skins)..where((t) => t.id.equals(s.id)))
          .write(const SkinsCompanion(equipped: Value(false)));
    }
    await (_db.update(_db.skins)..where((t) => t.id.equals(skinId)))
        .write(const SkinsCompanion(equipped: Value(true)));
    if (skin.category == 'theme') {
      await _settings.setEquippedThemeSkin(skin.paletteRef ?? 'cloud_light');
    }
  }

  Future<Skin?> equippedSkinOf(String category) =>
      (_db.select(_db.skins)
            ..where((t) => t.category.equals(category) & t.equipped.equals(true)))
          .getSingleOrNull();
}

final rewardRepositoryProvider =
    Provider<RewardRepository>((ref) => RewardRepository(ref));
