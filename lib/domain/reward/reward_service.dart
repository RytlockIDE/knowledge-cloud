import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/app_db.dart';
import '../../data/repositories/reward_repository.dart';
import 'skin_catalog.dart';

/// 激励服务：种子皮肤入库、兑换/装备编排。
class RewardService {
  final Ref ref;

  RewardService(this.ref);

  RewardRepository get _repo => ref.read(rewardRepositoryProvider);

  /// 首次启动：将种子皮肤写入数据库（幂等，按 id 补缺）。
  Future<void> seedSkins() async {
    final existing = await _repo.allSkins();
    final existingIds = existing.map((s) => s.id).toSet();
    for (final seed in SkinCatalog.seeds) {
      if (existingIds.contains(seed.id)) continue;
      await _repo.rawInsertSkin(
        id: seed.id,
        name: seed.name,
        category: seed.category,
        unlockType: seed.unlockType,
        costPoints: seed.costPoints,
        thresholdPoints: seed.thresholdPoints,
        requiredBadgesJson: _encodeBadges(seed.requiredBadges),
        description: seed.description,
        paletteRef: seed.paletteRef,
        sortOrder: seed.sortOrder,
      );
    }
    // 默认皮肤自动装备
    for (final cat in ['theme', 'mascot', 'node_fx', 'frame']) {
      final equipped = await _repo.equippedSkinOf(cat);
      if (equipped == null) {
        final fallbackId = switch (cat) {
          'theme' => 'theme_cloud_light',
          'mascot' => 'mascot_default',
          'node_fx' => 'nodefx_default',
          _ => 'frame_default',
        };
        final skin = await _repo.skinById(fallbackId);
        if (skin != null) {
          // 默认皮肤视为已拥有
          if (skin.ownedAt == null) {
            await _repo.markOwned(fallbackId);
          }
          await _repo.equip(fallbackId);
        }
      }
    }
  }

  static String _encodeBadges(Map<String, int> badges) {
    if (badges.isEmpty) return '{}';
    return '{${badges.entries.map((e) => '"${e.key}":${e.value}').join(',')}}';
  }
}

extension RewardRepositoryX on RewardRepository {
  Future<void> rawInsertSkin({
    required String id,
    required String name,
    required String category,
    required String unlockType,
    required int costPoints,
    required int thresholdPoints,
    required String requiredBadgesJson,
    required String description,
    String? paletteRef,
    required int sortOrder,
  }) async {
    await db.into(db.skins).insert(
          SkinsCompanion.insert(
            id: id,
            name: name,
            category: category,
            unlockType: unlockType,
            costPoints: Value(costPoints),
            thresholdPoints: Value(thresholdPoints),
            requiredBadgesJson: Value(requiredBadgesJson),
            description: Value(description),
            paletteRef: Value(paletteRef),
            sortOrder: Value(sortOrder),
          ),
        );
  }

  Future<void> markOwned(String skinId) async {
    await (db.update(db.skins)..where((t) => t.id.equals(skinId))).write(
      SkinsCompanion(ownedAt: Value(DateTime.now().millisecondsSinceEpoch)),
    );
  }
}

final rewardServiceProvider = Provider<RewardService>((ref) => RewardService(ref));
