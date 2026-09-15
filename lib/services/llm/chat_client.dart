/// 任务类型：决定混合算力路由的首选提供方。
enum TaskKind {
  simpleChat, // 本地
  ragChat, // 本地
  kgGenerate, // 云端
  kgRelate, // 云端
  distill, // 云端
  quizGenerate, // 云端
  crawlSummarize, // 云端
  embed, // 强制本地
}

extension TaskKindX on TaskKind {
  bool get preferCloud => switch (this) {
        TaskKind.kgGenerate ||
        TaskKind.kgRelate ||
        TaskKind.distill ||
        TaskKind.quizGenerate ||
        TaskKind.crawlSummarize =>
          true,
        _ => false,
      };
}

/// 路由策略（用户可在设置页覆盖）。
enum RoutePolicy { auto, forceLocal, forceCloud }

/// 统一对话请求。
class ChatRequest {
  final List<ChatMessage> messages;
  final TaskKind taskKind;
  final double temperature;
  final bool jsonMode;
  final int? maxTokens;
  final String? systemOverride;

  const ChatRequest({
    required this.messages,
    this.taskKind = TaskKind.simpleChat,
    this.temperature = 0.7,
    this.jsonMode = false,
    this.maxTokens,
    this.systemOverride,
  });
}

class ChatMessage {
  final String role; // system|user|assistant
  final String content;

  const ChatMessage(this.role, this.content);

  Map<String, dynamic> toJson() => {'role': role, 'content': content};
}

/// 统一 LLM 事件流。
sealed class LlmEvent {
  const LlmEvent();
}

/// 增量文本
class DeltaEvent extends LlmEvent {
  final String text;
  const DeltaEvent(this.text);
}

/// 完成
class DoneEvent extends LlmEvent {
  final String fullText;
  final String providerId;
  const DoneEvent(this.fullText, {this.providerId = ''});
}

/// 错误（recoverable=true 时路由器可降级重试）
class ErrorEvent extends LlmEvent {
  final Object error;
  final bool recoverable;
  const ErrorEvent(this.error, {this.recoverable = false});
}

/// 提供方切换（流式中断线续写等场景）
class ProviderSwitchedEvent extends LlmEvent {
  final String newProviderId;
  const ProviderSwitchedEvent(this.newProviderId);
}

/// 统一客户端抽象：Ollama 与 OpenAI 兼容云端都实现此接口。
abstract class ChatClient {
  String get id; // 'ollama' | 'cloud'
  String get displayName;

  Future<bool> isHealthy();

  /// 流式对话。失败时抛异常或发出 [ErrorEvent]。
  Stream<LlmEvent> chatStream(ChatRequest req);

  /// 嵌入（仅 Ollama 实现真正支持）。
  Future<List<List<double>>> embed(List<String> texts);
}

/// 非流式便捷方法：收集整个流。
Future<String> collectText(Stream<LlmEvent> stream) async {
  final buf = StringBuffer();
  await for (final e in stream) {
    if (e is DeltaEvent) buf.write(e.text);
    if (e is ErrorEvent && !e.recoverable) throw e.error;
  }
  return buf.toString();
}
