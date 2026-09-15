/// 应用统一异常。
class AppException implements Exception {
  final String message;
  final Object? cause;

  const AppException(this.message, [this.cause]);

  @override
  String toString() => 'AppException: $message${cause != null ? ' ($cause)' : ''}';
}

/// LLM 提供方不可用（本地未安装 / 云端不可达）。
class LlmUnavailableException extends AppException {
  const LlmUnavailableException(super.message, [super.cause]);
}

/// 结构化输出解析终态失败。
class StructuredOutputException extends AppException {
  final String rawText;

  const StructuredOutputException(super.message, this.rawText, [super.cause]);
}
