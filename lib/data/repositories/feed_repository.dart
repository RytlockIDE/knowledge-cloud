import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/uuid.dart';
import '../../data/models/app_db.dart';

/// 投喂文档仓库。
class FeedRepository {
  final Ref ref;

  FeedRepository(this.ref);

  AppDb get _db => ref.read(appDbProvider);

  Future<List<FedDocument>> all() => (_db.select(_db.fedDocuments)
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
      .get();

  Future<FedDocument?> byId(String id) =>
      (_db.select(_db.fedDocuments)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<FedDocument> create({
    required String title,
    required String fileType,
    String rawPath = '',
    String cloudId = 'main',
  }) async {
    final id = newUuid();
    await _db.into(_db.fedDocuments).insert(
          FedDocumentsCompanion.insert(
            id: id,
            cloudId: cloudId,
            title: title,
            fileType: fileType,
            rawPath: Value(rawPath),
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
    return (await byId(id))!;
  }

  Future<void> update(String id,
      {String? status,
      String? parsedText,
      String? errorMsg,
      int? nodeCount}) {
    return (_db.update(_db.fedDocuments)..where((t) => t.id.equals(id)))
        .write(FedDocumentsCompanion(
      status: status == null ? const Value.absent() : Value(status),
      parsedText: parsedText == null ? const Value.absent() : Value(parsedText),
      errorMsg: errorMsg == null ? const Value.absent() : Value(errorMsg),
      nodeCount: nodeCount == null ? const Value.absent() : Value(nodeCount),
    ));
  }

  Future<void> delete(String id) async {
    await (_db.delete(_db.chunks)..where((t) => t.docId.equals(id))).go();
    await (_db.delete(_db.pipelineJobs)
          ..where((t) => t.docId.equals(id)))
        .go();
    await (_db.delete(_db.fedDocuments)..where((t) => t.id.equals(id))).go();
  }
}

final feedRepositoryProvider =
    Provider<FeedRepository>((ref) => FeedRepository(ref));
