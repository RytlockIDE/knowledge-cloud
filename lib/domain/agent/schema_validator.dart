/// 结构化输出 schema 校验器（轻量手写校验）。
class SchemaValidator {
  const SchemaValidator._();

  /// 校验节点列表。返回合法节点。
  static List<Map<String, dynamic>> validNodes(List<dynamic> raw) {
    final out = <Map<String, dynamic>>[];
    for (final item in raw) {
      if (item is! Map<String, dynamic>) continue;
      final title = item['title']?.toString().trim() ?? '';
      if (title.isEmpty || title.length > 16) continue;
      final gradeTag = item['grade_tag']?.toString() ?? '通用';
      if (!const ['小学', '初中', '高中', '通用'].contains(gradeTag)) continue;
      int basic = _toInt(item['basic_level'], 3);
      int necessity = _toInt(item['necessity'], 2);
      out.add({
        'title': title,
        'summary': (item['summary']?.toString() ?? '').trim(),
        'content': (item['content']?.toString() ?? '').trim(),
        'grade_tag': gradeTag,
        'basic_level': basic.clamp(1, 5),
        'necessity': necessity.clamp(1, 3),
        'evidence': (item['evidence']?.toString() ?? '').trim(),
      });
    }
    return out;
  }

  /// 校验边列表。返回合法边；[allNodeIds] 过滤悬空引用。
  static List<Map<String, dynamic>> validEdges(
    List<dynamic> raw, {
    Set<String>? allNodeIds,
  }) {
    const allowedRelations = {'prerequisite', 'contains', 'related', 'inference'};
    final seen = <String>{};
    final out = <Map<String, dynamic>>[];
    for (final item in raw) {
      if (item is! Map<String, dynamic>) continue;
      final from = item['from']?.toString() ?? '';
      final to = item['to']?.toString() ?? '';
      final relation = item['relation']?.toString() ?? '';
      if (from.isEmpty || to.isEmpty || from == to) continue; // 自环
      if (!allowedRelations.contains(relation)) continue;
      if (allNodeIds != null && (!allNodeIds.contains(from) || !allNodeIds.contains(to))) {
        continue;
      }
      final key = '$from|$to|$relation';
      double confidence = _toDouble(item['confidence'], 0.5);
      if (confidence < 0.6) continue; // 低置信
      // 去重键必须在全部质量校验通过后才注册，避免低质条目堵掉高质重复
      if (!seen.add(key)) continue;
      out.add({
        'from': from,
        'to': to,
        'relation': relation,
        'confidence': confidence.clamp(0.0, 1.0),
        'reason': (item['reason']?.toString() ?? '').trim(),
      });
    }
    return out;
  }

  /// 每节点 related 边数上限裁剪（按 confidence 保留最高）。
  static List<Map<String, dynamic>> capRelated(
    List<Map<String, dynamic>> edges, {
    int maxPerNode = 6,
  }) {
    final relatedCount = <String, int>{};
    final kept = <Map<String, dynamic>>[];
    final sorted = [...edges]..sort((a, b) =>
        (b['confidence'] as double).compareTo(a['confidence'] as double));
    for (final e in sorted) {
      if (e['relation'] == 'related') {
        final c1 = relatedCount[e['from']] ?? 0;
        final c2 = relatedCount[e['to']] ?? 0;
        if (c1 >= maxPerNode || c2 >= maxPerNode) continue;
        relatedCount[e['from']] = c1 + 1;
        relatedCount[e['to']] = c2 + 1;
      }
      kept.add(e);
    }
    return kept;
  }

  /// 幻觉过滤：evidence 与原文包含率 > 0.5。
  static bool evidenceSupported(String evidence, String sourceText) {
    if (evidence.isEmpty) return false;
    final ev = evidence.replaceAll(RegExp(r'\s'), '');
    final src = sourceText.replaceAll(RegExp(r'\s'), '');
    if (src.isEmpty) return false;
    // 取 evidence 中心 20 字片段检测包含
    final probe = ev.length <= 20 ? ev : ev.substring(ev.length ~/ 2 - 10, ev.length ~/ 2 + 10);
    return src.contains(probe);
  }

  static int _toInt(Object? v, int def) =>
      v is int ? v : (v is num ? v.toInt() : (int.tryParse('$v') ?? def));

  static double _toDouble(Object? v, double def) =>
      v is double ? v : (v is num ? v.toDouble() : (double.tryParse('$v') ?? def));
}
