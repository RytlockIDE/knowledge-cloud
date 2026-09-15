import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/uuid.dart';
import '../../data/models/app_db.dart';

/// 蒸馏快照仓库（版本化）。
class SnapshotRepository {
  final Ref ref;

  SnapshotRepository(this.ref);

  AppDb get _db => ref.read(appDbProvider);

  Future<List<CloudSnapshot>> all() => (_db.select(_db.cloudSnapshots)
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
      .get();

  Future<CloudSnapshot?> byId(String id) =>
      (_db.select(_db.cloudSnapshots)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  /// 同名 + 学段 + 学科追加新版本。
  Future<CloudSnapshot> create({
    required String name,
    required String gradeTag,
    required String subject,
    required List<Map<String, dynamic>> stages,
    required List<String> nodeIds,
    required List<String> edgeIds,
  }) async {
    final same = await (_db.select(_db.cloudSnapshots)
          ..where((t) =>
              t.name.equals(name) &
              t.gradeTag.equals(gradeTag) &
              t.subject.equals(subject)))
        .get();
    final version = same.isEmpty ? 1 : same.map((s) => s.version).reduce(max) + 1;
    final id = newUuid();
    await _db.into(_db.cloudSnapshots).insert(
          CloudSnapshotsCompanion.insert(
            id: id,
            name: name,
            gradeTag: gradeTag,
            subject: subject,
            version: version,
            stagesJson: Value(jsonEncode(stages)),
            nodeIdsJson: Value(jsonEncode(nodeIds)),
            edgeIdsJson: Value(jsonEncode(edgeIds)),
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
    return (await byId(id))!;
  }

  static int max(int a, int b) => a > b ? a : b;
}

final snapshotRepositoryProvider =
    Provider<SnapshotRepository>((ref) => SnapshotRepository(ref));
