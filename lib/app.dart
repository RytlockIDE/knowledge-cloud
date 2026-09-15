import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_router.dart';
import 'core/theme/theme_builder.dart';
import 'core/theme/tokens.dart';
import 'services/settings_store.dart';

/// 当前调色板（皮肤主题装备后切换）。
final paletteProvider = StateProvider<AppPalette>((ref) {
  final skinId = ref.watch(themeSkinProvider);
  return paletteRegistry[skinId] ?? cloudLight;
});

/// 已装备的主题皮肤 id。
final themeSkinProvider =
    StateProvider<String>((ref) => ref.read(settingsStoreProvider).equippedThemeSkin);

/// 主题模式。
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  final mode = ref.read(settingsStoreProvider).themeMode;
  return switch (mode) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };
});

class KnowledgeCloudApp extends ConsumerWidget {
  const KnowledgeCloudApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(paletteProvider);
    final mode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: '知识云',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(palette),
      darkTheme: buildTheme(starryNight),
      themeMode: mode,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
