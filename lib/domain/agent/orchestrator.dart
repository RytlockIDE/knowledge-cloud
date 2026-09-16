import 'dart:convert';
import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/app_config.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/json_repair.dart';
import '../../core/utils/uuid.dart';
import '../../data/models/app_db.dart';
import '../../data/repositories/feed_repository.dart';
import '../../data/repositories/graph_repository.dart';
import '../../services/ingest/wiki_client.dart';
import '../../services/llm/chat_client.dart';
import '../../services/llm/llm_router.dart';
import '../../services/rag/chunker.dart';
import '../../services/rag/rag_service.dart';
import 'prompts/prompts.dart';
import 'schema_validator.dart';

/// 智能体流水线阶段。
enum AgentStage { crawl, iterate, relate, locate }

/// 流水线进度事件。
class AgentProgress {
  final AgentStage stage;
  final String message;
  final double progress; // 0~1

  const AgentProgress(this.stage, this.message, {this.progress = 0});
}

/// 智能体四阶段编排器：
/// 抓取（投喂解析/维基抓取）→ 迭代（生成节点）→ 逻辑关联推敲（生成边）→ 节点定位（布局规则）。
/// 每阶段状态落库 pipeline_jobs，支持断点续跑。
class AgentOrchestrator {
  final Ref ref;

  AgentOrchestrator(this.ref);

  AppDb get _db => ref.read(appDbProvider);
  GraphRepository get _graph => ref.read(graphRepositoryProvider);
  FeedRepository get _feed => ref.read(feedRepositoryProvider);
  RagService get _rag => ref.read(ragServiceProvider);
  WikiClient get _wiki => ref.read(wikiClientProvider);
  Chunker get _chunker => const Chunker();

  /// 运行完整流水线。返回生成的子云 cloudId。
  Future<String> run({
    String? docId,
    String? crawlTopic,
    void Function(AgentProgress)? onProgress,
  }) async {
    final jobId = newUuid();
    final cloudId =
        docId != null ? 'feed_$docId' : 'crawl_${newUuid().substring(0, 8)}';

    await _ensureJob(jobId, docId: docId, topic: crawlTopic);

    try {
      // ── 阶段一：抓取 ──
      onProgress?.call(const AgentProgress(AgentStage.crawl, '正在抓取与解析材料…'));
      final material = await _stageCrawl(jobId, docId: docId, crawlTopic: crawlTopic);
      if (material.trim().isEmpty) {
        throw const AppException('未获取到可用材料，请检查网络或重新投喂文档');
      }

      // ── 阶段二：迭代（生成节点） ──
      onProgress?.call(const AgentProgress(AgentStage.iterate, '正在生成知识节点…'));
      final nodes = await _stageIterate(jobId, cloudId, material, docId,
          onProgress: onProgress);

      // ── 阶段三：逻辑关联推敲 ──
      onProgress?.call(const AgentProgress(AgentStage.relate, '正在推敲知识关联…'));
      await _stageRelate(jobId, nodes);

      // ── 阶段四：节点定位 ──
      onProgress
          ?.call(const AgentProgress(AgentStage.locate, '正在确定节点位置…'));
      await _stageLocate(nodes);

      if (docId != null) {
        await _feed.update(docId, status: 'done', nodeCount: nodes.length);
      }
      await _updateJob(jobId, stage: 'locate', status: 'done');
      onProgress?.call(AgentProgress(
          AgentStage.locate, '完成：生成 ${nodes.length} 个知识节点',
          progress: 1));
      return cloudId;
    } on AppException {
      await _failJob(jobId, '流水线失败');
      rethrow;
    }
  }

  // ───────────────────────── 阶段一：抓取 ─────────────────────────

  Future<String> _stageCrawl(
    String jobId, {
    String? docId,
    String? crawlTopic,
  }) async {
    await _updateJob(jobId, stage: 'crawl', status: 'running');
    if (docId != null) {
      final doc = await _feed.byId(docId);
      if (doc == null) throw const AppException('投喂文档不存在');
      await _feed.update(docId, status: 'parsed');
      final chunks = _chunker.chunk(doc.parsedText);
      await _rag.upsertChunks(
          docId: docId, texts: chunks.map((c) => c.content).toList());
      await _updateJob(jobId, payload: {'material_chars': doc.parsedText.length});
      return doc.parsedText;
    }

    // 自主抓取：维基百科（受限网络时 AI 兜底）
    final topic = crawlTopic ?? '';
    if (topic.isEmpty) throw const AppException('抓取主题为空');
    final buf = StringBuffer();
    final main = await _wiki.fetchSummary(topic);
    if (main == null) {
      if (!await _wiki.isReachable()) {
        // 维基百科无法访问（如大陆网络受限）→ 由 LLM 生成主题材料
        final fallback = await _llmCrawlMaterial(jobId, topic);
        if (fallback != null) return fallback;
        throw const AppException('维基百科无法访问，且 AI 兜底不可用（请检查网络与模型配置）');
      }
      throw AppException('维基百科未找到主题「$topic」，请换个说法重试');
    }
    buf.writeln(main.extract);
    final fullText = await _wiki.fetchPlainText(topic);
    if (fullText.isNotEmpty) buf.writeln(fullText);
    final related = await _wiki.fetchRelated(topic, limit: 8);
    for (final t in related.take(4)) {
      final p = await _wiki.fetchSummary(t);
      if (p != null && p.extract.isNotEmpty) {
        buf.writeln('\n【${p.title}】${p.extract}');
      }
    }
    final material = buf.toString();
    await _updateJob(
        jobId,
        payload: {'topic': topic, 'material_chars': material.length});
    return material;
  }

  /// 维基不可达时的 AI 兜底抓取：由 LLM 生成百科式主题材料。
  Future<String?> _llmCrawlMaterial(String jobId, String topic) async {
    try {
      final router = ref.read(llmRouterProvider);
      final text = await router.complete(ChatRequest(
        taskKind: TaskKind.crawlSummarize,
        temperature: 0.4,
        maxTokens: 2000,
        messages: [
          const ChatMessage(
              'system', '你是严谨的百科资料员，只输出客观事实，不编造不确定的内容。'),
          ChatMessage(
              'user',
              '请围绕主题「$topic」为学生生成构建知识云所需的百科材料，要求：\n'
                  '1. 先给一段 200 字左右的概述（定义与定位）；\n'
                  '2. 再分点列出 6-10 个核心概念/子主题，每个配 1-2 句说明；\n'
                  '3. 指出该主题与哪些邻近领域相关；\n'
                  '4. 用中文输出，直接给正文，不要客套话。'),
        ],
      ));
      if (text.trim().length < 50) return null;
      await _updateJob(
          jobId,
          payload: {
            'topic': topic,
            'material_chars': text.length,
            'source': 'llm',
          });
      return text;
    } on AppException {
      return null;
    }
  }

  // ───────────────────────── 阶段二：迭代 ─────────────────────────

  Future<List<KnowledgeNode>> _stageIterate(
    String jobId,
    String cloudId,
    String material,
    String? docId, {
    void Function(AgentProgress)? onProgress,
  }) async {
    await _updateJob(jobId, stage: 'iterate', status: 'running');
    final existing = await _graph.allNodes();
    final existingSummary =
        existing.take(80).map((n) => '${n.title}|${n.summary}').join('\n');

    final chunks = _chunker.chunk(material);
    final batches = <String>[];
    for (var i = 0; i < chunks.length; i += AppConfig.maxChunksPerBatch) {
      batches.add(chunks
          .skip(i)
          .take(AppConfig.maxChunksPerBatch)
          .map((c) => c.content)
          .join('\n\n'));
    }
    if (batches.isEmpty) batches.add(material);

    final created = <KnowledgeNode>[];
    final createdTitles = <String>{};
    final router = ref.read(llmRouterProvider);

    for (var b = 0; b < batches.length; b++) {
      onProgress?.call(
        AgentProgress(
          AgentStage.iterate,
          '生成知识节点（第 ${b + 1}/${batches.length} 批）…',
          progress: (b + 1) / batches.length,
        ),
      );
      final prompt = Prompts.iterate(
        existingNodesSummary:
            existingSummary.isEmpty ? '（暂无）' : existingSummary,
        material: batches[b],
      );
      String raw;
      try {
        raw = await router.complete(ChatRequest(
          messages: [ChatMessage('user', prompt)],
          taskKind: TaskKind.kgGenerate,
          temperature: 0.3,
          jsonMode: true,
          systemOverride: '你是严谨的学科知识工程师，只输出 JSON。',
        ));
      } on AppException {
        continue; // 单批失败不阻塞整体
      }

      final parsed = JsonRepair.extractObject(raw);
      final nodesRaw = parsed?['nodes'] as List<dynamic>? ?? const [];
      var valid = SchemaValidator.validNodes(nodesRaw);

      // 幻觉过滤：evidence 原文包含率
      valid = valid
          .where((n) => SchemaValidator.evidenceSupported(
              n['evidence'] as String, batches[b]))
          .toList();
      if (valid.length > AppConfig.maxNodesPerBatch) {
        valid = valid.sublist(0, AppConfig.maxNodesPerBatch);
      }

      for (final n in valid) {
        final title = n['title'] as String;
        if (createdTitles.contains(title) ||
            existing.any((e) => e.title == title)) {
          continue;
        }
        createdTitles.add(title);
        final node = await _graph.createNode(
          title: title,
          cloudId: cloudId,
          summary: n['summary'] as String,
          content: n['content'] as String,
          gradeTag: n['grade_tag'] as String,
          basicLevel: n['basic_level'] as int,
          necessity: n['necessity'] as int,
          source: docId != null ? 'user_feed' : 'agent_crawl',
          sourceDocId: docId,
          status: 'confirmed',
        );
        created.add(node);
        try {
          await _rag.indexNode(node);
        } on AppException {
          // 嵌入失败不阻塞（离线场景）
        }
      }
    }

    if (created.isEmpty) {
      throw const AppException('未能生成知识节点（材料可能不适用或模型输出异常）');
    }
    return created;
  }

  // ───────────────────────── 阶段三：关联推敲 ─────────────────────────

  Future<void> _stageRelate(String jobId, List<KnowledgeNode> nodes) async {
    await _updateJob(jobId, stage: 'relate', status: 'running');
    final router = ref.read(llmRouterProvider);
    final nodeIds = nodes.map((n) => n.id).toSet();

    final nodeList = nodes.map((n) => '${n.id}|${n.title}|${n.summary}').join('\n');
    final prompt = Prompts.relate(nodeList: nodeList);

    List<Map<String, dynamic>> edges = const [];
    for (var attempt = 0; attempt < 2; attempt++) {
      try {
        final raw = await router.complete(ChatRequest(
          messages: [ChatMessage('user', prompt)],
          taskKind: TaskKind.kgRelate,
          temperature: 0.2,
          jsonMode: true,
          systemOverride: '你是知识图谱专家，只输出 JSON。',
        ));
        final parsed = JsonRepair.extractObject(raw);
        final rawEdges = parsed?['edges'] as List<dynamic>? ?? const [];
        edges = SchemaValidator.validEdges(rawEdges, allNodeIds: nodeIds);
        if (edges.isNotEmpty) break;
      } on AppException {
        break;
      }
    }

    // 兜底：嵌入相似度生成 related 边
    if (edges.isEmpty && nodes.length >= 2) {
      edges = await _fallbackRelatedEdges(nodes);
    }

    for (final e in edges) {
      await _graph.createEdge(
        fromId: e['from'] as String,
        toId: e['to'] as String,
        relation: e['relation'] as String,
        confidence: e['confidence'] as double,
        createdBy: 'agent',
      );
    }
    await _graph.pruneMutualPrerequisites();
  }

  Future<List<Map<String, dynamic>>> _fallbackRelatedEdges(
      List<KnowledgeNode> nodes) async {
    final out = <Map<String, dynamic>>[];
    final vectors = <String, List<double>>{};
    for (final n in nodes) {
      try {
        vectors[n.id] = await _rag.embedOne('${n.title}\n${n.summary}');
      } on AppException {
        continue;
      }
    }
    final ids = vectors.keys.toList();
    for (var i = 0; i < ids.length; i++) {
      for (var j = i + 1; j < ids.length; j++) {
        final sim = _cosine(vectors[ids[i]]!, vectors[ids[j]]!);
        if (sim >= AppConfig.fallbackRelatedCosThreshold) {
          out.add({
            'from': ids[i],
            'to': ids[j],
            'relation': 'related',
            'confidence': 0.5,
            'reason': '语义相似度兜底',
          });
        }
      }
    }
    return SchemaValidator.capRelated(out, maxPerNode: 3);
  }

  // ───────────────────────── 阶段四：节点定位 ─────────────────────────

  Future<void> _stageLocate(List<KnowledgeNode> nodes) async {
    final edges = await _graph.edgesOfNodes(nodes.map((n) => n.id).toList());
    // 主题 = contains 边入度最高的节点，否则第一个
    final inDegree = <String, int>{};
    for (final e in edges) {
      if (e.relation == 'contains') {
        inDegree[e.fromId] = (inDegree[e.fromId] ?? 0) + 1;
      }
    }
    String rootId = nodes.first.id;
    var maxDeg = 0;
    inDegree.forEach((id, deg) {
      if (deg > maxDeg) {
        maxDeg = deg;
        rootId = id;
      }
    });
    final root = nodes.firstWhere((n) => n.id == rootId);

    for (final n in nodes) {
      await _graph.updateNode(n.id, layerPath: '${n.gradeTag}/${root.title}');
    }

    // 力导向初值：主题聚簇，极坐标均匀撒点避免重叠
    for (var i = 0; i < nodes.length; i++) {
      final angle = 2 * math.pi * i / nodes.length;
      final radius = 120.0 + (i % 5) * 40.0;
      final x = radius * math.cos(angle);
      final y = radius * math.sin(angle);
      await _graph.updateNodePosition(nodes[i].id, x, y);
    }
  }

  // ───────────────────────── Jobs 落库 ─────────────────────────

  Future<void> _ensureJob(String jobId, {String? docId, String? topic}) async {
    await _db.into(_db.pipelineJobs).insert(
          PipelineJobsCompanion.insert(
            id: jobId,
            docId: Value(docId),
            topic: Value(topic),
            stage: 'crawl',
            status: const Value('pending'),
            updatedAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
  }

  Future<void> _updateJob(String jobId,
      {String? stage, String? status, Map<String, dynamic>? payload}) async {
    final existing = await (_db.select(_db.pipelineJobs)
          ..where((t) => t.id.equals(jobId)))
        .getSingleOrNull();
    if (existing == null) return;
    final payloadMap = jsonDecode(existing.payloadJson) as Map<String, dynamic>;
    if (payload != null) payloadMap.addAll(payload);
    await (_db.update(_db.pipelineJobs)..where((t) => t.id.equals(jobId)))
        .write(PipelineJobsCompanion(
      stage: stage == null ? const Value.absent() : Value(stage),
      status: status == null ? const Value.absent() : Value(status),
      payloadJson: Value(jsonEncode(payloadMap)),
      updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
    ));
  }

  Future<void> _failJob(String jobId, String message) =>
      (_db.update(_db.pipelineJobs)..where((t) => t.id.equals(jobId))).write(
        PipelineJobsCompanion(
          status: const Value('failed'),
          error: Value(message),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );

  static double _cosine(List<double> a, List<double> b) {
    var dot = 0.0, na = 0.0, nb = 0.0;
    for (var i = 0; i < a.length && i < b.length; i++) {
      dot += a[i] * b[i];
      na += a[i] * a[i];
      nb += b[i] * b[i];
    }
    if (na == 0 || nb == 0) return 0;
    return dot / (math.sqrt(na) * math.sqrt(nb));
  }
}

final agentOrchestratorProvider =
    Provider<AgentOrchestrator>((ref) => AgentOrchestrator(ref));

final wikiClientProvider = Provider<WikiClient>((ref) => WikiClient());
