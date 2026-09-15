import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/uuid.dart';
import '../../data/models/app_db.dart';

/// 学习记录仓库（"已掌握"标记）。
class LearningRepository {
  final Ref ref;

  LearningRepository(this.ref);

  AppDb get _db => ref.read(appDbProvider);

  /// 标记已掌握（幂等：同节点同来源只记一次）。
  Future<bool> markLearned(String nodeId,
      {String source = 'cloud_map'}) async {
    final existing = await (_db.select(_db.learningRecords)
          ..where((t) => t.nodeId.equals(nodeId) & t.source.equals(source)))
        .getSingleOrNull();
    if (existing != null) return false;
    await _db.into(_db.learningRecords).insert(
          LearningRecordsCompanion.insert(
            id: newUuid(),
            nodeId: nodeId,
            learnedAt: DateTime.now().millisecondsSinceEpoch,
            source: Value(source),
          ),
        );
    return true;
  }

  Future<bool> isLearned(String nodeId) async {
    final row = await (_db.select(_db.learningRecords)
          ..where((t) => t.nodeId.equals(nodeId)))
        .getSingleOrNull();
    return row != null;
  }

  Future<Set<String>> learnedNodeIds() async {
    final rows = await _db.select(_db.learningRecords).get();
    return rows.map((r) => r.nodeId).toSet();
  }

  /// 时间窗内（毫秒时间戳）的学习记录节点。
  Future<List<String>> learnedNodeIdsSince(int sinceMs) async {
    final rows = await (_db.select(_db.learningRecords)
          ..where((t) => t.learnedAt.isBiggerOrEqualValue(sinceMs)))
        .get();
    return rows.map((r) => r.nodeId).toList();
  }

  Stream<List<LearningRecord>> watchAll() =>
      _db.select(_db.learningRecords).watch();
}

final learningRepositoryProvider =
    Provider<LearningRepository>((ref) => LearningRepository(ref));

/// JSON 工具。
String jsonEncode2(Object o) => json.encode(o);
dynamic jsonDecode2(String s) => json.decode(s);
