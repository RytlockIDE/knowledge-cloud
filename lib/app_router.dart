import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/chat/chat_page.dart';
import '../features/cloud_map/cloud_map_page.dart';
import '../features/distill/distill_page.dart';
import '../features/feed/feed_page.dart';
import '../features/node_detail/node_detail_page.dart';
import '../features/practice/practice_page.dart';
import '../features/quiz_runner/quiz_runner_page.dart';
import '../features/reward_center/reward_center_page.dart';
import '../features/settings/settings_page.dart';
import '../features/shell/app_shell.dart';

/// 根导航 Key（节点详情全屏打开）。
final rootNavKey = GlobalKey<NavigatorState>();

/// 应用路由。
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: '/chat',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/chat', builder: (_, __) => const ChatPage()),
          GoRoute(path: '/cloud', builder: (_, __) => const CloudMapPage()),
          GoRoute(path: '/feed', builder: (_, __) => const FeedPage()),
          GoRoute(path: '/distill', builder: (_, __) => const DistillPage()),
          GoRoute(path: '/practice', builder: (_, __) => const PracticePage()),
          GoRoute(
            path: '/quiz/:id',
            builder: (_, state) => QuizRunnerPage(
              quizId: state.pathParameters['id']!,
              kind: state.uri.queryParameters['kind'] ?? 'daily',
            ),
          ),
          GoRoute(path: '/rewards', builder: (_, __) => const RewardCenterPage()),
          GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),
        ],
      ),
      GoRoute(
        path: '/node/:id',
        parentNavigatorKey: rootNavKey,
        builder: (_, state) =>
            NodeDetailPage(nodeId: state.pathParameters['id']!),
      ),
    ],
  );
});
