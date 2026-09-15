import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/app_db.dart';
import '../../data/repositories/feed_repository.dart';
import '../../domain/agent/orchestrator.dart';
import '../../services/ingest/document_parser.dart';
import '../../widgets/cloud_mascot.dart';

/// 文档列表 Provider。
final feedDocsProvider = FutureProvider<List<FedDocument>>((ref) async {
  return ref.watch(feedRepositoryProvider).all();
});

/// 投喂管理页：拖拽/选择上传 → 解析 → 一键生成子知识云。
class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({super.key});

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> {
  bool _uploading = false;
  final _topicCtrl = TextEditingController();

  @override
  void dispose() {
    _topicCtrl.dispose();
    super.dispose();
  }

  static const _typeByExt = {
    'txt': 'txt',
    'md': 'md',
    'markdown': 'md',
    'pdf': 'pdf',
    'docx': 'docx',
  };

  Future<void> _pickAndUpload() async {
    if (_uploading) return;
    const typeGroup = XTypeGroup(
      label: '文档',
      extensions: ['txt', 'md', 'markdown', 'pdf', 'docx'],
    );
    final file = await openFile(acceptedTypeGroups: [typeGroup]);
    if (file == null) return;
    final ext = file.name.split('.').last.toLowerCase();
    final fileType = _typeByExt[ext];
    if (fileType == null) {
      _snack('不支持的文件类型：$ext');
      return;
    }
    setState(() => _uploading = true);
    try {
      // 创建文档记录
      final doc = await ref.read(feedRepositoryProvider).create(
            title: file.name,
            fileType: fileType,
            rawPath: file.path,
          );
      await ref.read(feedRepositoryProvider).update(doc.id, status: 'parsed');
      // 解析文本
      final text =
          await const DocumentParser().parse(file.path, fileType);
      await ref.read(feedRepositoryProvider).update(doc.id, parsedText: text);
      ref.invalidate(feedDocsProvider);
      _snack('解析完成，可点击「生成子云」');
    } catch (e) {
      _snack('解析失败：$e');
    } finally {
      setState(() => _uploading = false);
    }
  }

  /// 运行智能体流水线生成子云。
  Future<void> _ingest(FedDocument doc) async {
    await ref.read(feedRepositoryProvider).update(doc.id, status: 'ingesting');
    ref.invalidate(feedDocsProvider);
    if (!mounted) return;
    _snack('智能体开始工作：抓取 → 迭代 → 关联推敲 → 定位…');

    final messenger = ScaffoldMessenger.of(context);
    try {
      final cloudId = await ref.read(agentOrchestratorProvider).run(
        docId: doc.id,
        onProgress: (p) {},
      );
      messenger.showSnackBar(SnackBar(
          content: Text('私有子云「${doc.title}」生成完成 ☁️（$cloudId）')));
    } catch (e) {
      await ref.read(feedRepositoryProvider).update(doc.id, status: 'failed',
          errorMsg: '$e');
      messenger.showSnackBar(SnackBar(content: Text('生成失败：$e')));
    }
    ref.invalidate(feedDocsProvider);
  }

  /// 自主抓取（联网）。
  Future<void> _crawl() async {
    final topic = _topicCtrl.text.trim();
    if (topic.isEmpty) {
      _snack('请输入要抓取的知识主题');
      return;
    }
    _snack('智能体正在从维基百科抓取「$topic」…');
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(agentOrchestratorProvider).run(crawlTopic: topic);
      messenger.showSnackBar(
          SnackBar(content: Text('「$topic」知识抓取并入主云完成 ☁️')));
      _topicCtrl.clear();
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('抓取失败：$e')));
    }
  }

  void _snack(String msg) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    final docs = ref.watch(feedDocsProvider).value ?? const <FedDocument>[];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('投喂管理', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text('投喂的文档会生成独立的「私有子云」，与主知识云区分显示',
                style: TextStyle(color: palette.outline, fontSize: 12)),
            const SizedBox(height: 20),
            // 上传区
            Material(
              color: palette.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: _pickAndUpload,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 36),
                  child: Column(
                    children: [
                      if (_uploading)
                        const CircularProgressIndicator()
                      else ...[
                        Icon(Icons.cloud_upload_outlined,
                            size: 40, color: palette.primary),
                        const SizedBox(height: 8),
                        const Text('点击选择文档（txt / md / pdf / docx）'),
                        Text('支持拖拽到窗口快速投喂',
                            style: TextStyle(
                                fontSize: 11, color: palette.outline)),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 自主抓取
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _topicCtrl,
                    decoration: const InputDecoration(
                        hintText: '或输入主题让智能体自主抓取（联网，如：勾股定理）'),
                    onSubmitted: (_) => _crawl(),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: _crawl,
                  icon: const Icon(Icons.travel_explore, size: 18),
                  label: const Text('智能抓取'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 文档列表
            Text('已投喂文档', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Expanded(
              child: docs.isEmpty
                  ? const EmptyState(
                      message: '还没有投喂过文档', icon: Icons.upload_file)
                  : ListView.separated(
                      itemCount: docs.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, i) {
                        final d = docs[i];
                        return _DocCard(
                          doc: d,
                          onIngest: () => _ingest(d),
                          onDelete: () async {
                            await ref
                                .read(feedRepositoryProvider)
                                .delete(d.id);
                            ref.invalidate(feedDocsProvider);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DocCard extends StatelessWidget {
  final FedDocument doc;
  final VoidCallback onIngest;
  final VoidCallback onDelete;

  const _DocCard(
      {required this.doc, required this.onIngest, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    final (icon, statusText, statusColor) = switch (doc.status) {
      'pending' => (Icons.hourglass_empty, '待解析', palette.outline),
      'parsed' => (Icons.description, '已解析', palette.primary),
      'ingesting' => (Icons.sync, '智能体处理中…', palette.primary),
      'done' => (Icons.cloud_done, '已生成 ${doc.nodeCount} 节点', const Color(0xFF36B37E)),
      'failed' => (Icons.error_outline, '失败：${doc.errorMsg ?? ''}',
          palette.error),
      _ => (Icons.help_outline, doc.status, palette.outline),
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: palette.outline),
      ),
      child: Row(
        children: [
          Icon(icon, color: statusColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doc.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  '${doc.fileType.toUpperCase()} · $statusText',
                  style: TextStyle(fontSize: 12, color: statusColor),
                ),
              ],
            ),
          ),
          if (doc.status == 'parsed' || doc.status == 'failed')
            FilledButton.tonal(
              onPressed: onIngest,
              child: const Text('生成子云'),
            ),
          IconButton(onPressed: onDelete, icon: const Icon(Icons.delete_outline))
        ],
      ),
    );
  }
}
