import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/app_db.dart';
import '../../core/utils/uuid.dart';

/// 知识图谱仓库：节点/边的读写。
class GraphRepository {
  final Ref ref;

  GraphRepository(this.ref);

  AppDb get _db => ref.read(appDbProvider);

  // ---- Nodes ----

  Future<List<KnowledgeNode>> nodesOfCloud(String cloudId) =>
      (_db.select(_db.knowledgeNodes)
            ..where((t) => t.cloudId.equals(cloudId)))
          .get();

  Future<List<KnowledgeNode>> allNodes() => _db.select(_db.knowledgeNodes).get();

  Stream<List<KnowledgeNode>> watchNodesOfCloud(String cloudId) =>
      (_db.select(_db.knowledgeNodes)
            ..where((t) => t.cloudId.equals(cloudId)))
          .watch();

  Future<KnowledgeNode?> nodeById(String id) =>
      (_db.select(_db.knowledgeNodes)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<KnowledgeNode> createNode({
    required String title,
    String cloudId = 'main',
    String summary = '',
    String content = '',
    String gradeTag = '通用',
    int basicLevel = 3,
    int necessity = 2,
    String source = 'manual',
    String? sourceDocId,
    String layerPath = '',
    String status = 'confirmed',
    String modelFingerprint = '',
  }) async {
    final id = newUuid();
    final now = DateTime.now().millisecondsSinceEpoch;
    await _db.into(_db.knowledgeNodes).insert(
          KnowledgeNodesCompanion.insert(
            id: id,
            cloudId: Value(cloudId),
            title: title,
            summary: Value(summary),
            content: Value(content),
            gradeTag: Value(gradeTag),
            basicLevel: Value(basicLevel),
            necessity: Value(necessity),
            source: Value(source),
            sourceDocId: Value(sourceDocId),
            layerPath: Value(layerPath),
            status: Value(status),
            modelFingerprint: Value(modelFingerprint),
            createdAt: now,
            updatedAt: now,
          ),
        );
    return (await nodeById(id))!;
  }

  Future<void> updateNode(String id, {
    String? title,
    String? summary,
    String? content,
    String? gradeTag,
    int? basicLevel,
    int? necessity,
    String? layerPath,
    String? status,
    double? posX,
    double? posY,
  }) {
    return (_db.update(_db.knowledgeNodes)..where((t) => t.id.equals(id)))
        .write(KnowledgeNodesCompanion(
      title: title == null ? const Value.absent() : Value(title),
      summary: summary == null ? const Value.absent() : Value(summary),
      content: content == null ? const Value.absent() : Value(content),
      gradeTag: gradeTag == null ? const Value.absent() : Value(gradeTag),
      basicLevel:
          basicLevel == null ? const Value.absent() : Value(basicLevel),
      necessity: necessity == null ? const Value.absent() : Value(necessity),
      layerPath: layerPath == null ? const Value.absent() : Value(layerPath),
      status: status == null ? const Value.absent() : Value(status),
      posX: posX == null ? const Value.absent() : Value(posX),
      posY: posY == null ? const Value.absent() : Value(posY),
      updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
    ));
  }

  Future<void> updateNodePosition(String id, double x, double y) =>
      (_db.update(_db.knowledgeNodes)..where((t) => t.id.equals(id))).write(
        KnowledgeNodesCompanion(
          posX: Value(x),
          posY: Value(y),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );

  Future<void> deleteNode(String id) async {
    await (_db.delete(_db.knowledgeEdges)
          ..where((t) => t.fromId.equals(id) | t.toId.equals(id)))
        .go();
    await (_db.delete(_db.chunks)..where((t) => t.nodeId.equals(id))).go();
    await (_db.delete(_db.knowledgeNodes)..where((t) => t.id.equals(id))).go();
  }

  Future<void> deleteCloud(String cloudId) async {
    final nodes =
        await (_db.select(_db.knowledgeNodes)
              ..where((t) => t.cloudId.equals(cloudId)))
            .get();
    for (final n in nodes) {
      await deleteNode(n.id);
    }
    if (cloudId != 'main') {
      await (_db.delete(_db.fedDocuments)
            ..where((t) => t.cloudId.equals(cloudId)))
          .go();
    }
  }

  // ---- Edges ----

  Future<List<KnowledgeEdge>> edgesOfNodes(List<String> nodeIds) {
    if (nodeIds.isEmpty) return Future.value(const []);
    return (_db.select(_db.knowledgeEdges)
          ..where((t) => t.fromId.isIn(nodeIds) | t.toId.isIn(nodeIds)))
        .get();
  }

  Future<List<KnowledgeEdge>> allEdges() => _db.select(_db.knowledgeEdges).get();

  Future<void> createEdge({
    required String fromId,
    required String toId,
    required String relation,
    double confidence = 0.8,
    String createdBy = 'user',
    String? snapshotId,
  }) async {
    if (fromId == toId) return;
    // 去重
    final existing = await (_db.select(_db.knowledgeEdges)
          ..where((t) =>
              (t.fromId.equals(fromId) & t.toId.equals(toId)) |
              (t.fromId.equals(toId) & t.toId.equals(fromId))))
        .getSingleOrNull();
    if (existing != null) return;
    await _db.into(_db.knowledgeEdges).insert(
          KnowledgeEdgesCompanion.insert(
            id: newUuid(),
            fromId: fromId,
            toId: toId,
            relation: relation,
            confidence: Value(confidence),
            createdBy: Value(createdBy),
            snapshotId: Value(snapshotId),
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
  }

  Future<void> deleteEdge(String id) =>
      (_db.delete(_db.knowledgeEdges)..where((t) => t.id.equals(id))).go();

  /// 移除互相前置对（保留 confidence 高者）。
  Future<void> pruneMutualPrerequisites() async {
    final edges = await (_db.select(_db.knowledgeEdges)
          ..where((t) => t.relation.equals('prerequisite')))
        .get();
    final seen = <String, KnowledgeEdge>{};
    for (final e in edges) {
      final key1 = '${e.fromId}->${e.toId}';
      final key2 = '${e.toId}->${e.fromId}';
      final other = seen[key2];
      if (other != null) {
        final loser = e.confidence >= other.confidence ? other : e;
        await deleteEdge(loser.id);
      } else {
        seen[key1] = e;
      }
    }
  }
}

final graphRepositoryProvider =
    Provider<GraphRepository>((ref) => GraphRepository(ref));
