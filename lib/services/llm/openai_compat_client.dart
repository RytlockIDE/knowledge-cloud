import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/errors/app_exception.dart';
import 'circuit_breaker.dart';
import 'chat_client.dart';

/// OpenAI 兼容云端客户端（/v1/chat/completions SSE、/v1/embeddings）。
/// 兼容 DeepSeek / 通义 / 智谱 / OpenAI 等。
class OpenaiCompatClient implements ChatClient {
  final Dio dio;
  final String baseUrl;
  final String apiKey;
  final String model;

  OpenaiCompatClient({
    required String baseUrl,
    required this.apiKey,
    this.model = 'deepseek-chat',
    Dio? dioOverride,
  })  : baseUrl = baseUrl.endsWith('/')
            ? baseUrl.substring(0, baseUrl.length - 1)
            : baseUrl,
        dio = dioOverride ??
            buildDio(
              baseUrl: baseUrl,
              headers: {'Authorization': 'Bearer $apiKey'},
            );

  @override
  String get id => 'cloud';

  @override
  String get displayName => '云端 API';

  @override
  Future<bool> isHealthy() async {
    try {
      final res = await dio.get(
        '/models',
        options: Options(
          responseType: ResponseType.json,
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      );
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
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
        '/chat/completions',
        data: {
          'model': model,
          'messages': messages,
          'stream': true,
          'temperature': req.temperature,
          if (req.maxTokens != null) 'max_tokens': req.maxTokens,
          if (req.jsonMode) 'response_format': {'type': 'json_object'},
        },
        options: Options(responseType: ResponseType.stream),
      );

      final stream = res.data.stream as Stream<List<int>>;
      final lineBuf = StringBuffer();
      String full = '';
      await for (final chunk in stream) {
        lineBuf.write(utf8.decode(chunk, allowMalformed: true));
        while (true) {
          final text = lineBuf.toString();
          final idx = text.indexOf('\n');
          if (idx < 0) break;
          final line = text.substring(0, idx).trim();
          lineBuf.clear();
          lineBuf.write(text.substring(idx + 1));
          if (line.isEmpty || line.startsWith(':')) continue;
          if (!line.startsWith('data:')) continue;
          final payload = line.substring(5).trim();
          if (payload == '[DONE]') {
            yield DoneEvent(full, providerId: id);
            return;
          }
          Map<String, dynamic> obj;
          try {
            obj = jsonDecode(payload) as Map<String, dynamic>;
          } catch (_) {
            continue;
          }
          final choices = obj['choices'] as List<dynamic>?;
          if (choices == null || choices.isEmpty) continue;
          final delta = choices.first as Map<String, dynamic>;
          final msg = delta['delta'] as Map<String, dynamic>?;
          final content = msg?['content'] as String? ?? '';
          if (content.isNotEmpty) {
            full += content;
            yield DeltaEvent(content);
          }
        }
      }
      yield DoneEvent(full, providerId: id);
    } catch (e) {
      throw LlmUnavailableException('云端请求失败: ${describeDioError(e)}', e);
    }
  }

  @override
  Future<List<List<double>>> embed(List<String> texts) async {
    throw const AppException('云端嵌入未启用（向量空间唯一性原则：仅本地嵌入）');
  }
}
