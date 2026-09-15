import 'package:test/test.dart';
import 'package:knowledge_cloud/domain/reward/skin_catalog.dart';

void main() {
  group('SkinCatalog 种子数据完整性', () {
    test('id 唯一', () {
      final ids = SkinCatalog.seeds.map((s) => s.id).toSet();
      expect(ids.length, SkinCatalog.seeds.length);
    });

    test('兑换类必须有正价；达成类必须有阈值', () {
      for (final s in SkinCatalog.seeds) {
        if (s.unlockType == 'redeem') {
          expect(s.costPoints > 0, isTrue, reason: s.id);
        } else {
          expect(s.thresholdPoints >= 0, isTrue, reason: s.id);
        }
      }
    });

    test('勋章约束键合法（weekly/monthly/annual）', () {
      const allowed = {'weekly', 'monthly', 'annual'};
      for (final s in SkinCatalog.seeds) {
        for (final k in s.requiredBadges.keys) {
          expect(allowed.contains(k), isTrue, reason: s.id);
        }
      }
    });

    test('每类别至少含一款默认（threshold 0）皮肤', () {
      for (final c in ['theme', 'mascot', 'node_fx', 'frame']) {
        final hasDefault = SkinCatalog.seeds.any(
          (s) =>
              s.category == c &&
              s.unlockType == 'threshold' &&
              s.thresholdPoints == 0,
        );
        expect(hasDefault, isTrue, reason: c);
      }
    });

    test('年度限定皮肤存在且需年度勋章', () {
      final graduation = SkinCatalog.seeds
          .firstWhere((s) => s.id == 'theme_graduation');
      expect(graduation.requiredBadges['annual'], 1);
      expect(graduation.costPoints, 500);
    });
  });
}
