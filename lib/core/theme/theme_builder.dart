import 'package:flutter/material.dart';

import 'tokens.dart';

/// 由调色板构建 Material 主题（皮肤 Mod 通过传入不同 [AppPalette] 生效）。
ThemeData buildTheme(AppPalette p) {
  final colorScheme = ColorScheme(
    brightness: p.brightness,
    primary: p.primary,
    onPrimary: p.onPrimary,
    secondary: p.accent,
    onSecondary: p.onPrimary,
    error: p.danger,
    onError: Colors.white,
    surface: p.surface,
    onSurface: p.textPrimary,
    surfaceContainerHighest: p.surfaceVariant,
    outline: p.outline,
  );

  final base = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: p.background,
    fontFamily: 'MiSans',
    fontFamilyFallback: const ['Microsoft YaHei UI', 'PingFang SC', 'sans-serif'],
  );

  return base.copyWith(
    cardTheme: CardThemeData(
      color: p.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(p.radiusCard),
        side: BorderSide(color: p.outline, width: 1),
      ),
      margin: EdgeInsets.zero,
    ),
    dividerTheme: DividerThemeData(color: p.outline, thickness: 1, space: 1),
    appBarTheme: AppBarTheme(
      backgroundColor: p.background,
      foregroundColor: p.textPrimary,
      elevation: 0,
      centerTitle: false,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: p.surface,
      indicatorColor: p.primary.withValues(alpha: 0.15),
      selectedIconTheme: IconThemeData(color: p.primary),
      unselectedIconTheme: IconThemeData(color: p.textSecondary),
      selectedLabelTextStyle: TextStyle(
        color: p.primary,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelTextStyle: TextStyle(color: p.textSecondary, fontSize: 12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: p.surfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(p.radiusControl),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(p.radiusControl),
        borderSide: BorderSide(color: p.primary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: p.primary,
        foregroundColor: p.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(p.radiusControl),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: p.primary,
        side: BorderSide(color: p.primary.withValues(alpha: 0.5)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(p.radiusControl),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: p.surfaceVariant,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      labelStyle: TextStyle(color: p.textPrimary, fontSize: 12),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: p.textPrimary,
      contentTextStyle: TextStyle(
        color: p.brightness == Brightness.dark ? p.background : Colors.white,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(p.radiusControl),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: p.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(p.radiusCard),
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: p.textPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        color: p.brightness == Brightness.dark ? p.background : Colors.white,
        fontSize: 12,
      ),
    ),
  );
}
