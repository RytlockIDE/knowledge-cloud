/// 全局配置：端点、模型名、常量。
class AppConfig {
  AppConfig._();

  /// Ollama 默认地址
  static const String defaultOllamaBaseUrl = 'http://localhost:11434';

  /// 默认本地对话模型
  static const String defaultLocalChatModel = 'qwen2.5:3b';

  /// 默认本地嵌入模型
  static const String defaultLocalEmbedModel = 'nomic-embed-text';

  /// 云端默认（OpenAI 兼容，DeepSeek 示例）
  static const String defaultCloudBaseUrl = 'https://api.deepseek.com/v1';
  static const String defaultCloudModel = 'deepseek-chat';

  /// 云端探活超时（毫秒）
  static const int cloudProbeTimeoutMs = 3000;

  /// 熔断器参数
  static const int breakerFailureThreshold = 3;
  static const int breakerCooldownMs = 60000;

  /// RAG 分块参数
  static const int chunkSize = 800;
  static const int chunkOverlap = 50;

  /// 节点/边限制
  static const int maxRelatedPerNode = 6;
  static const double fallbackRelatedCosThreshold = 0.62;

  /// 智能体分批参数
  static const int maxChunksPerBatch = 6;
  static const int maxNodesPerBatch = 10;

  /// 首次启动预置的示例知识云主题
  static const String appDisplayName = '知识云';
}
