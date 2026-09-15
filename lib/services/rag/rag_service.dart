import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/app_db.dart';
import '../../core/utils/uuid.dart';
import '../llm/llm_router.dart';
import '../settings_store.dart';
import 'vector_utils.dart';

/// RAG 服务：嵌入入库 + 余弦 TopK 检索。
/// 向量以 BLOB 存于 chunks 表，内存缓存 + 余弦暴力检索（单学科规模 <20000 块足够快）。
class RagService {
  final Ref ref;

  RagService(this.ref);

  AppDb get _db => ref.read(appDbProvider);
  SettingsStore get _settings => ref.read(settingsStoreProvider);

  String get _modelTag => _settings.embedModelTag;

  /// 文本嵌入（强制本地 Ollama）。
  Future<List<double>> embedOne(String text) async {
    final vectors = await ref.read(llmRouterProvider).ollama().embed([text]);
    return VectorUtils.normalize(vectors.first);
  }

  /// 批量嵌入并写入 chunks 表。
  Future<List<String>> upsertChunks({
    String? docId,
    String? nodeId,
    required List<String> texts,
  }) async {
    if (texts.isEmpty) return const [];
    final vectors =
        await ref.read(llmRouterProvider).ollama().embed(texts);
    final ids = <String>[];
    for (var i = 0; i < texts.length; i++) {
      final id = newUuid();
      ids.add(id);
      await _db.into(_db.chunks).insert(
            ChunksCompanion.insert(
              id: id,
              docId: Value(docId),
              nodeId: Value(nodeId),
              content: texts[i],
              embedding: Value(VectorUtils.toBlob(vectors[i])),
              dim: Value(vectors[i].length),
              modelTag: Value(_modelTag),
              createdAt: DateTime.now().millisecondsSinceEpoch,
            ),
          );
    }
    _invalidateCache();
    return ids;
  }

  /// 为知识节点内容建立向量索引。
  Future<void> indexNode(KnowledgeNode node) async {
    final text = '${node.title}\n${node.summary}\n${node.content}';
    await upsertChunks(nodeId: node.id, texts: [text]);
  }

  /// 余弦 TopK 检索。
  Future<List<RetrievalHit>> search(String query, {int topK = 6}) async {
    final queryVec = await embedOne(query);
    final rows = await _getAllChunks();
    final hits = <RetrievalHit>[];
    for (final row in rows) {
      if (row.embedding == null) continue;
      final vec = VectorUtils.fromBlob(row.embedding!);
      if (vec.isEmpty) continue;
      final score = VectorUtils.cosine(queryVec, vec);
      hits.add(
        RetrievalHit(
          chunkId: row.id,
          docId: row.docId,
          nodeId: row.nodeId,
          content: row.content,
          score: score,
        ),
      );
    }
    hits.sort((a, b) => b.score.compareTo(a.score));
    return hits.take(topK).toList();
  }

  /// 重建索引：清空所有块。返回删除的块数。
  Future<int> rebuildAll() async {
    final rows = await _getAllChunks();
    await (_db.delete(_db.chunks)).go();
    _invalidateCache();
    return rows.length;
  }

  List<Chunk>? _cache;

  Future<List<Chunk>> _getAllChunks() async {
    final cached = _cache;
    if (cached != null) return cached;
    final rows = await (_db.select(_db.chunks)).get();
    _cache = rows;
    return rows;
  }

  void _invalidateCache() => _cache = null;
}

final ragServiceProvider = Provider<RagService>((ref) => RagService(ref));
