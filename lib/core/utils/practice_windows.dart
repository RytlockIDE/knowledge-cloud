/// 练习时间窗工具（纯 Dart，无 Flutter 依赖，可直接在 VM 单测中使用）。
class PracticeWindows {
  PracticeWindows._();

  /// 当日 00:00。
  static int startOfDay(DateTime now) =>
      DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;

  /// 本 ISO 周（周一 00:00）。
  static int startOfWeek(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final weekday = today.weekday; // 1=周一
    return today
        .subtract(Duration(days: weekday - 1))
        .millisecondsSinceEpoch;
  }

  /// 本学段：无固定窗口，返回 0（取全部已学）。
  static const int startOfStage = 0;

  /// ISO 周期键，如 2026-W38（含跨年边界修正）。
  static String weekKey(DateTime now) {
    final year = now.year;
    final dayOfYear = now.difference(DateTime(year, 1, 1)).inDays + 1;
    var week = ((dayOfYear - now.weekday + 10) / 7).floor();
    var keyYear = year;
    if (week == 0) {
      // 上一年最后一周
      keyYear--;
      week = _weeksInYear(keyYear);
    } else if (week == 53 && _weeksInYear(year) == 52) {
      // 实际属于下一年第 1 周
      keyYear++;
      week = 1;
    }
    return '$keyYear-W${week.toString().padLeft(2, '0')}';
  }

  static String monthKey(DateTime now) =>
      '${now.year}-${now.month.toString().padLeft(2, '0')}';

  static String yearKey(DateTime now) => '${now.year}';

  static int _weeksInYear(int year) {
    final jan1 = DateTime(year, 1, 1);
    final dec31 = DateTime(year, 12, 31);
    return (jan1.weekday == DateTime.thursday ||
            dec31.weekday == DateTime.thursday)
        ? 53
        : 52;
  }
}
