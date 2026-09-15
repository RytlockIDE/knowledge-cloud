import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';

part 'app_db.g.dart';

/// 全局数据库单例 Provider。
final appDbProvider = Provider<AppDb>((ref) {
  final db = AppDb();
  ref.onDispose(db.close);
  return db;
});

@DriftDatabase(
  tables: [
    KnowledgeNodes,
    KnowledgeEdges,
    FedDocuments,
    Chunks,
    Sessions,
    Messages,
    CloudSnapshots,
    PipelineJobs,
    LearningRecords,
    Quizzes,
    QuizQuestions,
    PointsLedger,
    Badges,
    Skins,
    SettingsEntries,
  ],
)
class AppDb extends _$AppDb {
  AppDb() : super(_open());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _open() {
    return LazyDatabase(() async {
      final support = await getApplicationSupportDirectory();
      final dir = Directory(p.join(support.path, 'knowledge_cloud'));
      if (!dir.existsSync()) dir.createSync(recursive: true);
      final file = File(p.join(dir.path, 'knowledge_cloud.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
