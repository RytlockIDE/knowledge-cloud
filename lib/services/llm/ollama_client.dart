import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/errors/app_exception.dart';
import 'circuit_breaker.dart';
import 'chat_client.dart';

/// Ollama 本地客户端（REST /api/chat 流式 NDJSON、/api/embed）。
class OllamaClient implements ChatClient {
  final Dio dio;
  final String baseUrl;
  String chatModel;
  String embedModel;

  OllamaClient({
    required this.baseUrl,
    this.chatModel = 'qwen2.5:3b',
    this.embedModel = 'nomic-embed-text',
    Dio? dioOverride,
  }) : dio = dioOverride ?? buildDio(baseUrl: baseUrl);

  @override
  String get id => 'ollama';

  @override
  String get displayName => 'Ollama 本地';

  @override
  Future<bool> isHealthy() async {
    try {
      final res = await dio.get('/api/tags',
          options: Options(responseType: ResponseType.json, receiveTimeout: const Duration(seconds: 5)));
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  /// 列出本地已安装模型。
  Future<List<String>> listModels() async {
    final res = await dio.get('/api/tags',
        options: Options(responseType: ResponseType.json));
    final data = res.data as Map<String, dynamic>;
    final models = data['models'] as List<dynamic>? ?? [];
    return models
        .map((m) => (m as Map<String, dynamic>)['name'] as String? ?? '')
        .where((n) => n.isNotEmpty)
        .toList();
  }

  @override
  Stream<LlmEvent> chatStream(ChatRequest req) async* {
    final messages = <Map<String, dynamic>>[
      if (req.systemOverride != null)
        {'role': 'system', 'content': req.systemOverride!},
      ...req.messages.map((m) => m.toJson()),
    ];
    try {
      final res = await dio.post(
        '/api/chat',
        data: {
          'model': chatModel,
          'messages': messages,
          'stream': true,
          'format': req.jsonMode ? 'json' : null,
          'options': {
            'temperature': req.temperature,
            if (req.maxTokens != null) 'num_predict': req.maxTokens,
          },
        },
        options: Options(responseType: ResponseType.stream),
      );

      final stream = res.data.stream as Stream<List<int>>;
      String full = '';
      await for (final chunk in stream) {
        final lines = utf8.decode(chunk, allowMalformed: true).split('\n');
        for (final line in lines) {
          final trimmed = line.trim();
          if (trimmed.isEmpty) continue;
          Map<String, dynamic> obj;
          try {
            obj = jsonDecode(trimmed) as Map<String, dynamic>;
          } catch (_) {
            continue;
          }
          final msg = obj['message'] as Map<String, dynamic>?;
          final content = msg?['content'] as String? ?? '';
          if (content.isNotEmpty) {
            full += content;
            yield DeltaEvent(content);
          }
          if (obj['done'] == true) {
            yield DoneEvent(full, providerId: id);
            return;
          }
        }
      }
      yield DoneEvent(full, providerId: id);
    } catch (e) {
      throw LlmUnavailableException('Ollama 请求失败: ${describeDioError(e)}', e);
    }
  }

  @override
  Future<List<List<double>>> embed(List<String> texts) async {
    final vectors = <List<double>>[];
    for (final text in texts) {
      final res = await dio.post(
        '/api/embed',
        data: {'model': embedModel, 'input': text},
        options: Options(responseType: ResponseType.json),
      );
      final data = res.data as Map<String, dynamic>;
      final embeddings = data['embeddings'] as List<dynamic>?;
      if (embeddings == null || embeddings.isEmpty) {
        throw AppException('Ollama 嵌入返回为空');
      }
      vectors.add(
        (embeddings.first as List<dynamic>).cast<double>(),
      );
    }
    return vectors;
  }
}
