import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_exception.dart';
import '../../core/utils/json_repair.dart';
import '../../core/utils/practice_windows.dart';
import '../../core/utils/uuid.dart';
import '../../data/models/app_db.dart';
import '../../data/repositories/learning_repository.dart';
import '../../data/repositories/reward_repository.dart';
import '../../services/llm/chat_client.dart';
import '../../services/llm/llm_router.dart';
import '../../services/rag/rag_service.dart';
import '../../services/settings_store.dart';
import '../agent/prompts/prompts.dart';
import 'scoring.dart';

/// 出题/判分/计分结果。
class QuizResult {
  final String quizId;
  final double accuracy;
  final int points;
  final String? badgeKind;
  final String? badgePeriodKey;
  final List<String> unlockedSkins;

  const QuizResult({
    required this.quizId,
    required this.accuracy,
    required this.points,
    this.badgeKind,
    this.badgePeriodKey,
    this.unlockedSkins = const [],
  });
}

/// 单题作答。
class AnswerEntry {
  final String questionId;
  final int selectedIndex;

  const AnswerEntry(this.questionId, this.selectedIndex);
}

/// QuizEngine：圈题范围 → LLM 出题 → 校验入库 → 本地判分 → 计分入账。
class QuizEngine {
  final Ref ref;

  QuizEngine(this.ref);

  AppDb get _db => ref.read(appDbProvider);
  LearningRepository get _learning => ref.read(learningRepositoryProvider);
  RewardRepository get _reward => ref.read(rewardRepositoryProvider);
  RagService get _rag => ref.read(ragServiceProvider);
  SettingsStore get _settings => ref.read(settingsStoreProvider);

  /// 计算练习范围（节点 id 列表）。
  Future<List<String>> scopeOf(String quizKind, {DateTime? now}) async {
    final n = now ?? DateTime.now();
    switch (quizKind) {
      case 'new_knowledge':
        // 最近一次标记的节点集合由调用方传入（这里取今日标记）
        return _learning.learnedNodeIdsSince(PracticeWindows.startOfDay(n));
      case 'daily':
        return _learning.learnedNodeIdsSince(PracticeWindows.startOfDay(n));
      case 'weekly':
        return _learning.learnedNodeIdsSince(PracticeWindows.startOfWeek(n));
      case 'monthly':
      case 'annual':
        // 本学段/全部已学
        return _learning.learnedNodeIdsSince(0);
      default:
        return const [];
    }
  }

  /// 生成一份练习（出题入库）。
  Future<String> generate({
    required String quizKind,
    List<String>? explicitNodeIds,
    void Function(String message)? onProgress,
  }) async {
    final quizId = newUuid();
    final count = _settings.quizCount(quizKind);

    final nodeIds = explicitNodeIds ?? await scopeOf(quizKind);
    if (nodeIds.isEmpty) {
      throw const AppException('没有可练习的知识点，请先在知识云中学习并标记"已掌握"');
    }

    await _db.into(_db.quizzes).insert(
          QuizzesCompanion.insert(
            id: quizId,
            kind: quizKind,
            scopeJson: Value(jsonEncode(nodeIds)),
            status: const Value('generating'),
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );

    try {
      onProgress?.call('正在组题…');
      // 取节点内容做知识上下文
      final nodes = <KnowledgeNode>[];
      for (final id in nodeIds.take(30)) {
        final n = await (_db.select(_db.knowledgeNodes)
              ..where((t) => t.id.equals(id)))
            .getSingleOrNull();
        if (n != null) nodes.add(n);
      }
      if (nodes.isEmpty) {
        throw const AppException('知识点内容缺失');
      }

      // RAG 扩展上下文（可用时）
      var knowledgeContext = nodes
          .map((n) => '[${n.id}] ${n.title}：${n.summary} ${n.content}')
          .join('\n\n');
      try {
        final hits = await _rag.search(
          nodes.map((n) => n.title).join(' '),
          topK: 5,
        );
        final extra = hits.map((h) => h.content).join('\n');
        if (extra.isNotEmpty) knowledgeContext += '\n\n补充材料：\n$extra';
      } on AppException {
        // 离线跳过
      }

      final difficulty = Scoring.difficultyLabel(quizKind);
      final questions = await _generateQuestions(
        difficulty: difficulty,
        knowledgeContext: knowledgeContext,
        count: count,
        nodeIds: nodeIds.toSet(),
        onProgress: onProgress,
      );
      if (questions.isEmpty) {
        throw const AppException('出题失败，请稍后重试');
      }

      for (var i = 0; i < questions.length; i++) {
        final q = questions[i];
        await _db.into(_db.quizQuestions).insert(
              QuizQuestionsCompanion.insert(
                id: newUuid(),
                quizId: quizId,
                nodeId: Value(q['node_id']?.toString()),
                stem: q['stem'] as String,
                optionsJson: jsonEncode(q['options']),
                answerIndex: q['answer_index'] as int,
                explanation: Value(q['explanation'] as String),
                difficulty: Value(difficulty),
                orderIdx: Value(i),
              ),
            );
      }

      await (_db.update(_db.quizzes)..where((t) => t.id.equals(quizId)))
          .write(const QuizzesCompanion(status: Value('ready')));
      return quizId;
    } on AppException {
      await (_db.update(_db.quizzes)..where((t) => t.id.equals(quizId)))
          .write(const QuizzesCompanion(status: Value('failed')));
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> _generateQuestions({
    required String difficulty,
    required String knowledgeContext,
    required int count,
    required Set<String> nodeIds,
    void Function(String)? onProgress,
  }) async {
    final router = ref.read(llmRouterProvider);
    final all = <Map<String, dynamic>>[];
    final seenStems = <String>{};

    // 最多两轮补题
    for (var round = 0; round < 2 && all.length < count; round++) {
      final need = count - all.length;
      onProgress?.call(round == 0 ? '正在出题…' : '题量不足，补充出题…');
      final prompt = Prompts.quiz(
        difficulty: difficulty,
        knowledgeContext: knowledgeContext,
        count: need,
      );
      String raw;
      try {
        raw = await router.complete(ChatRequest(
          messages: [ChatMessage('user', prompt)],
          taskKind: TaskKind.quizGenerate,
          temperature: 0.5,
          jsonMode: true,
          systemOverride: '你是学科命题老师，只输出 JSON。',
        ));
      } on AppException {
        break;
      }
      final parsed = JsonRepair.extractObject(raw);
      final list = parsed?['questions'] as List<dynamic>? ?? const [];
      for (final item in list) {
        if (item is! Map<String, dynamic>) continue;
        final stem = item['stem']?.toString() ?? '';
        final options = (item['options'] as List<dynamic>? ?? const [])
            .map((e) => e.toString())
            .toList();
        final answerIndex = item['answer_index'] is int
            ? item['answer_index'] as int
            : int.tryParse('${item['answer_index']}') ?? -1;
        // 校验：题干非空且去重、选项数=4、答案越界、节点引用合法
        if (stem.isEmpty || !seenStems.add(stem)) continue;
        if (options.length != 4) continue;
        if (answerIndex < 0 || answerIndex > 3) continue;
        final nodeId = item['node_id']?.toString() ?? '';
        if (!nodeIds.contains(nodeId)) continue;
        all.add({
          'node_id': nodeId,
          'stem': stem,
          'options': options,
          'answer_index': answerIndex,
          'explanation': (item['explanation']?.toString() ?? '').trim(),
        });
        if (all.length >= count) break;
      }
    }
    return all;
  }

  /// 交卷判分。返回结果（含积分与勋章信息）。
  Future<QuizResult> submit({
    required String quizId,
    required List<AnswerEntry> answers,
  }) async {
    final quiz = await (_db.select(_db.quizzes)
          ..where((t) => t.id.equals(quizId)))
        .getSingleOrNull();
    if (quiz == null) throw const AppException('练习不存在');
    if (quiz.status == 'submitted') {
      throw const AppException('该练习已提交，不能重复计分');
    }

    final questions = await (_db.select(_db.quizQuestions)
          ..where((t) => t.quizId.equals(quizId))
          ..orderBy([(t) => OrderingTerm.asc(t.orderIdx)]))
        .get();
    if (questions.isEmpty) throw const AppException('练习没有题目');

    final answerMap = {for (final a in answers) a.questionId: a.selectedIndex};
    var correct = 0;
    for (final q in questions) {
      if (answerMap[q.id] == q.answerIndex) correct++;
    }
    final accuracy = correct / questions.length * 100;

    final points = Scoring.score(quiz.kind, accuracy);
    final badgeKind = Scoring.badgeKind(quiz.kind);
    var badgeGranted = false;
    String? badgePeriodKey;

    // 计分入账（仅当 >0；提交即锁定）
    if (points > 0) {
      await _reward.addPoints(
        delta: points,
        source: 'quiz',
        quizId: quizId,
        reason: '${Scoring.kindLabel(quiz.kind)} 得分（正确率 ${accuracy.toStringAsFixed(0)}%）',
      );
    }

    // 满分发勋章（period_key 幂等）
    if (badgeKind != null && Scoring.isPerfect(accuracy)) {
      final now = DateTime.now();
      badgePeriodKey = switch (badgeKind) {
        'weekly' => PracticeWindows.weekKey(now),
        'monthly' => PracticeWindows.monthKey(now),
        'annual' => PracticeWindows.yearKey(now),
        _ => '',
      };
      badgeGranted = await _reward.grantBadge(
        kind: badgeKind,
        periodKey: badgePeriodKey,
        quizId: quizId,
      );
    }

    await (_db.update(_db.quizzes)..where((t) => t.id.equals(quizId))).write(
      QuizzesCompanion(
        status: const Value('submitted'),
        accuracy: Value(accuracy),
        pointsAwarded: Value(points),
        badgeAwarded: Value(badgeGranted),
        submittedAt: Value(DateTime.now().millisecondsSinceEpoch),
      ),
    );

    // 阈值皮肤解锁检查
    final unlocked = await _reward.checkThresholdUnlocks();

    return QuizResult(
      quizId: quizId,
      accuracy: accuracy,
      points: points,
      badgeKind: badgeGranted ? badgeKind : null,
      badgePeriodKey: badgeGranted ? badgePeriodKey : null,
      unlockedSkins: unlocked.map((s) => s.name).toList(),
    );
  }

  /// 判分正确率（不落库，供预览）。
  static double previewAccuracy({
    required int totalQuestions,
    required int correct,
  }) =>
      totalQuestions == 0 ? 0 : correct / totalQuestions * 100;
}

final quizEngineProvider = Provider<QuizEngine>((ref) => QuizEngine(ref));
