import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/app_db.dart';
import '../../data/repositories/graph_repository.dart';
import '../cloud_map/cloud_map_page.dart' show learnedProvider;

/// 节点详情 FutureProvider。
final nodeDetailProvider =
    FutureProvider.family<(KnowledgeNode?, List<KnowledgeEdge>), String>(
        (ref, nodeId) async {
  final graph = ref.watch(graphRepositoryProvider);
  final node = await graph.nodeById(nodeId);
  final edges =
      node == null ? <KnowledgeEdge>[] : await graph.edgesOfNodes([node.id]);
  return (node, edges);
});

/// 节点详情页（全屏）。
class NodeDetailPage extends ConsumerWidget {
  final String nodeId;

  const NodeDetailPage({super.key, required this.nodeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).colorScheme;
    final detail = ref.watch(nodeDetailProvider(nodeId));
    final learned = ref.watch(learnedProvider(nodeId)).value ?? false;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: detail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败：$e')),
        data: (data) {
          final (node, edges) = data;
          if (node == null) {
            return const Center(child: Text('节点不存在'));
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            children: [
              // 面包屑
              if (node.layerPath.isNotEmpty)
                Text(node.layerPath.split('/').join('  ›  '),
                    style: TextStyle(color: palette.outline, fontSize: 12)),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(node.title,
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  Chip(
                    avatar: Icon(
                      learned ? Icons.verified : Icons.school_outlined,
                      size: 16,
                      color: learned
                          ? const Color(0xFF36B37E)
                          : palette.outline,
                    ),
                    label: Text(learned ? '已掌握' : '学习中'),
                  ),
                ],
              ),
              if (node.summary.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(node.summary,
                    style: TextStyle(
                        color: palette.outline,
                        fontSize: 14,
                        height: 1.6)),
              ],
              const SizedBox(height: 20),
              // 标签
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _Tag(text: node.gradeTag),
                  _Tag(text: '基础程度 L${node.basicLevel}/5'),
                  _Tag(text: '必要程度 N${node.necessity}/3'),
                  _Tag(text: _sourceLabel(node.source)),
                  if (node.status == 'draft') _Tag(text: '待人工审核', warn: true),
                ],
              ),
              const SizedBox(height: 24),
              // 正文
              if (node.content.isNotEmpty) ...[
                Text('内容', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(node.content,
                    style: const TextStyle(height: 1.7, fontSize: 14)),
                const SizedBox(height: 24),
              ],
              // 关系
              if (edges.isNotEmpty) ...[
                Text('知识关联', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ...edges.map((e) => _EdgeTile(edge: e, selfId: node.id)),
                const SizedBox(height: 24),
              ],
            ],
          );
        },
      ),
    );
  }

  static String _sourceLabel(String source) => switch (source) {
        'agent_crawl' => '来源：自主抓取',
        'user_feed' => '来源：用户投喂',
        'seed' => '来源：种子知识',
        _ => '来源：手动创建',
      };
}

class _Tag extends StatelessWidget {
  final String text;
  final bool warn;

  const _Tag({required this.text, this.warn = false});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    return Chip(
      label: Text(
        text,
        style: TextStyle(
            fontSize: 11,
            color: warn ? palette.error : palette.onSurface),
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}

class _EdgeTile extends ConsumerWidget {
  final KnowledgeEdge edge;
  final String selfId;

  const _EdgeTile({required this.edge, required this.selfId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).colorScheme;
    final otherId = edge.fromId == selfId ? edge.toId : edge.fromId;
    final isOutgoing = edge.fromId == selfId;
    final label = switch (edge.relation) {
      'prerequisite' => '前置',
      'contains' => '包含',
      'inference' => '推论',
      _ => '关联',
    };
    final arrow = isOutgoing ? '→' : '←';

    return FutureBuilder<KnowledgeNode?>(
      future: ref.read(graphRepositoryProvider).nodeById(otherId),
      builder: (context, snap) {
        final title = snap.data?.title ?? '…';
        return ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: Text('$label $arrow',
              style: TextStyle(
                  fontSize: 12,
                  color: palette.primary,
                  fontWeight: FontWeight.w600)),
          title: InkWell(
            onTap: () => context.push('/node/$otherId'),
            child: Text(title,
                style: const TextStyle(fontSize: 14)),
          ),
          trailing: Text('置信 ${(edge.confidence * 100).toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 11, color: palette.outline)),
        );
      },
    );
  }
}
