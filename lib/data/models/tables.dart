import 'package:drift/drift.dart';

/// 知识节点表
class KnowledgeNodes extends Table {
  TextColumn get id => text()();
  TextColumn get cloudId => text().withDefault(const Constant('main'))();
  TextColumn get title => text().withLength(min: 1, max: 64)();
  TextColumn get summary => text().withDefault(const Constant(''))();
  TextColumn get content => text().withDefault(const Constant(''))();
  TextColumn get gradeTag => text().withDefault(const Constant('通用'))();
  IntColumn get basicLevel => integer().withDefault(const Constant(3))(); // 1~5
  IntColumn get necessity => integer().withDefault(const Constant(2))(); // 1~3
  TextColumn get source => text().withDefault(const Constant('manual'))(); // agent_crawl|user_feed|seed|manual
  TextColumn get sourceDocId => text().nullable()();
  TextColumn get layerPath => text().withDefault(const Constant(''))();
  RealColumn get posX => real().withDefault(const Constant(0))();
  RealColumn get posY => real().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('draft'))(); // draft|confirmed
  TextColumn get modelFingerprint => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 知识边表
class KnowledgeEdges extends Table {
  TextColumn get id => text()();
  TextColumn get fromId => text()();
  TextColumn get toId => text()();
  TextColumn get relation => text()(); // prerequisite|contains|related|inference
  RealColumn get confidence => real().withDefault(const Constant(0.8))();
  TextColumn get createdBy => text().withDefault(const Constant('agent'))(); // agent|user|agent_fallback
  TextColumn get snapshotId => text().nullable()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 投喂文档表
class FedDocuments extends Table {
  TextColumn get id => text()();
  TextColumn get cloudId => text()();
  TextColumn get title => text()();
  TextColumn get fileType => text()(); // txt|md|pdf|docx|wiki
  TextColumn get rawPath => text().withDefault(const Constant(''))();
  TextColumn get parsedText => text().withDefault(const Constant(''))();
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending|parsed|ingesting|done|failed
  TextColumn get errorMsg => text().nullable()();
  IntColumn get nodeCount => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// RAG 分块 + 向量
class Chunks extends Table {
  TextColumn get id => text()();
  TextColumn get docId => text().nullable()();
  TextColumn get nodeId => text().nullable()();
  TextColumn get content => text()();
  BlobColumn get embedding => blob().nullable()();
  IntColumn get dim => integer().withDefault(const Constant(0))();
  TextColumn get modelTag => text().withDefault(const Constant(''))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 对话会话
class Sessions extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().withDefault(const Constant('新对话'))();
  TextColumn get mode => text().withDefault(const Constant('chat'))(); // chat|rag
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 对话消息
class Messages extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text()();
  TextColumn get role => text()(); // user|assistant|system
  TextColumn get content => text()();
  TextColumn get citationsJson => text().nullable()();
  TextColumn get providerId => text().nullable()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 蒸馏快照
class CloudSnapshots extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get gradeTag => text()();
  TextColumn get subject => text()();
  IntColumn get version => integer()();
  TextColumn get stagesJson => text().withDefault(const Constant('[]'))();
  TextColumn get nodeIdsJson => text().withDefault(const Constant('[]'))();
  TextColumn get edgeIdsJson => text().withDefault(const Constant('[]'))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 智能体流水线作业（断点续跑）
class PipelineJobs extends Table {
  TextColumn get id => text()();
  TextColumn get docId => text().nullable()();
  TextColumn get topic => text().nullable()();
  TextColumn get stage => text()(); // crawl|iterate|relate|locate
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending|running|done|failed
  TextColumn get payloadJson => text().withDefault(const Constant('{}'))();
  TextColumn get error => text().nullable()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 学习记录（标记已掌握）
class LearningRecords extends Table {
  TextColumn get id => text()();
  TextColumn get nodeId => text()();
  IntColumn get learnedAt => integer()();
  TextColumn get source => text().withDefault(const Constant('cloud_map'))(); // distill|cloud_map|practice

  @override
  Set<Column> get primaryKey => {id};
}

/// 练习/考试
class Quizzes extends Table {
  TextColumn get id => text()();
  TextColumn get kind => text()(); // new_knowledge|daily|weekly|monthly|annual
  TextColumn get scopeJson => text().withDefault(const Constant('[]'))();
  TextColumn get status => text().withDefault(const Constant('generating'))(); // generating|ready|in_progress|submitted|failed
  RealColumn get accuracy => real().nullable()();
  IntColumn get pointsAwarded => integer().withDefault(const Constant(0))();
  BoolColumn get badgeAwarded => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();
  IntColumn get submittedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 练习题目
class QuizQuestions extends Table {
  TextColumn get id => text()();
  TextColumn get quizId => text()();
  TextColumn get nodeId => text().nullable()();
  TextColumn get stem => text()();
  TextColumn get optionsJson => text()();
  IntColumn get answerIndex => integer()();
  TextColumn get explanation => text().withDefault(const Constant(''))();
  TextColumn get difficulty => text().withDefault(const Constant('基础'))(); // 基础|进阶|综合
  IntColumn get orderIdx => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

/// 积分流水
class PointsLedger extends Table {
  TextColumn get id => text()();
  IntColumn get delta => integer()();
  TextColumn get source => text()(); // quiz|admin
  TextColumn get quizId => text().nullable()();
  TextColumn get reason => text().withDefault(const Constant(''))();
  IntColumn get balanceAfter => integer()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 勋章
class Badges extends Table {
  TextColumn get id => text()();
  TextColumn get kind => text()(); // weekly|monthly|annual
  TextColumn get periodKey => text()(); // 2026-W38 / 2026-09 / 2026
  TextColumn get quizId => text().nullable()();
  IntColumn get earnedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

/// 皮肤 Mod
class Skins extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()(); // theme|mascot|node_fx|frame
  TextColumn get unlockType => text()(); // redeem|threshold
  IntColumn get costPoints => integer().withDefault(const Constant(0))();
  IntColumn get thresholdPoints => integer().withDefault(const Constant(0))();
  TextColumn get requiredBadgesJson => text().withDefault(const Constant('{}'))();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get paletteRef => text().nullable()(); // 主题皮肤引用 AppPalette id
  IntColumn get ownedAt => integer().nullable()();
  BoolColumn get equipped => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

/// 键值设置
class SettingsEntries extends Table {
  TextColumn get key => text()();
  TextColumn get value => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {key};
}
