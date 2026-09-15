import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/flutter_force_directed_graph.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/app_db.dart';
import '../../data/repositories/graph_repository.dart';
import '../../data/repositories/feed_repository.dart';
import '../../data/repositories/learning_repository.dart';
import '../../domain/quiz/quiz_engine.dart';
import '../../widgets/celebration_overlay.dart';

/// 云图页面状态。
class CloudMapController extends ChangeNotifier {
  final Ref ref;
  String currentCloudId = 'main';

  CloudMapController(this.ref);

  Future<void> switchCloud(String cloudId) async {
    currentCloudId = cloudId;
    notifyListeners();
  }
}

final cloudMapControllerProvider =
    ChangeNotifierProvider.autoDispose<CloudMapController>((ref) {
  final c = CloudMapController(ref);
  ref.onDispose(c.dispose);
  return c;
});

/// 节点是否已掌握（异步家族 Provider）。
final learnedProvider =
    FutureProvider.family<bool, String>((ref, nodeId) async {
  return ref.watch(learningRepositoryProvider).isLearned(nodeId);
});

/// 子云列表 Provider。
final subCloudsProvider = FutureProvider<List<FedDocument>>((ref) async {
  final docs = await ref.watch(feedRepositoryProvider).all();
  return docs.where((d) => d.status == 'done').toList();
});

/// 知识云图页：力导向主视图 + 子云切换 + 图例 + 节点预览。
class CloudMapPage extends ConsumerStatefulWidget {
  const CloudMapPage({super.key});

  @override
  ConsumerState<CloudMapPage> createState() => _CloudMapPageState();
}

class _CloudMapPageState extends ConsumerState<CloudMapPage> {
  ForceDirectedGraphController<String>? _fdg;
  String _selectedNodeId = '';
  Map<String, KnowledgeNode> _nodeMap = {};
  Map<String, KnowledgeEdge> _edgeMap = {};
  final Map<String, String> _edgeRelation = {}; // "a|b"（无序）→ relation

  CloudMapController get _ctrl => ref.read(cloudMapControllerProvider.notifier);

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(_reload);
    WidgetsBinding.instance.addPostFrameCallback((_) => _reload());
  }

  @override
  void dispose() {
    _ctrl.removeListener(_reload);
    super.dispose();
  }

  Future<void> _reload() async {
    final cloudId = _ctrl.currentCloudId;
    final graph = ref.read(graphRepositoryProvider);
    final nodes = await graph.nodesOfCloud(cloudId);
    final edges = await graph.edgesOfNodes(nodes.map((n) => n.id).toList());

    final relation = <String, String>{};
    for (final e in edges) {
      relation['${e.fromId}|${e.toId}'] = e.relation;
      relation['${e.toId}|${e.fromId}'] = e.relation;
    }

    if (!mounted) return;
    setState(() {
      _nodeMap = {for (final n in nodes) n.id: n};
      _edgeMap = {for (final e in edges) '${e.fromId}|${e.toId}': e};
      _edgeRelation
        ..clear()
        ..addAll(relation);
      _selectedNodeId = '';
      _fdg = ForceDirectedGraphController<String>(minScale: 0.2, maxScale: 2.5);
      for (final n in nodes) {
        _fdg!.addNode(n.id);
      }
      for (final e in edges) {
        _fdg!.addEdgeByData(e.fromId, e.toId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    final cloudId = ref.watch(cloudMapControllerProvider).currentCloudId;

    return Scaffold(
      body: Column(
        children: [
          _TopBar(
            cloudId: cloudId,
            onCloudChanged: (id) => _ctrl.switchCloud(id).then((_) => _reload()),
          ),
          Divider(height: 1, color: palette.outline),
          Expanded(
            child: Stack(
              children: [
                if (_fdg == null || _nodeMap.isEmpty)
                  Center(
                    child: Text('这朵云还空空的，去「投喂」或「蒸馏」构建知识吧 ☁️',
                        style: TextStyle(color: palette.outline)),
                  )
                else
                  ForceDirectedGraphWidget<String>(
                    key: ValueKey(cloudId),
                    controller: _fdg!,
                    nodesBuilder: (context, data) => _NodeBubble(
                      node: _nodeMap[data],
                      selected: _selectedNodeId == data,
                      onTap: () => setState(() => _selectedNodeId = data),
                    ),
                    edgesBuilder: (context, a, b, distance) => _EdgeLine(
                      relation: _edgeRelation['$a|$b'] ?? 'related',
                      color: palette.outline,
                    ),
                    onDraggingEnd: (data) async {
                      final node =
                          _fdg!.graph.nodes.firstWhereOrNull((n) => n.data == data);
                      if (node != null) {
                        await ref
                            .read(graphRepositoryProvider)
                            .updateNodePosition(
                                data, node.position.x, node.position.y);
                      }
                    },
                  ),
                const Positioned(left: 16, bottom: 16, child: _Legend()),
                if (_selectedNodeId.isNotEmpty &&
                    _nodeMap.containsKey(_selectedNodeId))
                  Positioned(
                    right: 16,
                    top: 16,
                    child: _NodePreviewCard(
                      key: ValueKey(_selectedNodeId),
                      node: _nodeMap[_selectedNodeId]!,
                      edgeCount: _edgeMap.keys
                          .where((k) => k.contains(_selectedNodeId))
                          .length,
                      onClose: () => setState(() => _selectedNodeId = ''),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends ConsumerWidget {
  final String cloudId;
  final ValueChanged<String> onCloudChanged;

  const _TopBar({required this.cloudId, required this.onCloudChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subClouds = ref.watch(subCloudsProvider).value ?? const <FedDocument>[];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: [
          Text('知识云图', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(width: 24),
          DropdownButton<String>(
            value: cloudId,
            items: [
              const DropdownMenuItem(value: 'main', child: Text('主知识云 ☁️')),
              for (final d in subClouds)
                DropdownMenuItem(
                    value: 'feed_${d.id}', child: Text('私有云 · ${d.title}')),
            ],
            underline: const SizedBox.shrink(),
            borderRadius: BorderRadius.circular(12),
            onChanged: (v) {
              if (v != null) onCloudChanged(v);
            },
          ),
          const Spacer(),
          if (cloudId == 'main')
            OutlinedButton.icon(
              onPressed: () => _showAddNodeDialog(context, ref),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('添加节点'),
            ),
        ],
      ),
    );
  }

  Future<void> _showAddNodeDialog(BuildContext context, WidgetRef ref) async {
    final titleCtrl = TextEditingController();
    final summaryCtrl = TextEditingController();
    var grade = '通用';
    var basic = 3;
    var necessity = 2;

    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('添加知识节点'),
          content: SizedBox(
            width: 460,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: '标题（≤12字）'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: summaryCtrl,
                  decoration: const InputDecoration(labelText: '摘要'),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('学段'),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: grade,
                      items: const ['小学', '初中', '高中', '通用']
                          .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                          .toList(),
                      onChanged: (v) => setState(() => grade = v ?? grade),
                    ),
                    const Spacer(),
                    const Text('基础'),
                    const SizedBox(width: 4),
                    DropdownButton<int>(
                      value: basic,
                      items: [1, 2, 3, 4, 5]
                          .map((b) => DropdownMenuItem(value: b, child: Text('L$b')))
                          .toList(),
                      onChanged: (v) => setState(() => basic = v ?? basic),
                    ),
                    const SizedBox(width: 12),
                    const Text('必要'),
                    const SizedBox(width: 4),
                    DropdownButton<int>(
                      value: necessity,
                      items: [1, 2, 3]
                          .map((b) => DropdownMenuItem(value: b, child: Text('N$b')))
                          .toList(),
                      onChanged: (v) => setState(() => necessity = v ?? necessity),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('取消')),
            FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('添加')),
          ],
        ),
      ),
    );

    if (ok == true && titleCtrl.text.trim().isNotEmpty) {
      await ref.read(graphRepositoryProvider).createNode(
            title: titleCtrl.text.trim(),
            summary: summaryCtrl.text.trim(),
            gradeTag: grade,
            basicLevel: basic,
            necessity: necessity,
            source: 'manual',
          );
      onCloudChanged('main');
    }
  }
}

/// 节点气泡。
class _NodeBubble extends ConsumerWidget {
  final KnowledgeNode? node;
  final bool selected;
  final VoidCallback onTap;

  const _NodeBubble(
      {required this.node, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final n = node;
    if (n == null) return const SizedBox(width: 8, height: 8);
    final palette = Theme.of(context).colorScheme;
    final appPalette = ref.watch(paletteProvider);
    final color = appPalette.nodeColor(n.gradeTag);
    final size = nodeSizeForNecessity(n.necessity);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: selected
              ? Border.all(color: palette.primary, width: 3)
              : Border.all(color: Colors.white24, width: 1),
          boxShadow: [
            BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 10),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          n.title.length > 4 ? '${n.title.substring(0, 4)}…' : n.title,
          style: TextStyle(
            fontSize: size > 36 ? 12 : 9,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

/// 边线（按关系类型区分线型：前置实线粗/包含粗线/关联虚线/推论点线）。
class _EdgeLine extends StatelessWidget {
  final String relation;
  final Color color;

  const _EdgeLine({required this.relation, required this.color});

  @override
  Widget build(BuildContext context) {
    final style = switch (relation) {
      'prerequisite' => (w: 2.5, dash: false),
      'contains' => (w: 4.0, dash: false),
      'inference' => (w: 1.5, dash: true),
      _ => (w: 1.0, dash: true),
    };
    return CustomPaint(
      size: const Size(double.infinity, 4),
      painter: _DashPainter(
        color: color.withValues(alpha: 0.65),
        strokeWidth: style.w,
        dashed: style.dash,
      ),
    );
  }
}

class _DashPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final bool dashed;

  _DashPainter(
      {required this.color, required this.strokeWidth, required this.dashed});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final y = size.height / 2;
    if (!dashed) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      return;
    }
    const dash = 6.0;
    const gap = 4.0;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(
        Offset(x, y),
        Offset((x + dash).clamp(0, size.width), y),
        paint,
      );
      x += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _DashPainter old) =>
      old.color != color || old.dashed != dashed;
}

/// 图例。
class _Legend extends StatelessWidget {
  const _Legend();

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;
    Widget dot(Color c, String label) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 5, backgroundColor: c),
            const SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 11, color: palette.outline)),
          ],
        );

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: palette.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: palette.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          dot(const Color(0xFFFFD166), '小学'),
          const SizedBox(height: 4),
          dot(const Color(0xFF4C9AFF), '初中'),
          const SizedBox(height: 4),
          dot(const Color(0xFF9B6BFF), '高中'),
          const SizedBox(height: 4),
          dot(const Color(0xFF2ECC9B), '通用'),
          const Divider(height: 12),
          Text('节点大小 = 必要程度\n粗线 = 前置/包含\n虚线 = 关联/推论',
              style: TextStyle(
                  fontSize: 10, color: palette.outline, height: 1.5)),
        ],
      ),
    );
  }
}

/// 节点预览卡。
class _NodePreviewCard extends ConsumerWidget {
  final KnowledgeNode node;
  final int edgeCount;
  final VoidCallback onClose;

  const _NodePreviewCard({
    super.key,
    required this.node,
    required this.edgeCount,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).colorScheme;
    final learned = ref.watch(learnedProvider(node.id)).value ?? false;

    return Container(
      width: 300,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: palette.outline),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.08), blurRadius: 20),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(node.title,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              IconButton(
                  onPressed: onClose, icon: const Icon(Icons.close, size: 16)),
            ],
          ),
          if (node.summary.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(node.summary,
                style: TextStyle(color: palette.outline, fontSize: 12)),
          ],
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              Chip(
                label: Text(node.gradeTag, style: const TextStyle(fontSize: 10)),
                visualDensity: VisualDensity.compact,
              ),
              Chip(
                label: Text('基础 L${node.basicLevel}',
                    style: const TextStyle(fontSize: 10)),
                visualDensity: VisualDensity.compact,
              ),
              Chip(
                label: Text('必要 N${node.necessity}',
                    style: const TextStyle(fontSize: 10)),
                visualDensity: VisualDensity.compact,
              ),
              Chip(
                label: Text('$edgeCount 条关联',
                    style: const TextStyle(fontSize: 10)),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: learned ? null : () => _markLearned(context, ref),
                  child: Text(learned ? '已掌握 ✓' : '标记已掌握'),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () => context.push('/node/${node.id}'),
                child: const Text('详情'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _markLearned(BuildContext context, WidgetRef ref) async {
    final isNew = await ref
        .read(learningRepositoryProvider)
        .markLearned(node.id, source: 'cloud_map');
    if (!context.mounted) return;
    if (isNew) {
      ref.invalidate(learnedProvider(node.id));
      CelebrationOverlay.show(context,
          title: '掌握 +1 ✨', subtitle: node.title, icon: Icons.verified);
      // 邀请新知掌握练
      final take = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('新知掌握练 📝'),
          content:
              Text('要基于「${node.title}」完成一次新知掌握练吗？\n100% 通过获得 1 积分！'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('稍后再说')),
            FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('开始练习')),
          ],
        ),
      );
      if (take == true && context.mounted) {
        try {
          final quizId = await ref.read(quizEngineProvider).generate(
                quizKind: 'new_knowledge',
                explicitNodeIds: [node.id],
              );
          if (context.mounted) context.push('/quiz/$quizId?kind=new_knowledge');
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('出题失败：$e')));
          }
        }
      }
    }
  }
}
