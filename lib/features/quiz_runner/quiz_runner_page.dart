import 'dart:convert';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_exception.dart';
import '../../data/models/app_db.dart';
import '../../domain/quiz/quiz_engine.dart';
import '../../domain/quiz/scoring.dart';
import '../../widgets/celebration_overlay.dart';

/// 考试作答页：逐题作答 → 交卷判分 → 结果与错题回顾。
class QuizRunnerPage extends ConsumerStatefulWidget {
  final String quizId;
  final String kind;

  const QuizRunnerPage({super.key, required this.quizId, required this.kind});

  @override
  ConsumerState<QuizRunnerPage> createState() => _QuizRunnerPageState();
}

class _QuizRunnerPageState extends ConsumerState<QuizRunnerPage> {
  Quizze? _quiz;
  List<QuizQuestion> _questions = const [];
  final Map<String, int> _answers = {}; // questionId -> selectedIndex
  int _index = 0;
  bool _loading = true;
  bool _submitting = false;
  QuizResult? _result;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final db = ref.read(appDbProvider);
    final quiz = await (db.select(db.quizzes)
          ..where((t) => t.id.equals(widget.quizId)))
        .getSingleOrNull();
    if (quiz == null) {
      setState(() {
        _error = '练习不存在';
        _loading = false;
      });
      return;
    }
    final questions = await (db.select(db.quizQuestions)
          ..where((t) => t.quizId.equals(widget.quizId))
          ..orderBy([(t) => OrderingTerm.asc(t.orderIdx)]))
        .get();
    if (!mounted) return;
    setState(() {
      _quiz = quiz;
      _questions = questions;
      _loading = false;
    });
  }

  Future<void> _submit() async {
    if (_submitting) return;
    // 校验全部作答
    final unanswered =
        _questions.where((q) => _answers[q.id] == null).length;
    if (unanswered > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('还有 $unanswered 题未作答')));
      return;
    }
    setState(() => _submitting = true);
    try {
      final result = await ref.read(quizEngineProvider).submit(
            quizId: widget.quizId,
            answers: [
              for (final e in _answers.entries) AnswerEntry(e.key, e.value)
            ],
          );
      if (!mounted) return;
      setState(() {
        _result = result;
        _submitting = false;
      });
      if (result.badgeKind != null) {
        CelebrationOverlay.show(
          context,
          title: '满分！获得${_badgeLabel(result.badgeKind!)}',
          subtitle: '继续加油，向着毕业礼前进！',
          icon: Icons.emoji_events,
        );
      } else if (result.unlockedSkins.isNotEmpty) {
        CelebrationOverlay.show(
          context,
          title: '解锁新皮肤！',
          subtitle: result.unlockedSkins.join('、'),
          icon: Icons.card_giftcard,
        );
      } else if (result.points > 0) {
        CelebrationOverlay.show(
          context,
          title: '+${result.points} 积分',
          subtitle: '正确率 ${result.accuracy.toStringAsFixed(0)}%',
          icon: Icons.celebration,
        );
      }
    } on AppException catch (e) {
      if (!mounted) return;
      setState(() => _submitting = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  String _badgeLabel(String kind) => switch (kind) {
        'weekly' => '周勋章',
        'monthly' => '月勋章',
        'annual' => '年度勋章',
        _ => '勋章',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(Scoring.kindLabel(widget.kind))),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (_error != null || _quiz == null) {
      return Scaffold(
        appBar: AppBar(title: Text(Scoring.kindLabel(widget.kind))),
        body: Center(child: Text(_error ?? '加载失败')),
      );
    }

    final alreadySubmitted = _quiz!.status == 'submitted';
    final showResult = _result != null || alreadySubmitted;

    return Scaffold(
      appBar: AppBar(
        title: Text(Scoring.kindLabel(widget.kind)),
        actions: [
          if (!showResult && _questions.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  '${_index + 1} / ${_questions.length}',
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
        ],
      ),
      body: showResult ? _buildResult(context) : _buildAnswerFlow(context),
    );
  }

  // ---- 作答流 ----

  Widget _buildAnswerFlow(BuildContext context) {
    final theme = Theme.of(context);
    if (_questions.isEmpty) {
      return Center(
        child: Text('题目加载失败，请返回重试',
            style: TextStyle(color: theme.colorScheme.outline)),
      );
    }
    final q = _questions[_index];
    final options = _parseOptions(q.optionsJson);
    final selected = _answers[q.id];

    return Column(
      children: [
        LinearProgressIndicator(
          value: (_index + 1) / _questions.length,
          minHeight: 4,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                children: [
                  Chip(
                    label: Text(q.difficulty, style: const TextStyle(fontSize: 12)),
                    visualDensity: VisualDensity.compact,
                  ),
                  const SizedBox(width: 8),
                  Text('第 ${_index + 1} 题',
                      style: TextStyle(color: theme.colorScheme.outline)),
                ],
              ),
              const SizedBox(height: 16),
              Text(q.stem, style: theme.textTheme.titleLarge),
              const SizedBox(height: 20),
              ...List.generate(options.length, (i) {
                final isSelected = selected == i;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: OptionTile(
                    label: String.fromCharCode(65 + i),
                    text: options[i],
                    selected: isSelected,
                    onTap: () => setState(() => _answers[q.id] = i),
                  ),
                );
              }),
            ],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (_index > 0)
                  OutlinedButton(
                    onPressed: () => setState(() => _index--),
                    child: const Text('上一题'),
                  ),
                const Spacer(),
                if (_index < _questions.length - 1)
                  FilledButton(
                    onPressed: selected == null
                        ? null
                        : () => setState(() => _index++),
                    child: const Text('下一题'),
                  )
                else
                  FilledButton.icon(
                    onPressed: _submitting ? null : _submit,
                    icon: _submitting
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.done_all),
                    label: const Text('交卷'),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ---- 结果页 ----

  Widget _buildResult(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final accuracy = _result?.accuracy ?? _quiz!.accuracy ?? 0;
    final points = _result?.points ?? _quiz!.pointsAwarded;
    final badgeAwarded = _result?.badgeKind != null || _quiz!.badgeAwarded;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: CircularProgressIndicator(
                          value: accuracy / 100,
                          strokeWidth: 10,
                          strokeCap: StrokeCap.round,
                          color: accuracy >= 90
                              ? const Color(0xFF36B37E)
                              : accuracy >= 60
                                  ? const Color(0xFFFF8B00)
                                  : cs.error,
                          backgroundColor: cs.surfaceContainerHighest,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${accuracy.toStringAsFixed(0)}%',
                              style: theme.textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          Text('正确率',
                              style: TextStyle(
                                  color: cs.outline, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (badgeAwarded)
                  Chip(
                    avatar: const Icon(Icons.emoji_events, size: 18),
                    label: const Text('满分！勋章已入袋'),
                    backgroundColor: cs.primaryContainer,
                  ),
                if ((_result?.unlockedSkins ?? const []).isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      children: [
                        for (final name in _result!.unlockedSkins)
                          Chip(
                            avatar: const Icon(Icons.card_giftcard, size: 16),
                            label: Text('新解锁：$name'),
                            visualDensity: VisualDensity.compact,
                          ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
                Text(
                  points > 0 ? '获得 $points 积分' : '这次没有获得积分，再接再厉！',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: points > 0 ? cs.primary : cs.outline,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  Scoring.difficultyLabel(widget.kind) == '综合'
                      ? '年度总练按十倍计分'
                      : '阶梯计分：≥90 得 3 分 · ≥75 得 2 分 · ≥60 得 1 分',
                  style: TextStyle(color: cs.outline, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('题目回顾', style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        ..._questions.map((q) => _ReviewTile(
              question: q,
              options: _parseOptions(q.optionsJson),
              selectedIndex: _answers[q.id] ?? -1,
            )),
      ],
    );
  }

  List<String> _parseOptions(String json) {
    try {
      return (jsonDecode(json) as List<dynamic>).map((e) => e.toString()).toList();
    } catch (_) {
      return const [];
    }
  }
}

/// 选项瓦片（作答态）。
class OptionTile extends StatelessWidget {
  final String label;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: selected ? cs.primaryContainer : cs.surfaceContainerLow,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor:
                    selected ? cs.primary : cs.surfaceContainerHighest,
                child: Text(label,
                    style: TextStyle(
                        fontSize: 13,
                        color: selected ? cs.onPrimary : cs.onSurface)),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(text)),
            ],
          ),
        ),
      ),
    );
  }
}

/// 错题回顾瓦片。
class _ReviewTile extends StatelessWidget {
  final QuizQuestion question;
  final List<String> options;
  final int selectedIndex;

  const _ReviewTile({
    required this.question,
    required this.options,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final correct = selectedIndex == question.answerIndex;
    final isAnswered = selectedIndex >= 0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  !isAnswered
                      ? Icons.help_outline
                      : correct
                          ? Icons.check_circle
                          : Icons.cancel,
                  size: 20,
                  color: !isAnswered
                      ? cs.outline
                      : correct
                          ? const Color(0xFF36B37E)
                          : cs.error,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(question.stem, style: theme.textTheme.titleSmall),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...List.generate(options.length, (i) {
              final isAnswer = i == question.answerIndex;
              final isPicked = i == selectedIndex;
              final color = isAnswer
                  ? const Color(0xFF36B37E)
                  : isPicked
                      ? cs.error
                      : cs.outline;
              return Padding(
                padding: const EdgeInsets.only(bottom: 4, left: 4),
                child: Row(
                  children: [
                    Text('${String.fromCharCode(65 + i)}. ',
                        style: TextStyle(
                            color: color,
                            fontWeight: isAnswer || isPicked
                                ? FontWeight.bold
                                : FontWeight.normal)),
                    Expanded(child: Text(options[i])),
                    if (isAnswer)
                      Icon(Icons.check, size: 16, color: const Color(0xFF36B37E)),
                  ],
                ),
              );
            }),
            if (question.explanation.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('解析：${question.explanation}',
                    style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
