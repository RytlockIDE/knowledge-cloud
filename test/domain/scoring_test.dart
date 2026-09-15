import 'package:test/test.dart';
import 'package:knowledge_cloud/domain/quiz/scoring.dart';

void main() {
  group('Scoring 阶梯计分边界', () {
    test('新知掌握练 / 日练：必须 100% 才得 1 分', () {
      expect(Scoring.score('new_knowledge', 99.9), 0);
      expect(Scoring.score('new_knowledge', 100), 1);
      expect(Scoring.score('daily', 99), 0);
      expect(Scoring.score('daily', 100), 1);
    });

    test('周练 / 月练：60/75/90 边界', () {
      for (final kind in ['weekly', 'monthly']) {
        expect(Scoring.score(kind, 59), 0, reason: '$kind 59');
        expect(Scoring.score(kind, 60), 1, reason: '$kind 60');
        expect(Scoring.score(kind, 74), 1, reason: '$kind 74');
        expect(Scoring.score(kind, 75), 2, reason: '$kind 75');
        expect(Scoring.score(kind, 89), 2, reason: '$kind 89');
        expect(Scoring.score(kind, 90), 3, reason: '$kind 90');
        expect(Scoring.score(kind, 100), 3, reason: '$kind 100');
      }
    });

    test('年度总练：十倍计分', () {
      expect(Scoring.score('annual', 59), 0);
      expect(Scoring.score('annual', 60), 10);
      expect(Scoring.score('annual', 75), 20);
      expect(Scoring.score('annual', 90), 30);
      expect(Scoring.score('annual', 100), 30);
    });

    test('满分判定与勋章种类', () {
      expect(Scoring.isPerfect(100), isTrue);
      expect(Scoring.isPerfect(99), isFalse);
      expect(Scoring.badgeKind('weekly'), 'weekly');
      expect(Scoring.badgeKind('monthly'), 'monthly');
      expect(Scoring.badgeKind('annual'), 'annual');
      expect(Scoring.badgeKind('daily'), isNull);
    });
  });
}
