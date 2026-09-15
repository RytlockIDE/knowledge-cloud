import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/errors/app_exception.dart';
import '../../data/models/app_db.dart' hide Badge;
import '../../data/repositories/reward_repository.dart';
import '../../domain/quiz/quiz_engine.dart';
import '../../domain/quiz/scoring.dart';

/// 练习类型展示定义。
class _PracticeMeta {
  final String kind;
  final IconData icon;
  final Color color;
  final String scope;
  final String rule;

  const _PracticeMeta({
    required this.kind,
    required this.icon,
    required this.color,
    required this.scope,
    required this.rule,
  });
}

const _metas = [
  _PracticeMeta(
    kind: 'new_knowledge',
    icon: Icons.auto_awesome,
    color: Color(0xFF4C9AFF),
    scope: '范围：刚标记「已掌握」的知识点',
    rule: '基础难度 · 100% 通过得 1 分',
  ),
  _PracticeMeta(
    kind: 'daily',
    icon: Icons.today,
    color: Color(0xFF36B37E),
    scope: '范围：当日所学知识',
    rule: '基础难度 · 100% 掌握得 1 分',
  ),
  _PracticeMeta(
    kind: 'weekly',
    icon: Icons.date_range,
    color: Color(0xFFFF8B00),
    scope: '范围：本周所学知识',
    rule: '进阶难度 · 正确率 60-75 得 1 分 / 75-90 得 2 分 / ≥90 得 3 分，满分得周勋章',
  ),
  _PracticeMeta(
    kind: 'monthly',
    icon: Icons.calendar_month,
    color: Color(0xFF9D5CFF),
    scope: '范围：本学段所有已学知识',
    rule: '计分同周练，满分得月勋章',
  ),
  _PracticeMeta(
    kind: 'annual',
    icon: Icons.emoji_events,
    color: Color(0xFFE5484D),
    scope: '范围：所有已学知识，含综合应用题',
    rule: '十倍计分（最多 30 分），满分得年度勋章',
  ),
];

/// 练习中心页。
class PracticePage extends ConsumerStatefulWidget {
  const PracticePage({super.key});

  @override
  ConsumerState<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends ConsumerState<PracticePage> {
  int _balance = 0;
  Map<String, int> _badgeCounts = const {};
  List<Quizze> _history = const [];
  bool _loading = true;
  String? _generatingKind;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  Future<void> _reload() async {
    final reward = ref.read(rewardRepositoryProvider);
    final db = ref.read(appDbProvider);
    final results = await Future.wait([
      reward.balance(),
      reward.badgeCounts(),
      (db.select(db.quizzes)
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
            ..limit(20))
          .get(),
    ]);
    if (!mounted) return;
    setState(() {
      _balance = results[0] as int;
      _badgeCounts = results[1] as Map<String, int>;
      _history = results[2] as List<Quizze>;
      _loading = false;
    });
  }

  Future<void> _startPractice(_PracticeMeta meta) async {
    if (_generatingKind != null) return;
    setState(() => _generatingKind = meta.kind);
    final messenger = ScaffoldMessenger.of(context);
    try {
      final quizId = await ref
          .read(quizEngineProvider)
          .generate(quizKind: meta.kind, onProgress: (m) {
        if (mounted) messenger.showSnackBar(SnackBar(content: Text(m), duration: const Duration(seconds: 1)));
      });
      if (!mounted) return;
      await context.push('/quiz/$quizId?kind=${meta.kind}');
    } on AppException catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.message)));
    } catch (_) {
      messenger.showSnackBar(const SnackBar(content: Text('出题失败，请检查模型服务后重试')));
    } finally {
      if (mounted) setState(() => _generatingKind = null);
      _reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _RewardOverviewCard(
                  balance: _balance,
                  badgeCounts: _badgeCounts,
                ),
                const SizedBox(height: 16),
                Text('选择练习', style: theme.textTheme.titleMedium),
                const SizedBox(height: 12),
                ..._metas.map((m) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _PracticeCard(
                        meta: m,
                        busy: _generatingKind == m.kind,
                        disabled: _generatingKind != null,
                        onStart: () => _startPractice(m),
                      ),
                    )),
                const SizedBox(height: 16),
                Text('历史成绩', style: theme.textTheme.titleMedium),
                const SizedBox(height: 12),
                if (_history.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text('还没有练习记录，从上面选一个开始吧！',
                            style: TextStyle(color: theme.colorScheme.outline)),
                      ),
                    ),
                  )
                else
                  ..._history.map(_HistoryTile.new),
              ],
            ),
    );
  }
}

class _RewardOverviewCard extends StatelessWidget {
  final int balance;
  final Map<String, int> badgeCounts;

  const _RewardOverviewCard({required this.balance, required this.badgeCounts});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('当前积分', style: TextStyle(color: cs.outline, fontSize: 13)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$balance',
                          style: theme.textTheme.headlineMedium
                              ?.copyWith(color: cs.primary, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      const Text('分'),
                    ],
                  ),
                ],
              ),
            ),
            _BadgeStat(icon: Icons.workspace_premium, label: '周勋章', count: badgeCounts['weekly'] ?? 0),
            _BadgeStat(icon: Icons.military_tech, label: '月勋章', count: badgeCounts['monthly'] ?? 0),
            _BadgeStat(icon: Icons.emoji_events, label: '年度勋章', count: badgeCounts['annual'] ?? 0),
          ],
        ),
      ),
    );
  }
}

class _BadgeStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const _BadgeStat({required this.icon, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Badge(
            label: Text('$count'),
            isLabelVisible: count > 0,
            child: Icon(icon, size: 28, color: cs.primary),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _PracticeCard extends StatelessWidget {
  final _PracticeMeta meta;
  final bool busy;
  final bool disabled;
  final VoidCallback onStart;

  const _PracticeCard({
    required this.meta,
    required this.busy,
    required this.disabled,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: disabled || busy ? null : onStart,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: meta.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(meta.icon, color: meta.color),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(Scoring.kindLabel(meta.kind),
                            style: theme.textTheme.titleMedium),
                        const SizedBox(width: 8),
                        Text('${Scoring.defaultCount(meta.kind)} 题',
                            style: TextStyle(color: theme.colorScheme.outline, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(meta.scope, style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 2),
                    Text(meta.rule,
                        style: TextStyle(fontSize: 12, color: theme.colorScheme.primary)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              busy
                  ? const SizedBox(
                      width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5))
                  : Icon(Icons.chevron_right,
                      color: disabled ? theme.colorScheme.outline : meta.color),
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final Quizze quiz;

  const _HistoryTile(this.quiz);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final fmt = DateFormat('MM-dd HH:mm');
    final createdAt = DateTime.fromMillisecondsSinceEpoch(quiz.createdAt);

    final (IconData icon, Color color, String statusText) = switch (quiz.status) {
      'submitted' => (
          quiz.accuracy != null && quiz.accuracy! >= 90
              ? Icons.emoji_events
              : Icons.check_circle,
          quiz.accuracy != null && quiz.accuracy! >= 60 ? const Color(0xFF36B37E) : cs.outline,
          '正确率 ${quiz.accuracy!.toStringAsFixed(0)}% · +${quiz.pointsAwarded} 分'
        ),
      'failed' => (Icons.error_outline, cs.error, '出题失败'),
      _ => (Icons.hourglass_top, cs.outline, '未完成'),
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(Scoring.kindLabel(quiz.kind)),
        subtitle: Text(
          quiz.status == 'submitted'
              ? '$statusText${quiz.badgeAwarded ? ' · 获得勋章' : ''}'
              : statusText,
          style: TextStyle(color: color, fontSize: 12),
        ),
        trailing: Text(fmt.format(createdAt),
            style: TextStyle(color: cs.outline, fontSize: 12)),
      ),
    );
  }
}
