import 'package:test/test.dart';
import 'package:knowledge_cloud/core/utils/json_repair.dart';

void main() {
  group('JsonRepair 容错解析', () {
    test('正常 JSON', () {
      final r = JsonRepair.extractObject('{"a": 1, "b": "x"}');
      expect(r?['a'], 1);
      expect(r?['b'], 'x');
    });

    test('剥除 ```json 围栏', () {
      const raw = '前缀文字\n```json\n{"ok": true}\n```\n后缀';
      final r = JsonRepair.extractObject(raw);
      expect(r?['ok'], isTrue);
    });

    test('截取首尾大括号（忽略噪声）', () {
      final r = JsonRepair.extractObject('噪声 {"k": 2} 噪声');
      expect(r?['k'], 2);
    });

    test('修复尾逗号', () {
      final r = JsonRepair.extractObject('{"a": 1,}');
      expect(r?['a'], 1);
    });

    test('字符串内裸换行转义', () {
      final r = JsonRepair.extractObject('{"a": "line1\nline2"}');
      expect(r?['a'], 'line1\nline2');
    });

    test('不可恢复返回 null', () {
      expect(JsonRepair.extractObject('没有 JSON'), isNull);
    });

    test('extractArray 基础解析', () {
      final arr = JsonRepair.extractArray('noise [1, 2,] noise');
      expect(arr, [1, 2]);
    });
  });
}
