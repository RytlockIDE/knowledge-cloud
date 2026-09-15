import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/app_exception.dart';
import '../../core/utils/json_repair.dart';
import '../../data/models/app_db.dart';
import '../../data/repositories/graph_repository.dart';
import '../../data/repositories/snapshot_repository.dart';
import '../../services/llm/chat_client.dart';
import '../../services/llm/llm_router.dart';
import '../../services/rag/rag_service.dart';
import '../agent/prompts/prompts.dart';

/// 年级蒸馏器：年级+学科 → 递进式知识云快照。
class Distiller {
  final Ref ref;

  Distiller(this.ref);

  GraphRepository get _graph => ref.read(graphRepositoryProvider);
  RagService get _rag => ref.read(ragServiceProvider);
  SnapshotRepository get _snapshots => ref.read(snapshotRepositoryProvider);

  /// 执行蒸馏。返回新快照。
  Future<CloudSnapshot> distill({
    required String gradeTag,
    required String subject,
    void Function(String message)? onProgress,
  }) async {
    onProgress?.call('正在检索候选知识…');

    // ① RAG 检索候选节点
    final allNodes = await _graph.nodesOfCloud('main');
    if (allNodes.isEmpty) {
      throw const AppException('主知识云为空，请先通过投喂或抓取构建知识');
    }
    const gradeOrder = {'小学': 0, '初中': 1, '高中': 2, '通用': 3};
    final targetOrder = gradeOrder[gradeTag] ?? 3;
    // 学段过滤：只保留目标学段及以下 + 通用
    var candidates = allNodes.where((n) {
      final o = gradeOrder[n.gradeTag] ?? 3;
      return o <= targetOrder || n.gradeTag == '通用';
    }).toList();

    // 必要度加权排序，取前 60
    candidates.sort((a, b) {
      final byNec = a.necessity.compareTo(b.necessity);
      if (byNec != 0) return byNec;
      return a.basicLevel.compareTo(b.basicLevel);
    });
    candidates = candidates.take(60).toList();

    // RAG 扩展查询（可用时提升相关性）
    try {
      final hits = await _rag.search('$gradeTag $subject 课程目标 核心知识', topK: 20);
      final hitNodeIds = hits.map((h) => h.nodeId).whereType<String>().toSet();
      final hitNodes =
          allNodes.where((n) => hitNodeIds.contains(n.id)).toSet();
      final merged = <String, KnowledgeNode>{
        for (final n in candidates) n.id: n,
        for (final n in hitNodes) n.id: n,
      };
      final mergedList = merged.values.toList()
        ..sort((a, b) => a.necessity.compareTo(b.necessity));
      candidates = mergedList.take(60).toList();
    } on AppException {
      // 离线：跳过 RAG 扩展
    }

    if (candidates.isEmpty) {
      throw const AppException('没有符合该学段的候选知识节点');
    }

    // ② 云端蒸馏
    onProgress?.call('正在按课程目标蒸馏知识云…');
    final candidateText = candidates
        .map((n) => '${n.id}|${n.title}|L${n.basicLevel}|N${n.necessity}')
        .join('\n');
    final router = ref.read(llmRouterProvider);
    final raw = await router.complete(ChatRequest(
      messages: [
        ChatMessage(
          'user',
          Prompts.distill(
              gradeTag: gradeTag, subject: subject, candidateNodes: candidateText),
        ),
      ],
      taskKind: TaskKind.distill,
      temperature: 0.3,
      jsonMode: true,
      systemOverride: '你是课程设计专家，只输出 JSON。',
    ));

    final parsed = JsonRepair.extractObject(raw);
    if (parsed == null) {
      throw const AppException('蒸馏输出解析失败，请重试');
    }

    final stagesRaw = parsed['stages'] as List<dynamic>? ?? const [];
    final stages = <Map<String, dynamic>>[];
    final validNodeIds = candidates.map((n) => n.id).toSet();
    final usedIds = <String>{};
    for (final s in stagesRaw) {
      if (s is! Map<String, dynamic>) continue;
      final name = s['name']?.toString() ?? '';
      final ids =
          (s['node_ids'] as List<dynamic>? ?? const [])
              .map((e) => e.toString())
              .where(validNodeIds.contains)
              .toList();
      if (name.isEmpty || ids.isEmpty) continue;
      usedIds.addAll(ids);
      stages.add({'name': name, 'node_ids': ids});
    }
    if (stages.isEmpty) {
      throw const AppException('蒸馏结果无有效阶段，请重试');
    }

    final prereqRaw = parsed['prerequisites'] as List<dynamic>? ?? const [];
    final prereqs = <Map<String, dynamic>>[];
    for (final p in prereqRaw) {
      if (p is! Map<String, dynamic>) continue;
      final from = p['from']?.toString() ?? '';
      final to = p['to']?.toString() ?? '';
      if (validNodeIds.contains(from) && validNodeIds.contains(to) && from != to) {
        prereqs.add({'from': from, 'to': to});
      }
    }

    // ③ 写入快照 + 补齐前置边
    onProgress?.call('正在保存知识云快照…');
    final edgeIds = <String>[];
    for (final p in prereqs) {
      await _graph.createEdge(
        fromId: p['from'] as String,
        toId: p['to'] as String,
        relation: 'prerequisite',
        confidence: 0.85,
        createdBy: 'agent',
      );
    }

    final snapshot = await _snapshots.create(
      name: '$gradeTag$subject知识云',
      gradeTag: gradeTag,
      subject: subject,
      stages: stages,
      nodeIds: usedIds.toList(),
      edgeIds: edgeIds,
    );
    onProgress?.call('蒸馏完成：${stages.length} 个阶段，${usedIds.length} 个知识点');
    return snapshot;
  }

  /// 快照的阶段结构解析。
  static List<({String name, List<String> nodeIds})> parseStages(
      CloudSnapshot snapshot) {
    final stagesJson = jsonDecode(snapshot.stagesJson) as List<dynamic>;
    return stagesJson
        .whereType<Map<String, dynamic>>()
        .map((s) => (
              name: s['name']?.toString() ?? '',
              nodeIds: (s['node_ids'] as List<dynamic>? ?? const [])
                  .map((e) => e.toString())
                  .toList(),
            ))
        .toList();
  }
}

final distillerProvider = Provider<Distiller>((ref) => Distiller(ref));
