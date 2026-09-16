import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:window_manager/window_manager.dart';

import 'domain/reward/reward_service.dart';
import 'services/llm/llm_router.dart';
import 'services/network/connectivity_service.dart';
import 'services/settings_store.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // pdfrx 在未构建其组件时直接调用文档 API 所需的初始化
  pdfrxFlutterInitialize();

  await windowManager.ensureInitialized();
  const windowOptions = WindowOptions(
    minimumSize: Size(1080, 720),
    size: Size(1280, 832),
    center: true,
    title: '知识云',
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  final container = ProviderContainer();
  final settings = container.read(settingsStoreProvider);
  await settings.init();

  // 激励系统种子
  await container.read(rewardServiceProvider).seedSkins();

  // API Key 与网络状态
  await container.read(llmRouterProvider).loadApiKey();
  final online = await container.read(connectivityServiceProvider).isOnline();
  container.read(isOnlineProvider.notifier).state = online;

  runApp(UncontrolledProviderScope(container: container, child: const KnowledgeCloudApp()));
}
