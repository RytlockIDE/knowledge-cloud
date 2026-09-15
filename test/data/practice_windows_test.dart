import 'package:test/test.dart';
import 'package:knowledge_cloud/core/utils/practice_windows.dart';

void main() {
  group('PracticeWindows 时间窗', () {
    // 2026-09-16 周三
    final now = DateTime(2026, 9, 16, 15, 30);

    test('startOfDay 当日零点', () {
      final ms = PracticeWindows.startOfDay(now);
      expect(DateTime.fromMillisecondsSinceEpoch(ms),
          DateTime(2026, 9, 16));
    });

    test('startOfWeek 回到周一（9月14日）', () {
      final ms = PracticeWindows.startOfWeek(now);
      expect(DateTime.fromMillisecondsSinceEpoch(ms),
          DateTime(2026, 9, 14));
    });

    test('周日本身 startOfWeek 仍是本周一', () {
      final sunday = DateTime(2026, 9, 20);
      final ms = PracticeWindows.startOfWeek(sunday);
      expect(DateTime.fromMillisecondsSinceEpoch(ms),
          DateTime(2026, 9, 14));
    });

    test('weekKey ISO 周编号', () {
      expect(PracticeWindows.weekKey(now), '2026-W38');
    });

    test('monthKey / yearKey', () {
      expect(PracticeWindows.monthKey(now), '2026-09');
      expect(PracticeWindows.yearKey(now), '2026');
    });

    test('跨年边界 ISO 周数', () {
      // 2026-01-01 周四 → 第 1 周（clamp）
      expect(PracticeWindows.weekKey(DateTime(2026, 1, 1)), '2026-W01');
      // 2025-12-29 周一 → ISO 2026-W01
      expect(PracticeWindows.weekKey(DateTime(2025, 12, 29)), '2026-W01');
    });
  });
}
