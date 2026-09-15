import 'dart:convert';

import 'package:dio/dio.dart';

/// 维基百科 REST 客户端（zh.wikipedia.org REST API）。
/// 抓取主题摘要与相关主题，用于智能体"自主抓取"阶段。
class WikiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://zh.wikipedia.org/api/rest_v1',
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
      headers: {'User-Agent': 'KnowledgeCloud/1.0 (student knowledge app)'},
    ),
  );

  /// 主题摘要。
  Future<WikiPage?> fetchSummary(String title) async {
    try {
      final res = await _dio.get('/page/summary/${Uri.encodeComponent(title)}');
      final data = res.data as Map<String, dynamic>;
      if (data['type'] == 'standard') {
        return WikiPage(
          title: data['title'] as String? ?? title,
          extract: data['extract'] as String? ?? '',
          url: data['content_urls']?['desktop']?['page'] as String? ?? '',
        );
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  /// 相关主题（基于页面链接），最多 [limit] 个。
  Future<List<String>> fetchRelated(String title, {int limit = 8}) async {
    try {
      final res = await _dio.get('/page/related/${Uri.encodeComponent(title)}');
      final data = res.data as Map<String, dynamic>;
      final pages = data['pages'] as List<dynamic>? ?? [];
      return pages
          .map((p) => (p as Map<String, dynamic>)['title'] as String? ?? '')
          .where((t) => t.isNotEmpty)
          .take(limit)
          .toList();
    } catch (_) {
      return const [];
    }
  }

  /// 主题正文（action API，纯文本提取，前 [chars] 字）。
  Future<String> fetchPlainText(String title, {int chars = 6000}) async {
    try {
      final res = await _dio.get<String>(
        'https://zh.wikipedia.org/w/api.php',
        queryParameters: {
          'action': 'query',
          'format': 'json',
          'prop': 'extracts',
          'explaintext': 1,
          'redirects': 1,
          'titles': title,
        },
      );
      final data = jsonDecode(res.data ?? '{}') as Map<String, dynamic>;
      final pages = data['query']?['pages'] as Map<String, dynamic>?;
      if (pages == null || pages.isEmpty) return '';
      final first = pages.values.first as Map<String, dynamic>;
      final extract = first['extract'] as String? ?? '';
      return extract.length > chars ? extract.substring(0, chars) : extract;
    } catch (_) {
      return '';
    }
  }
}

class WikiPage {
  final String title;
  final String extract;
  final String url;

  const WikiPage({required this.title, required this.extract, required this.url});
}
