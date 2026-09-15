import 'dart:convert';

/// JSON 容错解析管线：
/// 剥离 ```json 围栏 → 截取首个'{'到最后'}' → 尝试解码
/// → 失败则修复（尾逗号/单引号/未转义换行）再试。
class JsonRepair {
  const JsonRepair._();

  /// 从 LLM 原始输出中提取并解析 JSON 对象。
  /// 返回 null 表示终态失败。
  static Map<String, dynamic>? extractObject(String raw) {
    final candidate = _candidate(raw);
    if (candidate == null) return null;
    final obj = _tryDecode(candidate);
    if (obj is Map<String, dynamic>) return obj;
    final repaired = _repair(candidate);
    final obj2 = _tryDecode(repaired);
    if (obj2 is Map<String, dynamic>) return obj2;
    return null;
  }

  /// 从 LLM 原始输出中提取并解析 JSON 数组。
  static List<dynamic>? extractArray(String raw) {
    final trimmed = raw.trim();
    final start = trimmed.indexOf('[');
    final end = trimmed.lastIndexOf(']');
    if (start < 0 || end <= start) return null;
    final candidate = trimmed.substring(start, end + 1);
    final arr = _tryDecode(candidate);
    if (arr is List<dynamic>) return arr;
    final repaired = _repair(candidate);
    final arr2 = _tryDecode(repaired);
    if (arr2 is List<dynamic>) return arr2;
    return null;
  }

  static String? _candidate(String raw) {
    var text = raw.trim();
    // 剥离 markdown 代码围栏
    final fence = RegExp(r'```(?:json)?\s*([\s\S]*?)\s*```', multiLine: true);
    final m = fence.firstMatch(text);
    if (m != null) text = m.group(1)!;
    final start = text.indexOf('{');
    final end = text.lastIndexOf('}');
    if (start < 0 || end <= start) return null;
    return text.substring(start, end + 1);
  }

  static dynamic _tryDecode(String s) {
    try {
      return jsonDecode(s);
    } catch (_) {
      return null;
    }
  }

  /// 常见 LLM 输出错误的启发式修复。
  static String _repair(String s) {
    var out = s;
    // 移除尾逗号：,] 或 ,}（String.replaceAll 不支持 $1 反向引用，需用 Mapped）
    out = out.replaceAllMapped(
        RegExp(r',\s*([\]}])'), (m) => m.group(1)!);
    // 字符串内的裸换行/制表符转义
    if (out.contains('\n')) {
      out = _escapeInsideStrings(out);
    }
    return out;
  }

  /// 将字符串字面量内部的裸换行转义。
  static String _escapeInsideStrings(String s) {
    final buf = StringBuffer();
    var inString = false;
    var escaped = false;
    for (final code in s.codeUnits) {
      final ch = String.fromCharCode(code);
      if (escaped) {
        buf.write(ch);
        escaped = false;
        continue;
      }
      if (ch == r'\') {
        buf.write(ch);
        escaped = true;
        continue;
      }
      if (ch == '"') {
        inString = !inString;
        buf.write(ch);
        continue;
      }
      if (inString && ch == '\n') {
        buf.write(r'\n');
        continue;
      }
      if (inString && ch == '\r') {
        continue;
      }
      if (inString && ch == '\t') {
        buf.write(r'\t');
        continue;
      }
      buf.write(ch);
    }
    return buf.toString();
  }
}
