import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/app_db.dart';
import '../../data/repositories/chat_repository.dart';
import '../../data/repositories/graph_repository.dart';
import '../../services/llm/chat_client.dart';
import '../../services/llm/llm_router.dart';
import '../../services/network/connectivity_service.dart';
import '../../services/rag/rag_service.dart';
import '../../widgets/cloud_mascot.dart';

/// 消息模型（内存态，包含流式缓冲）。
class UiMessage {
  final String id;
  final String role;
  String content;
  String? providerId;
  List<String> citations;

  UiMessage({
    required this.id,
    required this.role,
    this.content = '',
    this.providerId,
    List<String>? citations,
  }) : citations = citations ?? const [];
}

class ChatController extends ChangeNotifier {
  final Ref ref;
  final List<UiMessage> messages = [];
  bool streaming = false;
  String? _sessionId;

  ChatController(this.ref);

  ChatRepository get _repo => ref.read(chatRepositoryProvider);
  RagService get _rag => ref.read(ragServiceProvider);

  Future<void> loadHistory() async {
    if (_sessionId != null) return;
    final sessions = await _repo.sessions();
    if (sessions.isNotEmpty) {
      _sessionId = sessions.first.id;
      final rows = await _repo.messagesOf(_sessionId!);
      for (final m in rows) {
        var citations = const <String>[];
        if (m.citationsJson != null && m.citationsJson!.isNotEmpty) {
          try {
            final parsed = jsonDecode(m.citationsJson!) as Map<String, dynamic>;
            citations =
                (parsed['nodes'] as List<dynamic>? ?? const []).cast<String>();
          } catch (_) {}
        }
        messages.add(UiMessage(
          id: m.id,
          role: m.role,
          content: m.content,
          providerId: m.providerId,
          citations: citations,
        ));
      }
      notifyListeners();
    }
  }

  Future<void> send(String text, {bool knowledgeMode = false}) async {
    if (text.trim().isEmpty || streaming) return;
    await loadHistory();
    _sessionId ??= (await _repo.createSession(mode: knowledgeMode ? 'rag' : 'chat')).id;

    final userMsg = UiMessage(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      role: 'user',
      content: text.trim(),
    );
    final botMsg = UiMessage(
      id: '${DateTime.now().microsecondsSinceEpoch}_b',
      role: 'assistant',
    );
    messages.addAll([userMsg, botMsg]);
    streaming = true;
    notifyListeners();

    await _repo.addMessage(
        sessionId: _sessionId!, role: 'user', content: userMsg.content);

    // RAG 检索上下文
    String systemContent =
        '你是"知识云"学习助手，面向学生，回答亲切易懂、条理清晰，适当使用 emoji 点缀。';
    if (knowledgeMode) {
      try {
        final hits = await _rag.search(userMsg.content, topK: 6);
        if (hits.isNotEmpty) {
          final ragCtx =
              hits.map((h) => '【知识片段】${h.content}').join('\n\n');
          systemContent =
              '你是"知识云"学习助手。请优先依据以下知识库材料回答；材料不足时用通用知识补充并说明。\n\n$ragCtx';
          botMsg.citations = hits
              .map((h) => h.nodeId)
              .whereType<String>()
              .toSet()
              .toList();
        }
      } catch (_) {
        // RAG 不可用时退化为普通对话
      }
    }

    // 最近 12 条历史（不含当前 bot 占位）
    final history = messages
        .take(messages.length - 1)
        .toList()
        .sublist((messages.length - 1 > 12 ? messages.length - 13 : 0)
            .clamp(0, messages.length - 1));
    final reqMessages = [
      for (final m in history) ChatMessage(m.role, m.content),
    ];

    try {
      await for (final event in router.stream(ChatRequest(
        messages: reqMessages,
        taskKind: knowledgeMode ? TaskKind.ragChat : TaskKind.simpleChat,
        systemOverride: systemContent,
      ))) {
        switch (event) {
          case DeltaEvent(:final text):
            botMsg.content += text;
            notifyListeners();
          case DoneEvent(:final providerId):
            botMsg.providerId = providerId;
          case ProviderSwitchedEvent(:final newProviderId):
            botMsg.providerId = newProviderId;
          case ErrorEvent():
            break;
        }
      }
    } catch (e) {
      if (botMsg.content.isEmpty) {
        botMsg.content =
            '抱歉，与本地模型通信失败：请确认已安装并启动 Ollama（设置页可检测）。';
      }
    }
    streaming = false;
    notifyListeners();

    await _repo.addMessage(
      sessionId: _sessionId!,
      role: 'assistant',
      content: botMsg.content,
      citationsJson: botMsg.citations.isEmpty
          ? null
          : '{"nodes": [${botMsg.citations.map((c) => '"$c"').join(",")}]}',
      providerId: botMsg.providerId,
    );
  }

  LlmRouter get router => ref.read(llmRouterProvider);
}

final chatControllerProvider =
    ChangeNotifierProvider.autoDispose<ChatController>((ref) {
  final c = ChatController(ref);
  ref.onDispose(c.dispose);
  return c;
});

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _input = TextEditingController();
  bool _knowledgeMode = true;

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _input.text;
    _input.clear();
    await ref
        .read(chatControllerProvider.notifier)
        .send(text, knowledgeMode: _knowledgeMode);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(chatControllerProvider);
    final palette = Theme.of(context).colorScheme;
    final online = ref.watch(isOnlineProvider);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: Row(
              children: [
                Text('对话', style: Theme.of(context).textTheme.titleLarge),
                const Spacer(),
                if (!online)
                  Tooltip(
                    message: '离线模式：由本地模型保障',
                    child: Chip(
                      avatar:
                          Icon(Icons.wifi_off, size: 14, color: palette.outline),
                      label: const Text('本地模式'),
                      labelStyle:
                          TextStyle(fontSize: 11, color: palette.outline),
                    ),
                  ),
                const SizedBox(width: 8),
                FilterChip(
                  selected: _knowledgeMode,
                  onSelected: (v) => setState(() => _knowledgeMode = v),
                  avatar: Icon(
                    Icons.auto_stories,
                    size: 16,
                    color: _knowledgeMode ? palette.onPrimary : palette.outline,
                  ),
                  label: const Text('知识库模式'),
                ),
              ],
            ),
          ),
          Expanded(
            child: controller.messages.isEmpty
                ? const _Welcome()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: controller.messages.length,
                    itemBuilder: (context, i) =>
                        _Bubble(msg: controller.messages[i]),
                  ),
          ),
          if (controller.messages.isNotEmpty &&
              controller.messages.last.citations.isNotEmpty)
            _CitationBar(nodeIds: controller.messages.last.citations),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _input,
                      minLines: 1,
                      maxLines: 4,
                      decoration: const InputDecoration(hintText: '问点什么吧…'),
                      onSubmitted: (_) => _send(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton.filled(
                    onPressed:
                        controller.streaming ? null : _send,
                    icon: controller.streaming
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.send_rounded),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CloudMascot(size: 96),
          const SizedBox(height: 16),
          Text('嗨！我是云朵小助手 ☁️',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            '可以问我任何学习问题，也可以打开「知识库模式」\n让我基于你的知识云来回答',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.outline),
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final UiMessage msg;

  const _Bubble({required this.msg});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    final isUser = msg.role == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(maxWidth: 640),
        decoration: BoxDecoration(
          color: isUser ? palette.primary : palette.surface,
          borderRadius: BorderRadius.circular(20).copyWith(
            bottomRight: isUser ? const Radius.circular(6) : null,
            bottomLeft: !isUser ? const Radius.circular(6) : null,
          ),
          border: Border.all(color: palette.outline, width: isUser ? 0 : 1),
        ),
        child: isUser
            ? Text(msg.content,
                style: TextStyle(color: palette.onPrimary, height: 1.5))
            : MarkdownBody(
                data: msg.content.isEmpty ? '…' : msg.content,
                selectable: true,
              ),
      ),
    );
  }
}

class _CitationBar extends ConsumerWidget {
  final List<String> nodeIds;

  const _CitationBar({required this.nodeIds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).colorScheme;
    final graph = ref.watch(graphRepositoryProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.link, size: 14, color: palette.outline),
          const SizedBox(width: 6),
          Text('引用知识点：',
              style: TextStyle(fontSize: 12, color: palette.outline)),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final id in nodeIds.take(6))
                    FutureBuilder<KnowledgeNode?>(
                      future: graph.nodeById(id),
                      builder: (context, snap) {
                        final title = snap.data?.title ?? '…';
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: ActionChip(
                            label:
                                Text(title, style: const TextStyle(fontSize: 11)),
                            onPressed: () => context.push('/node/$id'),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
