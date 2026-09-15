import 'dart:convert';

import 'package:flutter/material.dart' hide Badge;
import 'package:flutter/material.dart' as material show Badge;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/errors/app_exception.dart';
import '../../app.dart';
import '../../data/models/app_db.dart';
import '../../data/repositories/reward_repository.dart';
import '../../domain/reward/skin_catalog.dart';
import '../../widgets/celebration_overlay.dart';

/// 奖励中心：积分 / 勋章 / 皮肤 Mod 商店。
class RewardCenterPage extends ConsumerStatefulWidget {
  const RewardCenterPage({super.key});

  @override
  ConsumerState<RewardCenterPage> createState() => _RewardCenterPageState();
}

class _RewardCenterPageState extends ConsumerState<RewardCenterPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tab =
      TabController(length: 3, vsync: this, initialIndex: 0);

  int _balance = 0;
  int _totalEarned = 0;
  Map<String, int> _badgeCounts = const {};
  List<Badge> _badges = const [];
  List<Skin> _skins = const [];
  List<PointsLedgerData> _ledger = const [];
  bool _loading = true;
  final Set<String> _busySkins = {};

  @override
  void initState() {
    super.initState();
    _reload();
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  Future<void> _reload() async {
    final reward = ref.read(rewardRepositoryProvider);
    final results = await Future.wait([
      reward.balance(),
      reward.totalEarned(),
      reward.badgeCounts(),
      reward.allBadges(),
      reward.allSkins(),
      reward.ledger(limit: 50),
    ]);
    if (!mounted) return;
    setState(() {
      _balance = results[0] as int;
      _totalEarned = results[1] as int;
      _badgeCounts = results[2] as Map<String, int>;
      _badges = results[3] as List<Badge>;
      _skins = results[4] as List<Skin>;
      _ledger = results[5] as List<PointsLedgerData>;
      _loading = false;
    });
  }

  Future<void> _redeem(Skin skin) async {
    if (_busySkins.contains(skin.id)) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('兑换「${skin.name}」'),
        content: Text('将消耗 ${skin.costPoints} 积分，当前余额 $_balance 分。确定兑换吗？'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('取消')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('兑换')),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _busySkins.add(skin.id));
    try {
      final error = await ref.read(rewardRepositoryProvider).redeem(skin.id);
      if (!mounted) return;
      if (error != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error)));
      } else {
        CelebrationOverlay.show(
          context,
          title: '解锁成功！',
          subtitle: '「${skin.name}」已收入囊中',
          icon: Icons.card_giftcard,
        );
      }
    } on AppException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _busySkins.remove(skin.id));
      _reload();
    }
  }

  Future<void> _equip(Skin skin) async {
    await ref.read(rewardRepositoryProvider).equip(skin.id);
    if (skin.category == 'theme' && skin.paletteRef != null) {
      ref.read(themeSkinProvider.notifier).state = skin.paletteRef!;
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('已装备「${skin.name}」')));
    _reload();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: Column(
        children: [
          _HeaderCard(
            balance: _balance,
            totalEarned: _totalEarned,
            badgeCounts: _badgeCounts,
          ),
          TabBar(
            controller: _tab,
            tabs: const [
              Tab(text: '皮肤商店', icon: Icon(Icons.storefront)),
              Tab(text: '勋章墙', icon: Icon(Icons.workspace_premium)),
              Tab(text: '积分流水', icon: Icon(Icons.receipt_long)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tab,
              children: [
                _buildSkinShop(theme),
                _buildBadgeWall(theme),
                _buildLedger(theme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---- 皮肤商店 ----

  Widget _buildSkinShop(ThemeData theme) {
    final categories = ['theme', 'mascot', 'node_fx', 'frame'];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final c in categories) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(_categoryIcon(c), size: 18, color: theme.colorScheme.primary),
                const SizedBox(width: 6),
                Text(SkinCatalog.categoryLabel(c),
                    style: theme.textTheme.titleMedium),
              ],
            ),
          ),
          ..._skins
              .where((s) => s.category == c)
              .map((s) => _SkinCard(
                    skin: s,
                    busy: _busySkins.contains(s.id),
                    onRedeem: () => _redeem(s),
                    onEquip: () => _equip(s),
                  )),
          const SizedBox(height: 8),
        ],
      ],
    );
  }

  IconData _categoryIcon(String c) => switch (c) {
        'theme' => Icons.palette_outlined,
        'mascot' => Icons.emoji_emotions_outlined,
        'node_fx' => Icons.blur_on,
        'frame' => Icons.crop_square,
        _ => Icons.category,
      };

  // ---- 勋章墙 ----

  Widget _buildBadgeWall(ThemeData theme) {
    final fmt = DateFormat('yyyy-MM-dd');
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            _BadgeCountCard(
                icon: Icons.workspace_premium,
                label: '周勋章',
                count: _badgeCounts['weekly'] ?? 0),
            _BadgeCountCard(
                icon: Icons.military_tech,
                label: '月勋章',
                count: _badgeCounts['monthly'] ?? 0),
            _BadgeCountCard(
                icon: Icons.emoji_events,
                label: '年度勋章',
                count: _badgeCounts['annual'] ?? 0),
          ],
        ),
        const SizedBox(height: 16),
        if (_badges.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  '还没有勋章。\n周练 / 月练 / 年度总练考到满分即可点亮勋章！',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: theme.colorScheme.outline),
                ),
              ),
            ),
          )
        else
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final b in _badges)
                _BadgeItem(
                  kind: b.kind,
                  periodKey: b.periodKey,
                  earnedText: fmt.format(DateTime.fromMillisecondsSinceEpoch(b.earnedAt)),
                ),
            ],
          ),
      ],
    );
  }

  // ---- 积分流水 ----

  Widget _buildLedger(ThemeData theme) {
    final fmt = DateFormat('MM-dd HH:mm');
    if (_ledger.isEmpty) {
      return Center(
        child: Text('暂无积分记录，完成一次练习就能获得积分！',
            style: TextStyle(color: theme.colorScheme.outline)),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _ledger.length,
      itemBuilder: (context, i) {
        final e = _ledger[i];
        final positive = e.delta > 0;
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Icon(
              positive ? Icons.add_circle_outline : Icons.remove_circle_outline,
              color: positive ? const Color(0xFF36B37E) : theme.colorScheme.error,
            ),
            title: Text(e.reason.isEmpty ? e.source : e.reason,
                style: const TextStyle(fontSize: 14)),
            subtitle: Text(fmt.format(DateTime.fromMillisecondsSinceEpoch(e.createdAt)),
                style: const TextStyle(fontSize: 12)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${positive ? '+' : ''}${e.delta}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: positive ? const Color(0xFF36B37E) : theme.colorScheme.error)),
                Text('余额 ${e.balanceAfter}',
                    style: TextStyle(fontSize: 11, color: theme.colorScheme.outline)),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---- 头部概览 ----

class _HeaderCard extends StatelessWidget {
  final int balance;
  final int totalEarned;
  final Map<String, int> badgeCounts;

  const _HeaderCard({
    required this.balance,
    required this.totalEarned,
    required this.badgeCounts,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('可用积分', style: TextStyle(color: cs.outline, fontSize: 13)),
                Text('$balance',
                    style: theme.textTheme.headlineLarge
                        ?.copyWith(color: cs.primary, fontWeight: FontWeight.bold)),
                Text('累计获得 $totalEarned 分',
                    style: TextStyle(color: cs.outline, fontSize: 12)),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.workspace_premium, size: 16),
                    const SizedBox(width: 4),
                    Text('周 ${badgeCounts['weekly'] ?? 0}'),
                    const SizedBox(width: 12),
                    const Icon(Icons.military_tech, size: 16),
                    const SizedBox(width: 4),
                    Text('月 ${badgeCounts['monthly'] ?? 0}'),
                    const SizedBox(width: 12),
                    const Icon(Icons.emoji_events, size: 16),
                    const SizedBox(width: 4),
                    Text('年 ${badgeCounts['annual'] ?? 0}'),
                  ],
                ),
                const SizedBox(height: 8),
                Text('累计积分可自动解锁皮肤 · 勋章是高级皮肤的钥匙',
                    style: TextStyle(color: cs.outline, fontSize: 11)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---- 皮肤卡片 ----

class _SkinCard extends StatelessWidget {
  final Skin skin;
  final bool busy;
  final VoidCallback onRedeem;
  final VoidCallback onEquip;

  const _SkinCard({
    required this.skin,
    required this.busy,
    required this.onRedeem,
    required this.onEquip,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final owned = skin.ownedAt != null;
    final equipped = skin.equipped;

    // 解锁条件文案
    final conditions = <String>[];
    if (skin.unlockType == 'redeem' && skin.costPoints > 0) {
      conditions.add('${skin.costPoints} 积分兑换');
    }
    if (skin.unlockType == 'threshold' && skin.thresholdPoints > 0) {
      conditions.add('累计 ${skin.thresholdPoints} 积分自动解锁');
    }
    final requiredBadges = _safeDecodeBadges(skin.requiredBadgesJson);
    for (final e in requiredBadges.entries) {
      conditions.add('${e.value}${SkinCatalog.badgeKindLabel(e.key)}');
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: equipped ? cs.primaryContainer : cs.surfaceContainerLow,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(_iconOf(skin.category),
                  color: equipped ? cs.primary : cs.outline),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(skin.name, style: theme.textTheme.titleSmall),
                      const SizedBox(width: 6),
                      Chip(
                        label: Text(skin.unlockType == 'redeem' ? '兑换' : '达成'),
                        visualDensity: VisualDensity.compact,
                        labelStyle: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  if (skin.description.isNotEmpty)
                    Text(skin.description,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  if (conditions.isNotEmpty)
                    Text(conditions.join(' · '),
                        style: TextStyle(
                            fontSize: 11, color: cs.primary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _buildAction(owned, equipped),
          ],
        ),
      ),
    );
  }

  static Map<String, dynamic> _safeDecodeBadges(String s) {
    try {
      final v = jsonDecode(s);
      if (v is Map) return Map<String, dynamic>.from(v);
    } catch (_) {}
    return const {};
  }

  IconData _iconOf(String category) => switch (category) {
        'theme' => Icons.palette_outlined,
        'mascot' => Icons.emoji_emotions_outlined,
        'node_fx' => Icons.blur_on,
        'frame' => Icons.crop_square,
        _ => Icons.category,
      };

  Widget _buildAction(bool owned, bool equipped) {
    if (equipped) {
      return const Chip(label: Text('使用中'), visualDensity: VisualDensity.compact);
    }
    if (owned) {
      return FilledButton.tonal(
        onPressed: busy ? null : onEquip,
        child: const Text('装备'),
      );
    }
    if (skin.unlockType == 'redeem') {
      return FilledButton(
        onPressed: busy ? null : onRedeem,
        child: const Text('兑换'),
      );
    }
    return const OutlinedButton(
      onPressed: null,
      child: Text('未达成'),
    );
  }
}

class _BadgeCountCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const _BadgeCountCard({
    required this.icon,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              material.Badge(
                label: Text('$count'),
                isLabelVisible: count > 0,
                child: Icon(icon, size: 32, color: cs.primary),
              ),
              const SizedBox(height: 6),
              Text(label, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final String kind;
  final String periodKey;
  final String earnedText;

  const _BadgeItem({
    required this.kind,
    required this.periodKey,
    required this.earnedText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Container(
      width: 108,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.primaryContainer),
      ),
      child: Column(
        children: [
          Icon(
            switch (kind) {
              'weekly' => Icons.workspace_premium,
              'monthly' => Icons.military_tech,
              _ => Icons.emoji_events,
            },
            size: 40,
            color: cs.primary,
          ),
          const SizedBox(height: 6),
          Text(SkinCatalog.badgeKindLabel(kind),
              style: theme.textTheme.titleSmall),
          Text(periodKey,
              style: TextStyle(fontSize: 10, color: cs.outline)),
          Text(earnedText, style: TextStyle(fontSize: 10, color: cs.outline)),
        ],
      ),
    );
  }
}
