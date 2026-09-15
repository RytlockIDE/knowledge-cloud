import 'package:flutter/material.dart';

/// 主题设计 Token（云间浅色 / 星夜深色）。
/// 皮肤 Mod 可通过 [AppPalette] 覆盖整套颜色。
class AppPalette {
  final String id;
  final String name;
  final Brightness brightness;

  // 基底
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color outline;

  // 主色系
  final Color primary;
  final Color onPrimary;
  final Color accent;
  final Color success;
  final Color danger;

  // 文字
  final Color textPrimary;
  final Color textSecondary;

  // 知识云图
  final Color nodePrimaryStudent; // 小学
  final Color nodeJunior; // 初中
  final Color nodeSenior; // 高中
  final Color nodeGeneral; // 通用
  final Color glow; // 深色模式节点发光

  final double radiusCard; // 20
  final double radiusControl; // 12

  const AppPalette({
    required this.id,
    required this.name,
    required this.brightness,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.outline,
    required this.primary,
    required this.onPrimary,
    required this.accent,
    required this.success,
    required this.danger,
    required this.textPrimary,
    required this.textSecondary,
    required this.nodePrimaryStudent,
    required this.nodeJunior,
    required this.nodeSenior,
    required this.nodeGeneral,
    required this.glow,
    this.radiusCard = 20,
    this.radiusControl = 12,
  });

  /// 学段标签 → 节点颜色
  Color nodeColor(String gradeTag) {
    switch (gradeTag) {
      case '小学':
        return nodePrimaryStudent;
      case '初中':
        return nodeJunior;
      case '高中':
        return nodeSenior;
      default:
        return nodeGeneral;
    }
  }
}

/// 浅色「云间」
const AppPalette cloudLight = AppPalette(
  id: 'cloud_light',
  name: '云间 · 默认',
  brightness: Brightness.light,
  background: Color(0xFFF5F9FF),
  surface: Color(0xFFFFFFFF),
  surfaceVariant: Color(0xFFEAF2FF),
  outline: Color(0xFFD6E4F5),
  primary: Color(0xFF4C9AFF),
  onPrimary: Color(0xFFFFFFFF),
  accent: Color(0xFFFF9F43),
  success: Color(0xFF2ECC9B),
  danger: Color(0xFFFF6B6B),
  textPrimary: Color(0xFF1F2D3D),
  textSecondary: Color(0xFF7A8699),
  nodePrimaryStudent: Color(0xFFFFD166),
  nodeJunior: Color(0xFF4C9AFF),
  nodeSenior: Color(0xFF9B6BFF),
  nodeGeneral: Color(0xFF2ECC9B),
  glow: Color(0x334C9AFF),
);

/// 深色「星夜」
const AppPalette starryNight = AppPalette(
  id: 'starry_night',
  name: '星夜 · 深色',
  brightness: Brightness.dark,
  background: Color(0xFF0D1B2A),
  surface: Color(0xFF16263D),
  surfaceVariant: Color(0xFF1F3350),
  outline: Color(0xFF2C4160),
  primary: Color(0xFF6DB3FF),
  onPrimary: Color(0xFF0D1B2A),
  accent: Color(0xFFFFB25E),
  success: Color(0xFF3FE0AC),
  danger: Color(0xFFFF8080),
  textPrimary: Color(0xFFE8F1FB),
  textSecondary: Color(0xFF8FA3BC),
  nodePrimaryStudent: Color(0xFFFFD166),
  nodeJunior: Color(0xFF6DB3FF),
  nodeSenior: Color(0xFFB58CFF),
  nodeGeneral: Color(0xFF3FE0AC),
  glow: Color(0xFF8FD0FF),
);

/// 必要程度 → 节点直径
double nodeSizeForNecessity(int necessity) {
  switch (necessity) {
    case 1:
      return 48;
    case 2:
      return 36;
    default:
      return 26;
  }
}

/// ---- 皮肤主题调色板 ----

/// 樱云物语
const AppPalette sakura = AppPalette(
  id: 'sakura',
  name: '樱云物语',
  brightness: Brightness.light,
  background: Color(0xFFFFF5F7),
  surface: Color(0xFFFFFFFF),
  surfaceVariant: Color(0xFFFFE9EE),
  outline: Color(0xFFF6D4DD),
  primary: Color(0xFFE8709A),
  onPrimary: Color(0xFFFFFFFF),
  accent: Color(0xFFF5A65B),
  success: Color(0xFF5BC4A0),
  danger: Color(0xFFE86A6A),
  textPrimary: Color(0xFF3D2A33),
  textSecondary: Color(0xFF9B828D),
  nodePrimaryStudent: Color(0xFFFFC2D1),
  nodeJunior: Color(0xFFE8709A),
  nodeSenior: Color(0xFF9B6BFF),
  nodeGeneral: Color(0xFF5BC4A0),
  glow: Color(0x33E8709A),
);

/// 森语学堂
const AppPalette forest = AppPalette(
  id: 'forest',
  name: '森语学堂',
  brightness: Brightness.light,
  background: Color(0xFFF4F8F1),
  surface: Color(0xFFFFFFFF),
  surfaceVariant: Color(0xFFE6F0E0),
  outline: Color(0xFFD2E2C8),
  primary: Color(0xFF4E9B5F),
  onPrimary: Color(0xFFFFFFFF),
  accent: Color(0xFFE0A458),
  success: Color(0xFF3FA47C),
  danger: Color(0xFFD96C5F),
  textPrimary: Color(0xFF243327),
  textSecondary: Color(0xFF7A8B7E),
  nodePrimaryStudent: Color(0xFFE8C86B),
  nodeJunior: Color(0xFF4E9B5F),
  nodeSenior: Color(0xFF8B6BC4),
  nodeGeneral: Color(0xFF3FA47C),
  glow: Color(0x334E9B5F),
);

/// 银河漫游者
const AppPalette galaxy = AppPalette(
  id: 'galaxy',
  name: '银河漫游者',
  brightness: Brightness.dark,
  background: Color(0xFF130B2E),
  surface: Color(0xFF1E1445),
  surfaceVariant: Color(0xFF2A1D5E),
  outline: Color(0xFF3D2D7A),
  primary: Color(0xFF9D7BFF),
  onPrimary: Color(0xFF130B2E),
  accent: Color(0xFF6BE3FF),
  success: Color(0xFF54E0B8),
  danger: Color(0xFFFF7BA0),
  textPrimary: Color(0xFFEDE7FF),
  textSecondary: Color(0xFF9C8FC7),
  nodePrimaryStudent: Color(0xFFFFD166),
  nodeJunior: Color(0xFF9D7BFF),
  nodeSenior: Color(0xFF6BE3FF),
  nodeGeneral: Color(0xFF54E0B8),
  glow: Color(0xFFB9A0FF),
);

/// 毕业礼 · 年度限定
const AppPalette graduation = AppPalette(
  id: 'graduation',
  name: '毕业礼 · 年度限定',
  brightness: Brightness.dark,
  background: Color(0xFF12100C),
  surface: Color(0xFF1E1A12),
  surfaceVariant: Color(0xFF2C2517),
  outline: Color(0xFF453A22),
  primary: Color(0xFFE5B84B),
  onPrimary: Color(0xFF12100C),
  accent: Color(0xFFF0D289),
  success: Color(0xFFC9A84C),
  danger: Color(0xFFE57373),
  textPrimary: Color(0xFFF7EFD8),
  textSecondary: Color(0xFFB3A480),
  nodePrimaryStudent: Color(0xFFF0D289),
  nodeJunior: Color(0xFFE5B84B),
  nodeSenior: Color(0xFFF7EFD8),
  nodeGeneral: Color(0xFFC9A84C),
  glow: Color(0xFFF0D289),
);

/// 调色板注册表（皮肤主题引用）。
const Map<String, AppPalette> paletteRegistry = {
  'cloud_light': cloudLight,
  'starry_night': starryNight,
  'sakura': sakura,
  'forest': forest,
  'galaxy': galaxy,
  'graduation': graduation,
};
