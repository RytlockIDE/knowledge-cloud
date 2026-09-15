import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_exception.dart';
import '../network/connectivity_service.dart';
import '../settings_store.dart';
import 'circuit_breaker.dart';
import 'chat_client.dart';
import 'ollama_client.dart';
import 'openai_compat_client.dart';

/// 混合算力路由器：
/// - 按任务分级选择本地/云端（simpleChat/ragChat→本地；结构化任务→云端）
/// - 离线强制本地；云端不可用自动降级本地（发 ProviderSwitchedEvent 通知 UI）
/// - 本地失败且在线时尝试云端救场
class LlmRouter {
  final Ref ref;
  final CircuitBreaker breaker = CircuitBreaker();

  LlmRouter(this.ref);

  SettingsStore get _settings => ref.read(settingsStoreProvider);

  OllamaClient? _ollama;
  String _ollamaKey = '';

  OllamaClient ollama() {
    final s = _settings;
    final key = '${s.ollamaBaseUrl}|${s.localChatModel}|${s.localEmbedModel}';
    if (_ollama == null || _ollamaKey != key) {
      _ollama = OllamaClient(
        baseUrl: s.ollamaBaseUrl,
        chatModel: s.localChatModel,
        embedModel: s.localEmbedModel,
      );
      _ollamaKey = key;
    }
    return _ollama!;
  }

  OpenaiCompatClient? _cloud;
  String _cloudKey = '';

  /// 云端客户端（需要 API Key 已加载）。
  OpenaiCompatClient cloud() {
    final s = _settings;
    final key = '${s.cloudBaseUrl}|${s.cloudModel}|${s.apiKeyCache}';
    if (_cloud == null || _cloudKey != key) {
      _cloud = OpenaiCompatClient(
        baseUrl: s.cloudBaseUrl,
        apiKey: s.apiKeyCache,
        model: s.cloudModel,
      );
      _cloudKey = key;
    }
    return _cloud!;
  }

  bool get cloudConfigured => _settings.apiKeyCache.isNotEmpty;

  /// 启动时/设置变更时加载 API Key 到内存缓存。
  Future<void> loadApiKey() async {
    _settings.apiKeyCache = await _settings.apiKey;
  }

  /// 云端是否可用（熔断器未打开且探活成功）。
  Future<bool> cloudHealthy() async {
    if (!cloudConfigured || breaker.isOpen) return false;
    try {
      final ok = await cloud().isHealthy();
      ok ? breaker.recordSuccess() : breaker.recordFailure();
      return ok;
    } catch (_) {
      breaker.recordFailure();
      return false;
    }
  }

  /// 选择提供方。
  Future<ChatClient> select(TaskKind kind) async {
    final policy = _settings.routePolicy;
    if (policy == 'forceLocal') return ollama();
    if (policy == 'forceCloud') {
      if (!cloudConfigured) {
        throw const LlmUnavailableException('云端未配置 API Key');
      }
      return cloud();
    }

    final online = await ref.read(connectivityServiceProvider).isOnline();
    ref.read(isOnlineProvider.notifier).state = online;
    if (!online) return ollama();

    if (kind.preferCloud) {
      if (await cloudHealthy()) return cloud();
      return ollama(); // 降级本地
    } else {
      final localOk = await ollama().isHealthy();
      if (localOk) return ollama();
      if (await cloudHealthy()) return cloud();
      throw const LlmUnavailableException('本地与云端服务均不可用');
    }
  }

  /// 统一入口：路由 + 流式 + 降级。
  Stream<LlmEvent> stream(ChatRequest req) async* {
    final picked = await select(req.taskKind);
    final isCloud = picked.id == 'cloud';

    if (isCloud) {
      try {
        yield* picked.chatStream(req);
        breaker.recordSuccess();
      } on LlmUnavailableException {
        breaker.recordFailure();
        // 云端失败 → 降级本地
        yield const ProviderSwitchedEvent('ollama');
        yield* ollama().chatStream(req);
      }
      return;
    }

    // 本地任务
    try {
      yield* picked.chatStream(req);
    } on LlmUnavailableException {
      final canRescue = _settings.routePolicy != 'forceLocal' &&
          cloudConfigured &&
          await cloudHealthy();
      if (canRescue) {
        yield const ProviderSwitchedEvent('cloud');
        yield* cloud().chatStream(req);
      } else {
        rethrow;
      }
    }
  }

  /// 非流式便捷调用。
  Future<String> complete(ChatRequest req) async {
    final buf = StringBuffer();
    await for (final e in stream(req)) {
      if (e is DeltaEvent) buf.write(e.text);
    }
    return buf.toString();
  }
}

final llmRouterProvider = Provider<LlmRouter>((ref) => LlmRouter(ref));
