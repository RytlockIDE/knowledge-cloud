import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/app_db.dart';
import '../../data/repositories/graph_repository.dart';
import '../../data/repositories/snapshot_repository.dart';
import '../../domain/distill/distiller.dart';

/// 快照列表 Provider。
final snapshotsProvider = FutureProvider<List<CloudSnapshot>>((ref) async {
  return ref.watch(snapshotRepositoryProvider).all();
});

/// 年级蒸馏页：两步向导 + 脉络树结果。
class DistillPage extends ConsumerStatefulWidget {
  const DistillPage({super.key});

  @override
  ConsumerState<DistillPage> createState() => _DistillPageState();
}

class _DistillPageState extends ConsumerState<DistillPage> {
  String _grade = '初中';
  String _subject = '数学';
  bool _running = false;
  String _progress = '';
  CloudSnapshot? _result;

  static const _grades = ['小学', '初中', '高中'];
  static const _subjects = [
    '数学', '语文', '英语', '物理', '化学', '生物', '历史', '地理', '政治'
  ];

  Future<void> _run() async {
    setState(() {
      _running = true;
      _result = null;
      _progress = '准备中…';
    });
    try {
      final snapshot = await ref.read(distillerProvider).distill(
        gradeTag: _grade,
        subject: _subject,
        onProgress: (m) => setState(() => _progress = m),
      );
      setState(() => _result = snapshot);
      ref.invalidate(snapshotsProvider);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('蒸馏失败：$e')));
      }
    } finally {
      if (mounted) setState(() => _running = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('年级蒸馏', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text('按年级与课程目标，从知识云蒸馏出一套递进式学习脉络',
                style: TextStyle(color: palette.outline, fontSize: 12)),
            const SizedBox(height: 20),
            // 向导第一步
            Row(
              children: [
                SegmentedButton<String>(
                  segments: [
                    for (final g in _grades)
                      ButtonSegment(value: g, label: Text(g)),
                  ],
                  selected: {_grade},
                  onSelectionChanged: (v) => setState(() => _grade = v.first),
                ),
                const SizedBox(width: 16),
                DropdownButton<String>(
                  value: _subject,
                  items: [
                    for (final s in _subjects)
                      DropdownMenuItem(value: s, child: Text(s))
                  ],
                  onChanged: (v) => setState(() => _subject = v ?? _subject),
                  borderRadius: BorderRadius.circular(12),
                ),
                const SizedBox(width: 16),
                FilledButton.icon(
                  onPressed: _running ? null : _run,
                  icon: _running
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.auto_awesome, size: 18),
                  label: const Text('开始蒸馏'),
                ),
              ],
            ),
            if (_running) ...[
              const SizedBox(height: 16),
              Row(children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 10),
                Text(_progress,
                    style: TextStyle(color: palette.outline, fontSize: 13)),
              ]),
            ],
            const SizedBox(height: 20),
            Expanded(
              child: _result != null
                  ? _StageTreeView(snapshot: _result!)
                  : _HistoryList(onSelect: (s) => setState(() => _result = s)),
            ),
          ],
        ),
      ),
    );
  }
}

/// 历史快照列表。
class _HistoryList extends ConsumerWidget {
  final ValueChanged<CloudSnapshot> onSelect;

  const _HistoryList({required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).colorScheme;
    final snaps = ref.watch(snapshotsProvider).value ?? const <CloudSnapshot>[];
    if (snaps.isEmpty) {
      return Center(
        child: Text('还没有蒸馏快照，选择年级与学科开始吧',
            style: TextStyle(color: palette.outline)),
      );
    }
    return ListView.separated(
      itemCount: snaps.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) {
        final s = snaps[i];
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: palette.outline),
          ),
          tileColor: palette.surface,
          leading: const Icon(Icons.cloud_done_outlined),
          title: Text(s.name),
          subtitle: Text('版本 v${s.version} · '
              '${DateTime.fromMillisecondsSinceEpoch(s.createdAt)}'
                  .substring(0, 22)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => onSelect(s),
        );
      },
    );
  }
}

/// 阶段脉络树视图（垂直阶段卡 + 节点链）。
class _StageTreeView extends ConsumerWidget {
  final CloudSnapshot snapshot;

  const _StageTreeView({required this.snapshot});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).colorScheme;
    final graph = ref.read(graphRepositoryProvider);
    final stages = Distiller.parseStages(snapshot);

    return ListView(
      children: [
        Text(
          '${snapshot.name} · v${snapshot.version}',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: palette.primary),
        ),
        const SizedBox(height: 8),
        Text('共 ${stages.length} 个学习阶段，按基础程度递进排列 ↓',
            style: TextStyle(color: palette.outline, fontSize: 12)),
        const SizedBox(height: 16),
        for (var i = 0; i < stages.length; i++)
          _StageCard(
            index: i + 1,
            name: stages[i].name,
            nodeIds: stages[i].nodeIds,
            graph: graph,
          ),
      ],
    );
  }
}

class _StageCard extends ConsumerWidget {
  final int index;
  final String name;
  final List<String> nodeIds;
  final GraphRepository graph;

  const _StageCard({
    required this.index,
    required this.name,
    required this.nodeIds,
    required this.graph,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: palette.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: palette.primary,
                child: Text('$index',
                    style: TextStyle(
                        fontSize: 12,
                        color: palette.onPrimary,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: 10),
              Text(name, style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              Text('${nodeIds.length} 个知识点',
                  style: TextStyle(fontSize: 11, color: palette.outline)),
            ],
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<KnowledgeNode?>>(
            future: Future.wait(nodeIds.map((id) => graph.nodeById(id))),
            builder: (context, snap) {
              final nodes =
                  (snap.data ?? const <KnowledgeNode?>[]).whereType().toList();
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final n in nodes)
                    ActionChip(
                      avatar: Icon(
                        n.necessity == 1 ? Icons.star : Icons.label_outline,
                        size: 14,
                        color: n.necessity == 1
                            ? palette.primary
                            : palette.outline,
                      ),
                      label: Text(n.title,
                          style: const TextStyle(fontSize: 12)),
                      onPressed: () {},
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
