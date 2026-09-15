/// 计分规则引擎（用户指定的阶梯式规则，单一事实来源）。
///
/// 边界约定：[60,75)→1分；[75,90)→2分；≥90→3分；<60→0分。
/// 年度总练十倍计分。
class Scoring {
  const Scoring._();

  /// 按练习类型与正确率计算得分。
  static int score(String quizKind, double accuracyPercent) {
    switch (quizKind) {
      case 'new_knowledge':
      case 'daily':
        return accuracyPercent >= 100 ? 1 : 0;
      case 'weekly':
      case 'monthly':
        return _tier(accuracyPercent, 1);
      case 'annual':
        return _tier(accuracyPercent, 10);
      default:
        return 0;
    }
  }

  static int _tier(double acc, int multiplier) {
    if (acc >= 90) return 3 * multiplier;
    if (acc >= 75) return 2 * multiplier;
    if (acc >= 60) return 1 * multiplier;
    return 0;
  }

  /// 是否满分（发勋章）。
  static bool isPerfect(double accuracyPercent) => accuracyPercent >= 100;

  /// 练习类型对应的勋章种类（null = 无勋章）。
  static String? badgeKind(String quizKind) => switch (quizKind) {
        'weekly' => 'weekly',
        'monthly' => 'monthly',
        'annual' => 'annual',
        _ => null,
      };

  /// 练习类型中文名。
  static String kindLabel(String quizKind) => switch (quizKind) {
        'new_knowledge' => '新知掌握练',
        'daily' => '日练',
        'weekly' => '周练',
        'monthly' => '月练',
        'annual' => '年度总练',
        _ => '练习',
      };

  /// 练习类型默认题量。
  static int defaultCount(String quizKind) => switch (quizKind) {
        'new_knowledge' || 'daily' => 5,
        'weekly' => 10,
        'monthly' => 15,
        'annual' => 20,
        _ => 5,
      };

  /// 练习类型难度标签。
  static String difficultyLabel(String quizKind) => switch (quizKind) {
        'new_knowledge' || 'daily' => '基础',
        'weekly' || 'monthly' => '进阶',
        'annual' => '综合',
        _ => '基础',
      };
}
