import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../services/network/connectivity_service.dart';
import '../../widgets/cloud_mascot.dart';

/// 应用外壳：左侧 NavigationRail + 内容区。
class AppShell extends ConsumerWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  static const _items = [
    ('/chat', Icons.forum_outlined, Icons.forum, '对话'),
    ('/cloud', Icons.cloud_outlined, Icons.cloud, '知识云图'),
    ('/feed', Icons.upload_file_outlined, Icons.upload_file, '投喂'),
    ('/distill', Icons.account_tree_outlined, Icons.account_tree, '蒸馏'),
    ('/practice', Icons.quiz_outlined, Icons.quiz, '练习'),
    ('/rewards', Icons.card_giftcard_outlined, Icons.card_giftcard, '奖励'),
    ('/settings', Icons.settings_outlined, Icons.settings, '设置'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.path;
    final selectedIndex = _items.indexWhere((i) => location.startsWith(i.$1));
    final online = ref.watch(isOnlineProvider);
    final palette = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
            onDestinationSelected: (i) => context.go(_items[i].$1),
            extended: false,
            minExtendedWidth: 140,
            labelType: NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Column(
                children: [
                  const CloudMascot(size: 44),
                  const SizedBox(height: 4),
                  Text('知识云',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          )),
                ],
              ),
            ),
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Tooltip(
                    message: online ? '在线：云端+本地算力' : '离线：本地算力保障中',
                    child: Icon(
                      online ? Icons.wifi : Icons.wifi_off,
                      size: 18,
                      color: online ? palette.primary : palette.outline,
                    ),
                  ),
                ),
              ),
            ),
            destinations: [
              for (final item in _items)
                NavigationRailDestination(
                  icon: Icon(item.$2),
                  selectedIcon: Icon(item.$3),
                  label: Text(item.$4),
                ),
            ],
          ),
          VerticalDivider(width: 1, color: palette.outline),
          Expanded(child: child),
        ],
      ),
    );
  }
}
