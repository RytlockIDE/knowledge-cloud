/// 皮肤种子目录（内置皮肤 Mod 定义）。
/// unlock_type: redeem = 积分兑换（扣分）；threshold = 累计积分达成（不扣分）。
/// required_badges: {kind: count} 勋章约束。
class SkinSeed {
  final String id;
  final String name;
  final String category; // theme|mascot|node_fx|frame
  final String unlockType;
  final int costPoints;
  final int thresholdPoints;
  final Map<String, int> requiredBadges;
  final String description;
  final String? paletteRef;
  final int sortOrder;

  const SkinSeed({
    required this.id,
    required this.name,
    required this.category,
    required this.unlockType,
    this.costPoints = 0,
    this.thresholdPoints = 0,
    this.requiredBadges = const {},
    this.description = '',
    this.paletteRef,
    this.sortOrder = 0,
  });
}

class SkinCatalog {
  SkinCatalog._();

  static const List<SkinSeed> seeds = [
    // ---- 主题皮肤 ----
    SkinSeed(
      id: 'theme_cloud_light',
      name: '云间 · 经典',
      category: 'theme',
      unlockType: 'threshold',
      thresholdPoints: 0,
      description: '默认主题：晴空蓝与云朵白，明快清爽。',
      paletteRef: 'cloud_light',
      sortOrder: 1,
    ),
    SkinSeed(
      id: 'theme_starry_night',
      name: '星夜 · 深色',
      category: 'theme',
      unlockType: 'threshold',
      thresholdPoints: 0,
      description: '默认深色主题：深藏青星空底，夜间护眼。',
      paletteRef: 'starry_night',
      sortOrder: 2,
    ),
    SkinSeed(
      id: 'theme_sakura',
      name: '樱云物语',
      category: 'theme',
      unlockType: 'redeem',
      costPoints: 120,
      description: '樱花粉云间，温柔的学习氛围。需要 120 积分兑换。',
      paletteRef: 'sakura',
      sortOrder: 3,
    ),
    SkinSeed(
      id: 'theme_forest',
      name: '森语学堂',
      category: 'theme',
      unlockType: 'threshold',
      thresholdPoints: 150,
      description: '累计 150 积分自动解锁：森林绿与原木色，沉稳专注。',
      paletteRef: 'forest',
      sortOrder: 4,
    ),
    SkinSeed(
      id: 'theme_galaxy',
      name: '银河漫游者',
      category: 'theme',
      unlockType: 'redeem',
      costPoints: 300,
      requiredBadges: {'weekly': 2},
      description: '深紫银河 + 星尘点缀。需 300 积分兑换，且需 2 枚周勋章。',
      paletteRef: 'galaxy',
      sortOrder: 5,
    ),
    SkinSeed(
      id: 'theme_graduation',
      name: '毕业礼 · 年度限定',
      category: 'theme',
      unlockType: 'redeem',
      costPoints: 500,
      requiredBadges: {'annual': 1},
      description: '金色流苏与学位云朵。需 500 积分 + 1 枚年度勋章。',
      paletteRef: 'graduation',
      sortOrder: 6,
    ),

    // ---- 吉祥物皮肤 ----
    SkinSeed(
      id: 'mascot_default',
      name: '云朵小白',
      category: 'mascot',
      unlockType: 'threshold',
      thresholdPoints: 0,
      description: '默认吉祥物：一朵圆滚滚的小白云。',
      sortOrder: 1,
    ),
    SkinSeed(
      id: 'mascot_mochi',
      name: '麻薯云',
      category: 'mascot',
      unlockType: 'redeem',
      costPoints: 80,
      description: '软糯的奶黄麻薯云，笑起来会眯眼。80 积分兑换。',
      sortOrder: 2,
    ),
    SkinSeed(
      id: 'mascot_astronaut',
      name: '宇航云',
      category: 'mascot',
      unlockType: 'threshold',
      thresholdPoints: 200,
      description: '累计 200 积分自动解锁：戴着宇航头盔的探险云。',
      sortOrder: 3,
    ),
    SkinSeed(
      id: 'mascot_wizard',
      name: '魔法师云',
      category: 'mascot',
      unlockType: 'redeem',
      costPoints: 200,
      requiredBadges: {'monthly': 1},
      description: '手持星杖的知识魔法师。200 积分 + 1 枚月勋章。',
      sortOrder: 4,
    ),

    // ---- 知识云图节点特效 ----
    SkinSeed(
      id: 'nodefx_default',
      name: '经典节点',
      category: 'node_fx',
      unlockType: 'threshold',
      thresholdPoints: 0,
      description: '默认节点样式：柔和圆形节点。',
      sortOrder: 1,
    ),
    SkinSeed(
      id: 'nodefx_starrain',
      name: '星雨粒子',
      category: 'node_fx',
      unlockType: 'redeem',
      costPoints: 150,
      requiredBadges: {'weekly': 4},
      description: '节点化作流星星雨，知识在夜空闪烁。150 积分 + 4 枚周勋章。',
      sortOrder: 2,
    ),
    SkinSeed(
      id: 'nodefx_bubble',
      name: '气泡浮岛',
      category: 'node_fx',
      unlockType: 'threshold',
      thresholdPoints: 100,
      description: '累计 100 积分自动解锁：节点如气泡轻轻浮动。',
      sortOrder: 3,
    ),

    // ---- 界面边框 Mod ----
    SkinSeed(
      id: 'frame_default',
      name: '简约直角',
      category: 'frame',
      unlockType: 'threshold',
      thresholdPoints: 0,
      description: '默认边框。',
      sortOrder: 1,
    ),
    SkinSeed(
      id: 'frame_rainbow',
      name: '彩虹渐变',
      category: 'frame',
      unlockType: 'redeem',
      costPoints: 60,
      description: '窗口顶部彩虹渐变光带。60 积分兑换。',
      sortOrder: 2,
    ),
    SkinSeed(
      id: 'frame_festival',
      name: '节日彩灯',
      category: 'frame',
      unlockType: 'threshold',
      thresholdPoints: 300,
      description: '累计 300 积分自动解锁：边框挂上小彩灯。',
      sortOrder: 3,
    ),
  ];

  /// 勋章种类中文名。
  static String badgeKindLabel(String kind) => switch (kind) {
        'weekly' => '周勋章',
        'monthly' => '月勋章',
        'annual' => '年度勋章',
        _ => kind,
      };

  /// 皮肤类别中文名。
  static String categoryLabel(String category) => switch (category) {
        'theme' => '主题',
        'mascot' => '吉祥物',
        'node_fx' => '节点特效',
        'frame' => '边框',
        _ => category,
      };
}
