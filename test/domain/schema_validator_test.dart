import 'package:test/test.dart';
import 'package:knowledge_cloud/domain/agent/schema_validator.dart';

void main() {
  group('SchemaValidator 节点校验', () {
    test('过滤非 Map / 空标题 / 超长标题', () {
      final out = SchemaValidator.validNodes([
        'not a map',
        {'title': ''},
        {'title': '一二三四五六七八九十一二三四五六七'}, // 17 字
        {'title': '合法节点'},
      ]);
      expect(out.length, 1);
      expect(out.single['title'], '合法节点');
    });

    test('学段白名单与等级 clamp', () {
      final out = SchemaValidator.validNodes([
        {'title': 'A', 'grade_tag': '高中', 'basic_level': 9, 'necessity': -1},
        {'title': 'B', 'grade_tag': '大学'},
        {'title': 'C', 'grade_tag': '初中'},
      ]);
      expect(out.length, 2);
      final a = out.firstWhere((e) => e['title'] == 'A');
      expect(a['basic_level'], 5);
      expect(a['necessity'], 1);
      expect(a['grade_tag'], '高中');
    });
  });

  group('SchemaValidator 边校验', () {
    final ids = {'a', 'b', 'c'};

    test('禁自环 / 非法关系 / 悬空引用 / 低置信 / 重复', () {
      final out = SchemaValidator.validEdges([
        {'from': 'a', 'to': 'a', 'relation': 'related'},
        {'from': 'a', 'to': 'b', 'relation': 'weird'},
        {'from': 'a', 'to': 'ghost', 'relation': 'related'},
        {'from': 'a', 'to': 'b', 'relation': 'related', 'confidence': 0.5},
        {'from': 'a', 'to': 'b', 'relation': 'related', 'confidence': 0.9},
        {'from': 'a', 'to': 'b', 'relation': 'related', 'confidence': 0.8},
      ], allNodeIds: ids);
      expect(out.length, 1);
      expect(out.single['confidence'], 0.9);
    });

    test('四类合法关系通过', () {
      final out = SchemaValidator.validEdges([
        for (final r in ['prerequisite', 'contains', 'related', 'inference'])
          {'from': 'a', 'to': 'b', 'relation': r, 'confidence': 0.7},
      ], allNodeIds: ids);
      expect(out.length, 4);
    });

    test('capRelated 按置信裁剪上限', () {
      final edges = [
        for (var i = 0; i < 8; i++)
          {
            'from': 'a',
            'to': 'n$i',
            'relation': 'related',
            'confidence': 0.6 + i * 0.04,
          },
      ];
      final kept = SchemaValidator.capRelated(edges, maxPerNode: 3);
      expect(kept.length, 3);
      expect(kept.first['confidence'], closeTo(0.88, 0.001));
    });

    test('evidenceSupported 原文包含检测', () {
      const src = '光合作用是植物利用光能将二氧化碳和水转化为有机物并释放氧气的过程';
      expect(SchemaValidator.evidenceSupported('二氧化碳和水转化', src), isTrue);
      expect(SchemaValidator.evidenceSupported('线粒体呼吸作用', src), isFalse);
      expect(SchemaValidator.evidenceSupported('', src), isFalse);
    });
  });
}
