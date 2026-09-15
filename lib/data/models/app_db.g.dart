// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $KnowledgeNodesTable extends KnowledgeNodes
    with TableInfo<$KnowledgeNodesTable, KnowledgeNode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KnowledgeNodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cloudIdMeta = const VerificationMeta(
    'cloudId',
  );
  @override
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
    'cloud_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('main'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _gradeTagMeta = const VerificationMeta(
    'gradeTag',
  );
  @override
  late final GeneratedColumn<String> gradeTag = GeneratedColumn<String>(
    'grade_tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('通用'),
  );
  static const VerificationMeta _basicLevelMeta = const VerificationMeta(
    'basicLevel',
  );
  @override
  late final GeneratedColumn<int> basicLevel = GeneratedColumn<int>(
    'basic_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(3),
  );
  static const VerificationMeta _necessityMeta = const VerificationMeta(
    'necessity',
  );
  @override
  late final GeneratedColumn<int> necessity = GeneratedColumn<int>(
    'necessity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('manual'),
  );
  static const VerificationMeta _sourceDocIdMeta = const VerificationMeta(
    'sourceDocId',
  );
  @override
  late final GeneratedColumn<String> sourceDocId = GeneratedColumn<String>(
    'source_doc_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _layerPathMeta = const VerificationMeta(
    'layerPath',
  );
  @override
  late final GeneratedColumn<String> layerPath = GeneratedColumn<String>(
    'layer_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _posXMeta = const VerificationMeta('posX');
  @override
  late final GeneratedColumn<double> posX = GeneratedColumn<double>(
    'pos_x',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _posYMeta = const VerificationMeta('posY');
  @override
  late final GeneratedColumn<double> posY = GeneratedColumn<double>(
    'pos_y',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _modelFingerprintMeta = const VerificationMeta(
    'modelFingerprint',
  );
  @override
  late final GeneratedColumn<String> modelFingerprint = GeneratedColumn<String>(
    'model_fingerprint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cloudId,
    title,
    summary,
    content,
    gradeTag,
    basicLevel,
    necessity,
    source,
    sourceDocId,
    layerPath,
    posX,
    posY,
    status,
    modelFingerprint,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'knowledge_nodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<KnowledgeNode> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('cloud_id')) {
      context.handle(
        _cloudIdMeta,
        cloudId.isAcceptableOrUnknown(data['cloud_id']!, _cloudIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    }
    if (data.containsKey('grade_tag')) {
      context.handle(
        _gradeTagMeta,
        gradeTag.isAcceptableOrUnknown(data['grade_tag']!, _gradeTagMeta),
      );
    }
    if (data.containsKey('basic_level')) {
      context.handle(
        _basicLevelMeta,
        basicLevel.isAcceptableOrUnknown(data['basic_level']!, _basicLevelMeta),
      );
    }
    if (data.containsKey('necessity')) {
      context.handle(
        _necessityMeta,
        necessity.isAcceptableOrUnknown(data['necessity']!, _necessityMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('source_doc_id')) {
      context.handle(
        _sourceDocIdMeta,
        sourceDocId.isAcceptableOrUnknown(
          data['source_doc_id']!,
          _sourceDocIdMeta,
        ),
      );
    }
    if (data.containsKey('layer_path')) {
      context.handle(
        _layerPathMeta,
        layerPath.isAcceptableOrUnknown(data['layer_path']!, _layerPathMeta),
      );
    }
    if (data.containsKey('pos_x')) {
      context.handle(
        _posXMeta,
        posX.isAcceptableOrUnknown(data['pos_x']!, _posXMeta),
      );
    }
    if (data.containsKey('pos_y')) {
      context.handle(
        _posYMeta,
        posY.isAcceptableOrUnknown(data['pos_y']!, _posYMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('model_fingerprint')) {
      context.handle(
        _modelFingerprintMeta,
        modelFingerprint.isAcceptableOrUnknown(
          data['model_fingerprint']!,
          _modelFingerprintMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KnowledgeNode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KnowledgeNode(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cloudId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cloud_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      gradeTag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grade_tag'],
      )!,
      basicLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}basic_level'],
      )!,
      necessity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}necessity'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      sourceDocId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_doc_id'],
      ),
      layerPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}layer_path'],
      )!,
      posX: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pos_x'],
      )!,
      posY: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pos_y'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      modelFingerprint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_fingerprint'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $KnowledgeNodesTable createAlias(String alias) {
    return $KnowledgeNodesTable(attachedDatabase, alias);
  }
}

class KnowledgeNode extends DataClass implements Insertable<KnowledgeNode> {
  final String id;
  final String cloudId;
  final String title;
  final String summary;
  final String content;
  final String gradeTag;
  final int basicLevel;
  final int necessity;
  final String source;
  final String? sourceDocId;
  final String layerPath;
  final double posX;
  final double posY;
  final String status;
  final String modelFingerprint;
  final int createdAt;
  final int updatedAt;
  const KnowledgeNode({
    required this.id,
    required this.cloudId,
    required this.title,
    required this.summary,
    required this.content,
    required this.gradeTag,
    required this.basicLevel,
    required this.necessity,
    required this.source,
    this.sourceDocId,
    required this.layerPath,
    required this.posX,
    required this.posY,
    required this.status,
    required this.modelFingerprint,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['title'] = Variable<String>(title);
    map['summary'] = Variable<String>(summary);
    map['content'] = Variable<String>(content);
    map['grade_tag'] = Variable<String>(gradeTag);
    map['basic_level'] = Variable<int>(basicLevel);
    map['necessity'] = Variable<int>(necessity);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || sourceDocId != null) {
      map['source_doc_id'] = Variable<String>(sourceDocId);
    }
    map['layer_path'] = Variable<String>(layerPath);
    map['pos_x'] = Variable<double>(posX);
    map['pos_y'] = Variable<double>(posY);
    map['status'] = Variable<String>(status);
    map['model_fingerprint'] = Variable<String>(modelFingerprint);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  KnowledgeNodesCompanion toCompanion(bool nullToAbsent) {
    return KnowledgeNodesCompanion(
      id: Value(id),
      cloudId: Value(cloudId),
      title: Value(title),
      summary: Value(summary),
      content: Value(content),
      gradeTag: Value(gradeTag),
      basicLevel: Value(basicLevel),
      necessity: Value(necessity),
      source: Value(source),
      sourceDocId: sourceDocId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceDocId),
      layerPath: Value(layerPath),
      posX: Value(posX),
      posY: Value(posY),
      status: Value(status),
      modelFingerprint: Value(modelFingerprint),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory KnowledgeNode.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KnowledgeNode(
      id: serializer.fromJson<String>(json['id']),
      cloudId: serializer.fromJson<String>(json['cloudId']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String>(json['summary']),
      content: serializer.fromJson<String>(json['content']),
      gradeTag: serializer.fromJson<String>(json['gradeTag']),
      basicLevel: serializer.fromJson<int>(json['basicLevel']),
      necessity: serializer.fromJson<int>(json['necessity']),
      source: serializer.fromJson<String>(json['source']),
      sourceDocId: serializer.fromJson<String?>(json['sourceDocId']),
      layerPath: serializer.fromJson<String>(json['layerPath']),
      posX: serializer.fromJson<double>(json['posX']),
      posY: serializer.fromJson<double>(json['posY']),
      status: serializer.fromJson<String>(json['status']),
      modelFingerprint: serializer.fromJson<String>(json['modelFingerprint']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cloudId': serializer.toJson<String>(cloudId),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String>(summary),
      'content': serializer.toJson<String>(content),
      'gradeTag': serializer.toJson<String>(gradeTag),
      'basicLevel': serializer.toJson<int>(basicLevel),
      'necessity': serializer.toJson<int>(necessity),
      'source': serializer.toJson<String>(source),
      'sourceDocId': serializer.toJson<String?>(sourceDocId),
      'layerPath': serializer.toJson<String>(layerPath),
      'posX': serializer.toJson<double>(posX),
      'posY': serializer.toJson<double>(posY),
      'status': serializer.toJson<String>(status),
      'modelFingerprint': serializer.toJson<String>(modelFingerprint),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  KnowledgeNode copyWith({
    String? id,
    String? cloudId,
    String? title,
    String? summary,
    String? content,
    String? gradeTag,
    int? basicLevel,
    int? necessity,
    String? source,
    Value<String?> sourceDocId = const Value.absent(),
    String? layerPath,
    double? posX,
    double? posY,
    String? status,
    String? modelFingerprint,
    int? createdAt,
    int? updatedAt,
  }) => KnowledgeNode(
    id: id ?? this.id,
    cloudId: cloudId ?? this.cloudId,
    title: title ?? this.title,
    summary: summary ?? this.summary,
    content: content ?? this.content,
    gradeTag: gradeTag ?? this.gradeTag,
    basicLevel: basicLevel ?? this.basicLevel,
    necessity: necessity ?? this.necessity,
    source: source ?? this.source,
    sourceDocId: sourceDocId.present ? sourceDocId.value : this.sourceDocId,
    layerPath: layerPath ?? this.layerPath,
    posX: posX ?? this.posX,
    posY: posY ?? this.posY,
    status: status ?? this.status,
    modelFingerprint: modelFingerprint ?? this.modelFingerprint,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  KnowledgeNode copyWithCompanion(KnowledgeNodesCompanion data) {
    return KnowledgeNode(
      id: data.id.present ? data.id.value : this.id,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      content: data.content.present ? data.content.value : this.content,
      gradeTag: data.gradeTag.present ? data.gradeTag.value : this.gradeTag,
      basicLevel: data.basicLevel.present
          ? data.basicLevel.value
          : this.basicLevel,
      necessity: data.necessity.present ? data.necessity.value : this.necessity,
      source: data.source.present ? data.source.value : this.source,
      sourceDocId: data.sourceDocId.present
          ? data.sourceDocId.value
          : this.sourceDocId,
      layerPath: data.layerPath.present ? data.layerPath.value : this.layerPath,
      posX: data.posX.present ? data.posX.value : this.posX,
      posY: data.posY.present ? data.posY.value : this.posY,
      status: data.status.present ? data.status.value : this.status,
      modelFingerprint: data.modelFingerprint.present
          ? data.modelFingerprint.value
          : this.modelFingerprint,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeNode(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('content: $content, ')
          ..write('gradeTag: $gradeTag, ')
          ..write('basicLevel: $basicLevel, ')
          ..write('necessity: $necessity, ')
          ..write('source: $source, ')
          ..write('sourceDocId: $sourceDocId, ')
          ..write('layerPath: $layerPath, ')
          ..write('posX: $posX, ')
          ..write('posY: $posY, ')
          ..write('status: $status, ')
          ..write('modelFingerprint: $modelFingerprint, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cloudId,
    title,
    summary,
    content,
    gradeTag,
    basicLevel,
    necessity,
    source,
    sourceDocId,
    layerPath,
    posX,
    posY,
    status,
    modelFingerprint,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KnowledgeNode &&
          other.id == this.id &&
          other.cloudId == this.cloudId &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.content == this.content &&
          other.gradeTag == this.gradeTag &&
          other.basicLevel == this.basicLevel &&
          other.necessity == this.necessity &&
          other.source == this.source &&
          other.sourceDocId == this.sourceDocId &&
          other.layerPath == this.layerPath &&
          other.posX == this.posX &&
          other.posY == this.posY &&
          other.status == this.status &&
          other.modelFingerprint == this.modelFingerprint &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class KnowledgeNodesCompanion extends UpdateCompanion<KnowledgeNode> {
  final Value<String> id;
  final Value<String> cloudId;
  final Value<String> title;
  final Value<String> summary;
  final Value<String> content;
  final Value<String> gradeTag;
  final Value<int> basicLevel;
  final Value<int> necessity;
  final Value<String> source;
  final Value<String?> sourceDocId;
  final Value<String> layerPath;
  final Value<double> posX;
  final Value<double> posY;
  final Value<String> status;
  final Value<String> modelFingerprint;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const KnowledgeNodesCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.content = const Value.absent(),
    this.gradeTag = const Value.absent(),
    this.basicLevel = const Value.absent(),
    this.necessity = const Value.absent(),
    this.source = const Value.absent(),
    this.sourceDocId = const Value.absent(),
    this.layerPath = const Value.absent(),
    this.posX = const Value.absent(),
    this.posY = const Value.absent(),
    this.status = const Value.absent(),
    this.modelFingerprint = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KnowledgeNodesCompanion.insert({
    required String id,
    this.cloudId = const Value.absent(),
    required String title,
    this.summary = const Value.absent(),
    this.content = const Value.absent(),
    this.gradeTag = const Value.absent(),
    this.basicLevel = const Value.absent(),
    this.necessity = const Value.absent(),
    this.source = const Value.absent(),
    this.sourceDocId = const Value.absent(),
    this.layerPath = const Value.absent(),
    this.posX = const Value.absent(),
    this.posY = const Value.absent(),
    this.status = const Value.absent(),
    this.modelFingerprint = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<KnowledgeNode> custom({
    Expression<String>? id,
    Expression<String>? cloudId,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<String>? content,
    Expression<String>? gradeTag,
    Expression<int>? basicLevel,
    Expression<int>? necessity,
    Expression<String>? source,
    Expression<String>? sourceDocId,
    Expression<String>? layerPath,
    Expression<double>? posX,
    Expression<double>? posY,
    Expression<String>? status,
    Expression<String>? modelFingerprint,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudId != null) 'cloud_id': cloudId,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (content != null) 'content': content,
      if (gradeTag != null) 'grade_tag': gradeTag,
      if (basicLevel != null) 'basic_level': basicLevel,
      if (necessity != null) 'necessity': necessity,
      if (source != null) 'source': source,
      if (sourceDocId != null) 'source_doc_id': sourceDocId,
      if (layerPath != null) 'layer_path': layerPath,
      if (posX != null) 'pos_x': posX,
      if (posY != null) 'pos_y': posY,
      if (status != null) 'status': status,
      if (modelFingerprint != null) 'model_fingerprint': modelFingerprint,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KnowledgeNodesCompanion copyWith({
    Value<String>? id,
    Value<String>? cloudId,
    Value<String>? title,
    Value<String>? summary,
    Value<String>? content,
    Value<String>? gradeTag,
    Value<int>? basicLevel,
    Value<int>? necessity,
    Value<String>? source,
    Value<String?>? sourceDocId,
    Value<String>? layerPath,
    Value<double>? posX,
    Value<double>? posY,
    Value<String>? status,
    Value<String>? modelFingerprint,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return KnowledgeNodesCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      content: content ?? this.content,
      gradeTag: gradeTag ?? this.gradeTag,
      basicLevel: basicLevel ?? this.basicLevel,
      necessity: necessity ?? this.necessity,
      source: source ?? this.source,
      sourceDocId: sourceDocId ?? this.sourceDocId,
      layerPath: layerPath ?? this.layerPath,
      posX: posX ?? this.posX,
      posY: posY ?? this.posY,
      status: status ?? this.status,
      modelFingerprint: modelFingerprint ?? this.modelFingerprint,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cloudId.present) {
      map['cloud_id'] = Variable<String>(cloudId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (gradeTag.present) {
      map['grade_tag'] = Variable<String>(gradeTag.value);
    }
    if (basicLevel.present) {
      map['basic_level'] = Variable<int>(basicLevel.value);
    }
    if (necessity.present) {
      map['necessity'] = Variable<int>(necessity.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (sourceDocId.present) {
      map['source_doc_id'] = Variable<String>(sourceDocId.value);
    }
    if (layerPath.present) {
      map['layer_path'] = Variable<String>(layerPath.value);
    }
    if (posX.present) {
      map['pos_x'] = Variable<double>(posX.value);
    }
    if (posY.present) {
      map['pos_y'] = Variable<double>(posY.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (modelFingerprint.present) {
      map['model_fingerprint'] = Variable<String>(modelFingerprint.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeNodesCompanion(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('content: $content, ')
          ..write('gradeTag: $gradeTag, ')
          ..write('basicLevel: $basicLevel, ')
          ..write('necessity: $necessity, ')
          ..write('source: $source, ')
          ..write('sourceDocId: $sourceDocId, ')
          ..write('layerPath: $layerPath, ')
          ..write('posX: $posX, ')
          ..write('posY: $posY, ')
          ..write('status: $status, ')
          ..write('modelFingerprint: $modelFingerprint, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KnowledgeEdgesTable extends KnowledgeEdges
    with TableInfo<$KnowledgeEdgesTable, KnowledgeEdge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KnowledgeEdgesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromIdMeta = const VerificationMeta('fromId');
  @override
  late final GeneratedColumn<String> fromId = GeneratedColumn<String>(
    'from_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toIdMeta = const VerificationMeta('toId');
  @override
  late final GeneratedColumn<String> toId = GeneratedColumn<String>(
    'to_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relationMeta = const VerificationMeta(
    'relation',
  );
  @override
  late final GeneratedColumn<String> relation = GeneratedColumn<String>(
    'relation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
    'confidence',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.8),
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('agent'),
  );
  static const VerificationMeta _snapshotIdMeta = const VerificationMeta(
    'snapshotId',
  );
  @override
  late final GeneratedColumn<String> snapshotId = GeneratedColumn<String>(
    'snapshot_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fromId,
    toId,
    relation,
    confidence,
    createdBy,
    snapshotId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'knowledge_edges';
  @override
  VerificationContext validateIntegrity(
    Insertable<KnowledgeEdge> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('from_id')) {
      context.handle(
        _fromIdMeta,
        fromId.isAcceptableOrUnknown(data['from_id']!, _fromIdMeta),
      );
    } else if (isInserting) {
      context.missing(_fromIdMeta);
    }
    if (data.containsKey('to_id')) {
      context.handle(
        _toIdMeta,
        toId.isAcceptableOrUnknown(data['to_id']!, _toIdMeta),
      );
    } else if (isInserting) {
      context.missing(_toIdMeta);
    }
    if (data.containsKey('relation')) {
      context.handle(
        _relationMeta,
        relation.isAcceptableOrUnknown(data['relation']!, _relationMeta),
      );
    } else if (isInserting) {
      context.missing(_relationMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    }
    if (data.containsKey('snapshot_id')) {
      context.handle(
        _snapshotIdMeta,
        snapshotId.isAcceptableOrUnknown(data['snapshot_id']!, _snapshotIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KnowledgeEdge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KnowledgeEdge(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      fromId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_id'],
      )!,
      toId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_id'],
      )!,
      relation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}relation'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}confidence'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      )!,
      snapshotId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}snapshot_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $KnowledgeEdgesTable createAlias(String alias) {
    return $KnowledgeEdgesTable(attachedDatabase, alias);
  }
}

class KnowledgeEdge extends DataClass implements Insertable<KnowledgeEdge> {
  final String id;
  final String fromId;
  final String toId;
  final String relation;
  final double confidence;
  final String createdBy;
  final String? snapshotId;
  final int createdAt;
  const KnowledgeEdge({
    required this.id,
    required this.fromId,
    required this.toId,
    required this.relation,
    required this.confidence,
    required this.createdBy,
    this.snapshotId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['from_id'] = Variable<String>(fromId);
    map['to_id'] = Variable<String>(toId);
    map['relation'] = Variable<String>(relation);
    map['confidence'] = Variable<double>(confidence);
    map['created_by'] = Variable<String>(createdBy);
    if (!nullToAbsent || snapshotId != null) {
      map['snapshot_id'] = Variable<String>(snapshotId);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  KnowledgeEdgesCompanion toCompanion(bool nullToAbsent) {
    return KnowledgeEdgesCompanion(
      id: Value(id),
      fromId: Value(fromId),
      toId: Value(toId),
      relation: Value(relation),
      confidence: Value(confidence),
      createdBy: Value(createdBy),
      snapshotId: snapshotId == null && nullToAbsent
          ? const Value.absent()
          : Value(snapshotId),
      createdAt: Value(createdAt),
    );
  }

  factory KnowledgeEdge.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KnowledgeEdge(
      id: serializer.fromJson<String>(json['id']),
      fromId: serializer.fromJson<String>(json['fromId']),
      toId: serializer.fromJson<String>(json['toId']),
      relation: serializer.fromJson<String>(json['relation']),
      confidence: serializer.fromJson<double>(json['confidence']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      snapshotId: serializer.fromJson<String?>(json['snapshotId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fromId': serializer.toJson<String>(fromId),
      'toId': serializer.toJson<String>(toId),
      'relation': serializer.toJson<String>(relation),
      'confidence': serializer.toJson<double>(confidence),
      'createdBy': serializer.toJson<String>(createdBy),
      'snapshotId': serializer.toJson<String?>(snapshotId),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  KnowledgeEdge copyWith({
    String? id,
    String? fromId,
    String? toId,
    String? relation,
    double? confidence,
    String? createdBy,
    Value<String?> snapshotId = const Value.absent(),
    int? createdAt,
  }) => KnowledgeEdge(
    id: id ?? this.id,
    fromId: fromId ?? this.fromId,
    toId: toId ?? this.toId,
    relation: relation ?? this.relation,
    confidence: confidence ?? this.confidence,
    createdBy: createdBy ?? this.createdBy,
    snapshotId: snapshotId.present ? snapshotId.value : this.snapshotId,
    createdAt: createdAt ?? this.createdAt,
  );
  KnowledgeEdge copyWithCompanion(KnowledgeEdgesCompanion data) {
    return KnowledgeEdge(
      id: data.id.present ? data.id.value : this.id,
      fromId: data.fromId.present ? data.fromId.value : this.fromId,
      toId: data.toId.present ? data.toId.value : this.toId,
      relation: data.relation.present ? data.relation.value : this.relation,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      snapshotId: data.snapshotId.present
          ? data.snapshotId.value
          : this.snapshotId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeEdge(')
          ..write('id: $id, ')
          ..write('fromId: $fromId, ')
          ..write('toId: $toId, ')
          ..write('relation: $relation, ')
          ..write('confidence: $confidence, ')
          ..write('createdBy: $createdBy, ')
          ..write('snapshotId: $snapshotId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fromId,
    toId,
    relation,
    confidence,
    createdBy,
    snapshotId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KnowledgeEdge &&
          other.id == this.id &&
          other.fromId == this.fromId &&
          other.toId == this.toId &&
          other.relation == this.relation &&
          other.confidence == this.confidence &&
          other.createdBy == this.createdBy &&
          other.snapshotId == this.snapshotId &&
          other.createdAt == this.createdAt);
}

class KnowledgeEdgesCompanion extends UpdateCompanion<KnowledgeEdge> {
  final Value<String> id;
  final Value<String> fromId;
  final Value<String> toId;
  final Value<String> relation;
  final Value<double> confidence;
  final Value<String> createdBy;
  final Value<String?> snapshotId;
  final Value<int> createdAt;
  final Value<int> rowid;
  const KnowledgeEdgesCompanion({
    this.id = const Value.absent(),
    this.fromId = const Value.absent(),
    this.toId = const Value.absent(),
    this.relation = const Value.absent(),
    this.confidence = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.snapshotId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KnowledgeEdgesCompanion.insert({
    required String id,
    required String fromId,
    required String toId,
    required String relation,
    this.confidence = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.snapshotId = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fromId = Value(fromId),
       toId = Value(toId),
       relation = Value(relation),
       createdAt = Value(createdAt);
  static Insertable<KnowledgeEdge> custom({
    Expression<String>? id,
    Expression<String>? fromId,
    Expression<String>? toId,
    Expression<String>? relation,
    Expression<double>? confidence,
    Expression<String>? createdBy,
    Expression<String>? snapshotId,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fromId != null) 'from_id': fromId,
      if (toId != null) 'to_id': toId,
      if (relation != null) 'relation': relation,
      if (confidence != null) 'confidence': confidence,
      if (createdBy != null) 'created_by': createdBy,
      if (snapshotId != null) 'snapshot_id': snapshotId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KnowledgeEdgesCompanion copyWith({
    Value<String>? id,
    Value<String>? fromId,
    Value<String>? toId,
    Value<String>? relation,
    Value<double>? confidence,
    Value<String>? createdBy,
    Value<String?>? snapshotId,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return KnowledgeEdgesCompanion(
      id: id ?? this.id,
      fromId: fromId ?? this.fromId,
      toId: toId ?? this.toId,
      relation: relation ?? this.relation,
      confidence: confidence ?? this.confidence,
      createdBy: createdBy ?? this.createdBy,
      snapshotId: snapshotId ?? this.snapshotId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fromId.present) {
      map['from_id'] = Variable<String>(fromId.value);
    }
    if (toId.present) {
      map['to_id'] = Variable<String>(toId.value);
    }
    if (relation.present) {
      map['relation'] = Variable<String>(relation.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (snapshotId.present) {
      map['snapshot_id'] = Variable<String>(snapshotId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeEdgesCompanion(')
          ..write('id: $id, ')
          ..write('fromId: $fromId, ')
          ..write('toId: $toId, ')
          ..write('relation: $relation, ')
          ..write('confidence: $confidence, ')
          ..write('createdBy: $createdBy, ')
          ..write('snapshotId: $snapshotId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FedDocumentsTable extends FedDocuments
    with TableInfo<$FedDocumentsTable, FedDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FedDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cloudIdMeta = const VerificationMeta(
    'cloudId',
  );
  @override
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
    'cloud_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rawPathMeta = const VerificationMeta(
    'rawPath',
  );
  @override
  late final GeneratedColumn<String> rawPath = GeneratedColumn<String>(
    'raw_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _parsedTextMeta = const VerificationMeta(
    'parsedText',
  );
  @override
  late final GeneratedColumn<String> parsedText = GeneratedColumn<String>(
    'parsed_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _errorMsgMeta = const VerificationMeta(
    'errorMsg',
  );
  @override
  late final GeneratedColumn<String> errorMsg = GeneratedColumn<String>(
    'error_msg',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nodeCountMeta = const VerificationMeta(
    'nodeCount',
  );
  @override
  late final GeneratedColumn<int> nodeCount = GeneratedColumn<int>(
    'node_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cloudId,
    title,
    fileType,
    rawPath,
    parsedText,
    status,
    errorMsg,
    nodeCount,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fed_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<FedDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('cloud_id')) {
      context.handle(
        _cloudIdMeta,
        cloudId.isAcceptableOrUnknown(data['cloud_id']!, _cloudIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cloudIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('raw_path')) {
      context.handle(
        _rawPathMeta,
        rawPath.isAcceptableOrUnknown(data['raw_path']!, _rawPathMeta),
      );
    }
    if (data.containsKey('parsed_text')) {
      context.handle(
        _parsedTextMeta,
        parsedText.isAcceptableOrUnknown(data['parsed_text']!, _parsedTextMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('error_msg')) {
      context.handle(
        _errorMsgMeta,
        errorMsg.isAcceptableOrUnknown(data['error_msg']!, _errorMsgMeta),
      );
    }
    if (data.containsKey('node_count')) {
      context.handle(
        _nodeCountMeta,
        nodeCount.isAcceptableOrUnknown(data['node_count']!, _nodeCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FedDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FedDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cloudId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cloud_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      rawPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_path'],
      )!,
      parsedText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parsed_text'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      errorMsg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_msg'],
      ),
      nodeCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}node_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FedDocumentsTable createAlias(String alias) {
    return $FedDocumentsTable(attachedDatabase, alias);
  }
}

class FedDocument extends DataClass implements Insertable<FedDocument> {
  final String id;
  final String cloudId;
  final String title;
  final String fileType;
  final String rawPath;
  final String parsedText;
  final String status;
  final String? errorMsg;
  final int nodeCount;
  final int createdAt;
  const FedDocument({
    required this.id,
    required this.cloudId,
    required this.title,
    required this.fileType,
    required this.rawPath,
    required this.parsedText,
    required this.status,
    this.errorMsg,
    required this.nodeCount,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['cloud_id'] = Variable<String>(cloudId);
    map['title'] = Variable<String>(title);
    map['file_type'] = Variable<String>(fileType);
    map['raw_path'] = Variable<String>(rawPath);
    map['parsed_text'] = Variable<String>(parsedText);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || errorMsg != null) {
      map['error_msg'] = Variable<String>(errorMsg);
    }
    map['node_count'] = Variable<int>(nodeCount);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  FedDocumentsCompanion toCompanion(bool nullToAbsent) {
    return FedDocumentsCompanion(
      id: Value(id),
      cloudId: Value(cloudId),
      title: Value(title),
      fileType: Value(fileType),
      rawPath: Value(rawPath),
      parsedText: Value(parsedText),
      status: Value(status),
      errorMsg: errorMsg == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMsg),
      nodeCount: Value(nodeCount),
      createdAt: Value(createdAt),
    );
  }

  factory FedDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FedDocument(
      id: serializer.fromJson<String>(json['id']),
      cloudId: serializer.fromJson<String>(json['cloudId']),
      title: serializer.fromJson<String>(json['title']),
      fileType: serializer.fromJson<String>(json['fileType']),
      rawPath: serializer.fromJson<String>(json['rawPath']),
      parsedText: serializer.fromJson<String>(json['parsedText']),
      status: serializer.fromJson<String>(json['status']),
      errorMsg: serializer.fromJson<String?>(json['errorMsg']),
      nodeCount: serializer.fromJson<int>(json['nodeCount']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cloudId': serializer.toJson<String>(cloudId),
      'title': serializer.toJson<String>(title),
      'fileType': serializer.toJson<String>(fileType),
      'rawPath': serializer.toJson<String>(rawPath),
      'parsedText': serializer.toJson<String>(parsedText),
      'status': serializer.toJson<String>(status),
      'errorMsg': serializer.toJson<String?>(errorMsg),
      'nodeCount': serializer.toJson<int>(nodeCount),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  FedDocument copyWith({
    String? id,
    String? cloudId,
    String? title,
    String? fileType,
    String? rawPath,
    String? parsedText,
    String? status,
    Value<String?> errorMsg = const Value.absent(),
    int? nodeCount,
    int? createdAt,
  }) => FedDocument(
    id: id ?? this.id,
    cloudId: cloudId ?? this.cloudId,
    title: title ?? this.title,
    fileType: fileType ?? this.fileType,
    rawPath: rawPath ?? this.rawPath,
    parsedText: parsedText ?? this.parsedText,
    status: status ?? this.status,
    errorMsg: errorMsg.present ? errorMsg.value : this.errorMsg,
    nodeCount: nodeCount ?? this.nodeCount,
    createdAt: createdAt ?? this.createdAt,
  );
  FedDocument copyWithCompanion(FedDocumentsCompanion data) {
    return FedDocument(
      id: data.id.present ? data.id.value : this.id,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      title: data.title.present ? data.title.value : this.title,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      rawPath: data.rawPath.present ? data.rawPath.value : this.rawPath,
      parsedText: data.parsedText.present
          ? data.parsedText.value
          : this.parsedText,
      status: data.status.present ? data.status.value : this.status,
      errorMsg: data.errorMsg.present ? data.errorMsg.value : this.errorMsg,
      nodeCount: data.nodeCount.present ? data.nodeCount.value : this.nodeCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FedDocument(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('fileType: $fileType, ')
          ..write('rawPath: $rawPath, ')
          ..write('parsedText: $parsedText, ')
          ..write('status: $status, ')
          ..write('errorMsg: $errorMsg, ')
          ..write('nodeCount: $nodeCount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cloudId,
    title,
    fileType,
    rawPath,
    parsedText,
    status,
    errorMsg,
    nodeCount,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FedDocument &&
          other.id == this.id &&
          other.cloudId == this.cloudId &&
          other.title == this.title &&
          other.fileType == this.fileType &&
          other.rawPath == this.rawPath &&
          other.parsedText == this.parsedText &&
          other.status == this.status &&
          other.errorMsg == this.errorMsg &&
          other.nodeCount == this.nodeCount &&
          other.createdAt == this.createdAt);
}

class FedDocumentsCompanion extends UpdateCompanion<FedDocument> {
  final Value<String> id;
  final Value<String> cloudId;
  final Value<String> title;
  final Value<String> fileType;
  final Value<String> rawPath;
  final Value<String> parsedText;
  final Value<String> status;
  final Value<String?> errorMsg;
  final Value<int> nodeCount;
  final Value<int> createdAt;
  final Value<int> rowid;
  const FedDocumentsCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.title = const Value.absent(),
    this.fileType = const Value.absent(),
    this.rawPath = const Value.absent(),
    this.parsedText = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMsg = const Value.absent(),
    this.nodeCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FedDocumentsCompanion.insert({
    required String id,
    required String cloudId,
    required String title,
    required String fileType,
    this.rawPath = const Value.absent(),
    this.parsedText = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMsg = const Value.absent(),
    this.nodeCount = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cloudId = Value(cloudId),
       title = Value(title),
       fileType = Value(fileType),
       createdAt = Value(createdAt);
  static Insertable<FedDocument> custom({
    Expression<String>? id,
    Expression<String>? cloudId,
    Expression<String>? title,
    Expression<String>? fileType,
    Expression<String>? rawPath,
    Expression<String>? parsedText,
    Expression<String>? status,
    Expression<String>? errorMsg,
    Expression<int>? nodeCount,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudId != null) 'cloud_id': cloudId,
      if (title != null) 'title': title,
      if (fileType != null) 'file_type': fileType,
      if (rawPath != null) 'raw_path': rawPath,
      if (parsedText != null) 'parsed_text': parsedText,
      if (status != null) 'status': status,
      if (errorMsg != null) 'error_msg': errorMsg,
      if (nodeCount != null) 'node_count': nodeCount,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FedDocumentsCompanion copyWith({
    Value<String>? id,
    Value<String>? cloudId,
    Value<String>? title,
    Value<String>? fileType,
    Value<String>? rawPath,
    Value<String>? parsedText,
    Value<String>? status,
    Value<String?>? errorMsg,
    Value<int>? nodeCount,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return FedDocumentsCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      title: title ?? this.title,
      fileType: fileType ?? this.fileType,
      rawPath: rawPath ?? this.rawPath,
      parsedText: parsedText ?? this.parsedText,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      nodeCount: nodeCount ?? this.nodeCount,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cloudId.present) {
      map['cloud_id'] = Variable<String>(cloudId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (rawPath.present) {
      map['raw_path'] = Variable<String>(rawPath.value);
    }
    if (parsedText.present) {
      map['parsed_text'] = Variable<String>(parsedText.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (errorMsg.present) {
      map['error_msg'] = Variable<String>(errorMsg.value);
    }
    if (nodeCount.present) {
      map['node_count'] = Variable<int>(nodeCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FedDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('title: $title, ')
          ..write('fileType: $fileType, ')
          ..write('rawPath: $rawPath, ')
          ..write('parsedText: $parsedText, ')
          ..write('status: $status, ')
          ..write('errorMsg: $errorMsg, ')
          ..write('nodeCount: $nodeCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChunksTable extends Chunks with TableInfo<$ChunksTable, Chunk> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChunksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _docIdMeta = const VerificationMeta('docId');
  @override
  late final GeneratedColumn<String> docId = GeneratedColumn<String>(
    'doc_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
    'node_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _embeddingMeta = const VerificationMeta(
    'embedding',
  );
  @override
  late final GeneratedColumn<Uint8List> embedding = GeneratedColumn<Uint8List>(
    'embedding',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dimMeta = const VerificationMeta('dim');
  @override
  late final GeneratedColumn<int> dim = GeneratedColumn<int>(
    'dim',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _modelTagMeta = const VerificationMeta(
    'modelTag',
  );
  @override
  late final GeneratedColumn<String> modelTag = GeneratedColumn<String>(
    'model_tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    docId,
    nodeId,
    content,
    embedding,
    dim,
    modelTag,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chunks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Chunk> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('doc_id')) {
      context.handle(
        _docIdMeta,
        docId.isAcceptableOrUnknown(data['doc_id']!, _docIdMeta),
      );
    }
    if (data.containsKey('node_id')) {
      context.handle(
        _nodeIdMeta,
        nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta),
      );
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('embedding')) {
      context.handle(
        _embeddingMeta,
        embedding.isAcceptableOrUnknown(data['embedding']!, _embeddingMeta),
      );
    }
    if (data.containsKey('dim')) {
      context.handle(
        _dimMeta,
        dim.isAcceptableOrUnknown(data['dim']!, _dimMeta),
      );
    }
    if (data.containsKey('model_tag')) {
      context.handle(
        _modelTagMeta,
        modelTag.isAcceptableOrUnknown(data['model_tag']!, _modelTagMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chunk map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chunk(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      docId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doc_id'],
      ),
      nodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}node_id'],
      ),
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      embedding: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}embedding'],
      ),
      dim: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dim'],
      )!,
      modelTag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_tag'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ChunksTable createAlias(String alias) {
    return $ChunksTable(attachedDatabase, alias);
  }
}

class Chunk extends DataClass implements Insertable<Chunk> {
  final String id;
  final String? docId;
  final String? nodeId;
  final String content;
  final Uint8List? embedding;
  final int dim;
  final String modelTag;
  final int createdAt;
  const Chunk({
    required this.id,
    this.docId,
    this.nodeId,
    required this.content,
    this.embedding,
    required this.dim,
    required this.modelTag,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || docId != null) {
      map['doc_id'] = Variable<String>(docId);
    }
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || embedding != null) {
      map['embedding'] = Variable<Uint8List>(embedding);
    }
    map['dim'] = Variable<int>(dim);
    map['model_tag'] = Variable<String>(modelTag);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ChunksCompanion toCompanion(bool nullToAbsent) {
    return ChunksCompanion(
      id: Value(id),
      docId: docId == null && nullToAbsent
          ? const Value.absent()
          : Value(docId),
      nodeId: nodeId == null && nullToAbsent
          ? const Value.absent()
          : Value(nodeId),
      content: Value(content),
      embedding: embedding == null && nullToAbsent
          ? const Value.absent()
          : Value(embedding),
      dim: Value(dim),
      modelTag: Value(modelTag),
      createdAt: Value(createdAt),
    );
  }

  factory Chunk.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chunk(
      id: serializer.fromJson<String>(json['id']),
      docId: serializer.fromJson<String?>(json['docId']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      content: serializer.fromJson<String>(json['content']),
      embedding: serializer.fromJson<Uint8List?>(json['embedding']),
      dim: serializer.fromJson<int>(json['dim']),
      modelTag: serializer.fromJson<String>(json['modelTag']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'docId': serializer.toJson<String?>(docId),
      'nodeId': serializer.toJson<String?>(nodeId),
      'content': serializer.toJson<String>(content),
      'embedding': serializer.toJson<Uint8List?>(embedding),
      'dim': serializer.toJson<int>(dim),
      'modelTag': serializer.toJson<String>(modelTag),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Chunk copyWith({
    String? id,
    Value<String?> docId = const Value.absent(),
    Value<String?> nodeId = const Value.absent(),
    String? content,
    Value<Uint8List?> embedding = const Value.absent(),
    int? dim,
    String? modelTag,
    int? createdAt,
  }) => Chunk(
    id: id ?? this.id,
    docId: docId.present ? docId.value : this.docId,
    nodeId: nodeId.present ? nodeId.value : this.nodeId,
    content: content ?? this.content,
    embedding: embedding.present ? embedding.value : this.embedding,
    dim: dim ?? this.dim,
    modelTag: modelTag ?? this.modelTag,
    createdAt: createdAt ?? this.createdAt,
  );
  Chunk copyWithCompanion(ChunksCompanion data) {
    return Chunk(
      id: data.id.present ? data.id.value : this.id,
      docId: data.docId.present ? data.docId.value : this.docId,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      content: data.content.present ? data.content.value : this.content,
      embedding: data.embedding.present ? data.embedding.value : this.embedding,
      dim: data.dim.present ? data.dim.value : this.dim,
      modelTag: data.modelTag.present ? data.modelTag.value : this.modelTag,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Chunk(')
          ..write('id: $id, ')
          ..write('docId: $docId, ')
          ..write('nodeId: $nodeId, ')
          ..write('content: $content, ')
          ..write('embedding: $embedding, ')
          ..write('dim: $dim, ')
          ..write('modelTag: $modelTag, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    docId,
    nodeId,
    content,
    $driftBlobEquality.hash(embedding),
    dim,
    modelTag,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chunk &&
          other.id == this.id &&
          other.docId == this.docId &&
          other.nodeId == this.nodeId &&
          other.content == this.content &&
          $driftBlobEquality.equals(other.embedding, this.embedding) &&
          other.dim == this.dim &&
          other.modelTag == this.modelTag &&
          other.createdAt == this.createdAt);
}

class ChunksCompanion extends UpdateCompanion<Chunk> {
  final Value<String> id;
  final Value<String?> docId;
  final Value<String?> nodeId;
  final Value<String> content;
  final Value<Uint8List?> embedding;
  final Value<int> dim;
  final Value<String> modelTag;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ChunksCompanion({
    this.id = const Value.absent(),
    this.docId = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.content = const Value.absent(),
    this.embedding = const Value.absent(),
    this.dim = const Value.absent(),
    this.modelTag = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChunksCompanion.insert({
    required String id,
    this.docId = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String content,
    this.embedding = const Value.absent(),
    this.dim = const Value.absent(),
    this.modelTag = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       content = Value(content),
       createdAt = Value(createdAt);
  static Insertable<Chunk> custom({
    Expression<String>? id,
    Expression<String>? docId,
    Expression<String>? nodeId,
    Expression<String>? content,
    Expression<Uint8List>? embedding,
    Expression<int>? dim,
    Expression<String>? modelTag,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (docId != null) 'doc_id': docId,
      if (nodeId != null) 'node_id': nodeId,
      if (content != null) 'content': content,
      if (embedding != null) 'embedding': embedding,
      if (dim != null) 'dim': dim,
      if (modelTag != null) 'model_tag': modelTag,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChunksCompanion copyWith({
    Value<String>? id,
    Value<String?>? docId,
    Value<String?>? nodeId,
    Value<String>? content,
    Value<Uint8List?>? embedding,
    Value<int>? dim,
    Value<String>? modelTag,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ChunksCompanion(
      id: id ?? this.id,
      docId: docId ?? this.docId,
      nodeId: nodeId ?? this.nodeId,
      content: content ?? this.content,
      embedding: embedding ?? this.embedding,
      dim: dim ?? this.dim,
      modelTag: modelTag ?? this.modelTag,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (docId.present) {
      map['doc_id'] = Variable<String>(docId.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (embedding.present) {
      map['embedding'] = Variable<Uint8List>(embedding.value);
    }
    if (dim.present) {
      map['dim'] = Variable<int>(dim.value);
    }
    if (modelTag.present) {
      map['model_tag'] = Variable<String>(modelTag.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChunksCompanion(')
          ..write('id: $id, ')
          ..write('docId: $docId, ')
          ..write('nodeId: $nodeId, ')
          ..write('content: $content, ')
          ..write('embedding: $embedding, ')
          ..write('dim: $dim, ')
          ..write('modelTag: $modelTag, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('新对话'),
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('chat'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, mode, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Session> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final String id;
  final String title;
  final String mode;
  final int createdAt;
  const Session({
    required this.id,
    required this.title,
    required this.mode,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['mode'] = Variable<String>(mode);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      title: Value(title),
      mode: Value(mode),
      createdAt: Value(createdAt),
    );
  }

  factory Session.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      mode: serializer.fromJson<String>(json['mode']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'mode': serializer.toJson<String>(mode),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Session copyWith({String? id, String? title, String? mode, int? createdAt}) =>
      Session(
        id: id ?? this.id,
        title: title ?? this.title,
        mode: mode ?? this.mode,
        createdAt: createdAt ?? this.createdAt,
      );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      mode: data.mode.present ? data.mode.value : this.mode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('mode: $mode, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, mode, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.title == this.title &&
          other.mode == this.mode &&
          other.createdAt == this.createdAt);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> mode;
  final Value<int> createdAt;
  final Value<int> rowid;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.mode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionsCompanion.insert({
    required String id,
    this.title = const Value.absent(),
    this.mode = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt);
  static Insertable<Session> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? mode,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (mode != null) 'mode': mode,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? mode,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      mode: mode ?? this.mode,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('mode: $mode, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _citationsJsonMeta = const VerificationMeta(
    'citationsJson',
  );
  @override
  late final GeneratedColumn<String> citationsJson = GeneratedColumn<String>(
    'citations_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _providerIdMeta = const VerificationMeta(
    'providerId',
  );
  @override
  late final GeneratedColumn<String> providerId = GeneratedColumn<String>(
    'provider_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    role,
    content,
    citationsJson,
    providerId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Message> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('citations_json')) {
      context.handle(
        _citationsJsonMeta,
        citationsJson.isAcceptableOrUnknown(
          data['citations_json']!,
          _citationsJsonMeta,
        ),
      );
    }
    if (data.containsKey('provider_id')) {
      context.handle(
        _providerIdMeta,
        providerId.isAcceptableOrUnknown(data['provider_id']!, _providerIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      citationsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}citations_json'],
      ),
      providerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final String id;
  final String sessionId;
  final String role;
  final String content;
  final String? citationsJson;
  final String? providerId;
  final int createdAt;
  const Message({
    required this.id,
    required this.sessionId,
    required this.role,
    required this.content,
    this.citationsJson,
    this.providerId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['role'] = Variable<String>(role);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || citationsJson != null) {
      map['citations_json'] = Variable<String>(citationsJson);
    }
    if (!nullToAbsent || providerId != null) {
      map['provider_id'] = Variable<String>(providerId);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      role: Value(role),
      content: Value(content),
      citationsJson: citationsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(citationsJson),
      providerId: providerId == null && nullToAbsent
          ? const Value.absent()
          : Value(providerId),
      createdAt: Value(createdAt),
    );
  }

  factory Message.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      role: serializer.fromJson<String>(json['role']),
      content: serializer.fromJson<String>(json['content']),
      citationsJson: serializer.fromJson<String?>(json['citationsJson']),
      providerId: serializer.fromJson<String?>(json['providerId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'role': serializer.toJson<String>(role),
      'content': serializer.toJson<String>(content),
      'citationsJson': serializer.toJson<String?>(citationsJson),
      'providerId': serializer.toJson<String?>(providerId),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Message copyWith({
    String? id,
    String? sessionId,
    String? role,
    String? content,
    Value<String?> citationsJson = const Value.absent(),
    Value<String?> providerId = const Value.absent(),
    int? createdAt,
  }) => Message(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    role: role ?? this.role,
    content: content ?? this.content,
    citationsJson: citationsJson.present
        ? citationsJson.value
        : this.citationsJson,
    providerId: providerId.present ? providerId.value : this.providerId,
    createdAt: createdAt ?? this.createdAt,
  );
  Message copyWithCompanion(MessagesCompanion data) {
    return Message(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      role: data.role.present ? data.role.value : this.role,
      content: data.content.present ? data.content.value : this.content,
      citationsJson: data.citationsJson.present
          ? data.citationsJson.value
          : this.citationsJson,
      providerId: data.providerId.present
          ? data.providerId.value
          : this.providerId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('role: $role, ')
          ..write('content: $content, ')
          ..write('citationsJson: $citationsJson, ')
          ..write('providerId: $providerId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    role,
    content,
    citationsJson,
    providerId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.role == this.role &&
          other.content == this.content &&
          other.citationsJson == this.citationsJson &&
          other.providerId == this.providerId &&
          other.createdAt == this.createdAt);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> role;
  final Value<String> content;
  final Value<String?> citationsJson;
  final Value<String?> providerId;
  final Value<int> createdAt;
  final Value<int> rowid;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.role = const Value.absent(),
    this.content = const Value.absent(),
    this.citationsJson = const Value.absent(),
    this.providerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessagesCompanion.insert({
    required String id,
    required String sessionId,
    required String role,
    required String content,
    this.citationsJson = const Value.absent(),
    this.providerId = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       role = Value(role),
       content = Value(content),
       createdAt = Value(createdAt);
  static Insertable<Message> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? role,
    Expression<String>? content,
    Expression<String>? citationsJson,
    Expression<String>? providerId,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (role != null) 'role': role,
      if (content != null) 'content': content,
      if (citationsJson != null) 'citations_json': citationsJson,
      if (providerId != null) 'provider_id': providerId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessagesCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String>? role,
    Value<String>? content,
    Value<String?>? citationsJson,
    Value<String?>? providerId,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return MessagesCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      role: role ?? this.role,
      content: content ?? this.content,
      citationsJson: citationsJson ?? this.citationsJson,
      providerId: providerId ?? this.providerId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (citationsJson.present) {
      map['citations_json'] = Variable<String>(citationsJson.value);
    }
    if (providerId.present) {
      map['provider_id'] = Variable<String>(providerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('role: $role, ')
          ..write('content: $content, ')
          ..write('citationsJson: $citationsJson, ')
          ..write('providerId: $providerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CloudSnapshotsTable extends CloudSnapshots
    with TableInfo<$CloudSnapshotsTable, CloudSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CloudSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gradeTagMeta = const VerificationMeta(
    'gradeTag',
  );
  @override
  late final GeneratedColumn<String> gradeTag = GeneratedColumn<String>(
    'grade_tag',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectMeta = const VerificationMeta(
    'subject',
  );
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
    'subject',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stagesJsonMeta = const VerificationMeta(
    'stagesJson',
  );
  @override
  late final GeneratedColumn<String> stagesJson = GeneratedColumn<String>(
    'stages_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _nodeIdsJsonMeta = const VerificationMeta(
    'nodeIdsJson',
  );
  @override
  late final GeneratedColumn<String> nodeIdsJson = GeneratedColumn<String>(
    'node_ids_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _edgeIdsJsonMeta = const VerificationMeta(
    'edgeIdsJson',
  );
  @override
  late final GeneratedColumn<String> edgeIdsJson = GeneratedColumn<String>(
    'edge_ids_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    gradeTag,
    subject,
    version,
    stagesJson,
    nodeIdsJson,
    edgeIdsJson,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cloud_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<CloudSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('grade_tag')) {
      context.handle(
        _gradeTagMeta,
        gradeTag.isAcceptableOrUnknown(data['grade_tag']!, _gradeTagMeta),
      );
    } else if (isInserting) {
      context.missing(_gradeTagMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(
        _subjectMeta,
        subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('stages_json')) {
      context.handle(
        _stagesJsonMeta,
        stagesJson.isAcceptableOrUnknown(data['stages_json']!, _stagesJsonMeta),
      );
    }
    if (data.containsKey('node_ids_json')) {
      context.handle(
        _nodeIdsJsonMeta,
        nodeIdsJson.isAcceptableOrUnknown(
          data['node_ids_json']!,
          _nodeIdsJsonMeta,
        ),
      );
    }
    if (data.containsKey('edge_ids_json')) {
      context.handle(
        _edgeIdsJsonMeta,
        edgeIdsJson.isAcceptableOrUnknown(
          data['edge_ids_json']!,
          _edgeIdsJsonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CloudSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CloudSnapshot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      gradeTag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grade_tag'],
      )!,
      subject: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      stagesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stages_json'],
      )!,
      nodeIdsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}node_ids_json'],
      )!,
      edgeIdsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}edge_ids_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CloudSnapshotsTable createAlias(String alias) {
    return $CloudSnapshotsTable(attachedDatabase, alias);
  }
}

class CloudSnapshot extends DataClass implements Insertable<CloudSnapshot> {
  final String id;
  final String name;
  final String gradeTag;
  final String subject;
  final int version;
  final String stagesJson;
  final String nodeIdsJson;
  final String edgeIdsJson;
  final int createdAt;
  const CloudSnapshot({
    required this.id,
    required this.name,
    required this.gradeTag,
    required this.subject,
    required this.version,
    required this.stagesJson,
    required this.nodeIdsJson,
    required this.edgeIdsJson,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['grade_tag'] = Variable<String>(gradeTag);
    map['subject'] = Variable<String>(subject);
    map['version'] = Variable<int>(version);
    map['stages_json'] = Variable<String>(stagesJson);
    map['node_ids_json'] = Variable<String>(nodeIdsJson);
    map['edge_ids_json'] = Variable<String>(edgeIdsJson);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  CloudSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return CloudSnapshotsCompanion(
      id: Value(id),
      name: Value(name),
      gradeTag: Value(gradeTag),
      subject: Value(subject),
      version: Value(version),
      stagesJson: Value(stagesJson),
      nodeIdsJson: Value(nodeIdsJson),
      edgeIdsJson: Value(edgeIdsJson),
      createdAt: Value(createdAt),
    );
  }

  factory CloudSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CloudSnapshot(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      gradeTag: serializer.fromJson<String>(json['gradeTag']),
      subject: serializer.fromJson<String>(json['subject']),
      version: serializer.fromJson<int>(json['version']),
      stagesJson: serializer.fromJson<String>(json['stagesJson']),
      nodeIdsJson: serializer.fromJson<String>(json['nodeIdsJson']),
      edgeIdsJson: serializer.fromJson<String>(json['edgeIdsJson']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'gradeTag': serializer.toJson<String>(gradeTag),
      'subject': serializer.toJson<String>(subject),
      'version': serializer.toJson<int>(version),
      'stagesJson': serializer.toJson<String>(stagesJson),
      'nodeIdsJson': serializer.toJson<String>(nodeIdsJson),
      'edgeIdsJson': serializer.toJson<String>(edgeIdsJson),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  CloudSnapshot copyWith({
    String? id,
    String? name,
    String? gradeTag,
    String? subject,
    int? version,
    String? stagesJson,
    String? nodeIdsJson,
    String? edgeIdsJson,
    int? createdAt,
  }) => CloudSnapshot(
    id: id ?? this.id,
    name: name ?? this.name,
    gradeTag: gradeTag ?? this.gradeTag,
    subject: subject ?? this.subject,
    version: version ?? this.version,
    stagesJson: stagesJson ?? this.stagesJson,
    nodeIdsJson: nodeIdsJson ?? this.nodeIdsJson,
    edgeIdsJson: edgeIdsJson ?? this.edgeIdsJson,
    createdAt: createdAt ?? this.createdAt,
  );
  CloudSnapshot copyWithCompanion(CloudSnapshotsCompanion data) {
    return CloudSnapshot(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      gradeTag: data.gradeTag.present ? data.gradeTag.value : this.gradeTag,
      subject: data.subject.present ? data.subject.value : this.subject,
      version: data.version.present ? data.version.value : this.version,
      stagesJson: data.stagesJson.present
          ? data.stagesJson.value
          : this.stagesJson,
      nodeIdsJson: data.nodeIdsJson.present
          ? data.nodeIdsJson.value
          : this.nodeIdsJson,
      edgeIdsJson: data.edgeIdsJson.present
          ? data.edgeIdsJson.value
          : this.edgeIdsJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CloudSnapshot(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gradeTag: $gradeTag, ')
          ..write('subject: $subject, ')
          ..write('version: $version, ')
          ..write('stagesJson: $stagesJson, ')
          ..write('nodeIdsJson: $nodeIdsJson, ')
          ..write('edgeIdsJson: $edgeIdsJson, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    gradeTag,
    subject,
    version,
    stagesJson,
    nodeIdsJson,
    edgeIdsJson,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CloudSnapshot &&
          other.id == this.id &&
          other.name == this.name &&
          other.gradeTag == this.gradeTag &&
          other.subject == this.subject &&
          other.version == this.version &&
          other.stagesJson == this.stagesJson &&
          other.nodeIdsJson == this.nodeIdsJson &&
          other.edgeIdsJson == this.edgeIdsJson &&
          other.createdAt == this.createdAt);
}

class CloudSnapshotsCompanion extends UpdateCompanion<CloudSnapshot> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> gradeTag;
  final Value<String> subject;
  final Value<int> version;
  final Value<String> stagesJson;
  final Value<String> nodeIdsJson;
  final Value<String> edgeIdsJson;
  final Value<int> createdAt;
  final Value<int> rowid;
  const CloudSnapshotsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gradeTag = const Value.absent(),
    this.subject = const Value.absent(),
    this.version = const Value.absent(),
    this.stagesJson = const Value.absent(),
    this.nodeIdsJson = const Value.absent(),
    this.edgeIdsJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CloudSnapshotsCompanion.insert({
    required String id,
    required String name,
    required String gradeTag,
    required String subject,
    required int version,
    this.stagesJson = const Value.absent(),
    this.nodeIdsJson = const Value.absent(),
    this.edgeIdsJson = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       gradeTag = Value(gradeTag),
       subject = Value(subject),
       version = Value(version),
       createdAt = Value(createdAt);
  static Insertable<CloudSnapshot> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? gradeTag,
    Expression<String>? subject,
    Expression<int>? version,
    Expression<String>? stagesJson,
    Expression<String>? nodeIdsJson,
    Expression<String>? edgeIdsJson,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (gradeTag != null) 'grade_tag': gradeTag,
      if (subject != null) 'subject': subject,
      if (version != null) 'version': version,
      if (stagesJson != null) 'stages_json': stagesJson,
      if (nodeIdsJson != null) 'node_ids_json': nodeIdsJson,
      if (edgeIdsJson != null) 'edge_ids_json': edgeIdsJson,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CloudSnapshotsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? gradeTag,
    Value<String>? subject,
    Value<int>? version,
    Value<String>? stagesJson,
    Value<String>? nodeIdsJson,
    Value<String>? edgeIdsJson,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return CloudSnapshotsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gradeTag: gradeTag ?? this.gradeTag,
      subject: subject ?? this.subject,
      version: version ?? this.version,
      stagesJson: stagesJson ?? this.stagesJson,
      nodeIdsJson: nodeIdsJson ?? this.nodeIdsJson,
      edgeIdsJson: edgeIdsJson ?? this.edgeIdsJson,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gradeTag.present) {
      map['grade_tag'] = Variable<String>(gradeTag.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (stagesJson.present) {
      map['stages_json'] = Variable<String>(stagesJson.value);
    }
    if (nodeIdsJson.present) {
      map['node_ids_json'] = Variable<String>(nodeIdsJson.value);
    }
    if (edgeIdsJson.present) {
      map['edge_ids_json'] = Variable<String>(edgeIdsJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CloudSnapshotsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gradeTag: $gradeTag, ')
          ..write('subject: $subject, ')
          ..write('version: $version, ')
          ..write('stagesJson: $stagesJson, ')
          ..write('nodeIdsJson: $nodeIdsJson, ')
          ..write('edgeIdsJson: $edgeIdsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PipelineJobsTable extends PipelineJobs
    with TableInfo<$PipelineJobsTable, PipelineJob> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PipelineJobsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _docIdMeta = const VerificationMeta('docId');
  @override
  late final GeneratedColumn<String> docId = GeneratedColumn<String>(
    'doc_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
    'topic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stageMeta = const VerificationMeta('stage');
  @override
  late final GeneratedColumn<String> stage = GeneratedColumn<String>(
    'stage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _payloadJsonMeta = const VerificationMeta(
    'payloadJson',
  );
  @override
  late final GeneratedColumn<String> payloadJson = GeneratedColumn<String>(
    'payload_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('{}'),
  );
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
    'error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    docId,
    topic,
    stage,
    status,
    payloadJson,
    error,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pipeline_jobs';
  @override
  VerificationContext validateIntegrity(
    Insertable<PipelineJob> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('doc_id')) {
      context.handle(
        _docIdMeta,
        docId.isAcceptableOrUnknown(data['doc_id']!, _docIdMeta),
      );
    }
    if (data.containsKey('topic')) {
      context.handle(
        _topicMeta,
        topic.isAcceptableOrUnknown(data['topic']!, _topicMeta),
      );
    }
    if (data.containsKey('stage')) {
      context.handle(
        _stageMeta,
        stage.isAcceptableOrUnknown(data['stage']!, _stageMeta),
      );
    } else if (isInserting) {
      context.missing(_stageMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('payload_json')) {
      context.handle(
        _payloadJsonMeta,
        payloadJson.isAcceptableOrUnknown(
          data['payload_json']!,
          _payloadJsonMeta,
        ),
      );
    }
    if (data.containsKey('error')) {
      context.handle(
        _errorMeta,
        error.isAcceptableOrUnknown(data['error']!, _errorMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PipelineJob map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PipelineJob(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      docId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doc_id'],
      ),
      topic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic'],
      ),
      stage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stage'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      payloadJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload_json'],
      )!,
      error: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PipelineJobsTable createAlias(String alias) {
    return $PipelineJobsTable(attachedDatabase, alias);
  }
}

class PipelineJob extends DataClass implements Insertable<PipelineJob> {
  final String id;
  final String? docId;
  final String? topic;
  final String stage;
  final String status;
  final String payloadJson;
  final String? error;
  final int updatedAt;
  const PipelineJob({
    required this.id,
    this.docId,
    this.topic,
    required this.stage,
    required this.status,
    required this.payloadJson,
    this.error,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || docId != null) {
      map['doc_id'] = Variable<String>(docId);
    }
    if (!nullToAbsent || topic != null) {
      map['topic'] = Variable<String>(topic);
    }
    map['stage'] = Variable<String>(stage);
    map['status'] = Variable<String>(status);
    map['payload_json'] = Variable<String>(payloadJson);
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  PipelineJobsCompanion toCompanion(bool nullToAbsent) {
    return PipelineJobsCompanion(
      id: Value(id),
      docId: docId == null && nullToAbsent
          ? const Value.absent()
          : Value(docId),
      topic: topic == null && nullToAbsent
          ? const Value.absent()
          : Value(topic),
      stage: Value(stage),
      status: Value(status),
      payloadJson: Value(payloadJson),
      error: error == null && nullToAbsent
          ? const Value.absent()
          : Value(error),
      updatedAt: Value(updatedAt),
    );
  }

  factory PipelineJob.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PipelineJob(
      id: serializer.fromJson<String>(json['id']),
      docId: serializer.fromJson<String?>(json['docId']),
      topic: serializer.fromJson<String?>(json['topic']),
      stage: serializer.fromJson<String>(json['stage']),
      status: serializer.fromJson<String>(json['status']),
      payloadJson: serializer.fromJson<String>(json['payloadJson']),
      error: serializer.fromJson<String?>(json['error']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'docId': serializer.toJson<String?>(docId),
      'topic': serializer.toJson<String?>(topic),
      'stage': serializer.toJson<String>(stage),
      'status': serializer.toJson<String>(status),
      'payloadJson': serializer.toJson<String>(payloadJson),
      'error': serializer.toJson<String?>(error),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  PipelineJob copyWith({
    String? id,
    Value<String?> docId = const Value.absent(),
    Value<String?> topic = const Value.absent(),
    String? stage,
    String? status,
    String? payloadJson,
    Value<String?> error = const Value.absent(),
    int? updatedAt,
  }) => PipelineJob(
    id: id ?? this.id,
    docId: docId.present ? docId.value : this.docId,
    topic: topic.present ? topic.value : this.topic,
    stage: stage ?? this.stage,
    status: status ?? this.status,
    payloadJson: payloadJson ?? this.payloadJson,
    error: error.present ? error.value : this.error,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PipelineJob copyWithCompanion(PipelineJobsCompanion data) {
    return PipelineJob(
      id: data.id.present ? data.id.value : this.id,
      docId: data.docId.present ? data.docId.value : this.docId,
      topic: data.topic.present ? data.topic.value : this.topic,
      stage: data.stage.present ? data.stage.value : this.stage,
      status: data.status.present ? data.status.value : this.status,
      payloadJson: data.payloadJson.present
          ? data.payloadJson.value
          : this.payloadJson,
      error: data.error.present ? data.error.value : this.error,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PipelineJob(')
          ..write('id: $id, ')
          ..write('docId: $docId, ')
          ..write('topic: $topic, ')
          ..write('stage: $stage, ')
          ..write('status: $status, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('error: $error, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    docId,
    topic,
    stage,
    status,
    payloadJson,
    error,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PipelineJob &&
          other.id == this.id &&
          other.docId == this.docId &&
          other.topic == this.topic &&
          other.stage == this.stage &&
          other.status == this.status &&
          other.payloadJson == this.payloadJson &&
          other.error == this.error &&
          other.updatedAt == this.updatedAt);
}

class PipelineJobsCompanion extends UpdateCompanion<PipelineJob> {
  final Value<String> id;
  final Value<String?> docId;
  final Value<String?> topic;
  final Value<String> stage;
  final Value<String> status;
  final Value<String> payloadJson;
  final Value<String?> error;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const PipelineJobsCompanion({
    this.id = const Value.absent(),
    this.docId = const Value.absent(),
    this.topic = const Value.absent(),
    this.stage = const Value.absent(),
    this.status = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.error = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PipelineJobsCompanion.insert({
    required String id,
    this.docId = const Value.absent(),
    this.topic = const Value.absent(),
    required String stage,
    this.status = const Value.absent(),
    this.payloadJson = const Value.absent(),
    this.error = const Value.absent(),
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       stage = Value(stage),
       updatedAt = Value(updatedAt);
  static Insertable<PipelineJob> custom({
    Expression<String>? id,
    Expression<String>? docId,
    Expression<String>? topic,
    Expression<String>? stage,
    Expression<String>? status,
    Expression<String>? payloadJson,
    Expression<String>? error,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (docId != null) 'doc_id': docId,
      if (topic != null) 'topic': topic,
      if (stage != null) 'stage': stage,
      if (status != null) 'status': status,
      if (payloadJson != null) 'payload_json': payloadJson,
      if (error != null) 'error': error,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PipelineJobsCompanion copyWith({
    Value<String>? id,
    Value<String?>? docId,
    Value<String?>? topic,
    Value<String>? stage,
    Value<String>? status,
    Value<String>? payloadJson,
    Value<String?>? error,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return PipelineJobsCompanion(
      id: id ?? this.id,
      docId: docId ?? this.docId,
      topic: topic ?? this.topic,
      stage: stage ?? this.stage,
      status: status ?? this.status,
      payloadJson: payloadJson ?? this.payloadJson,
      error: error ?? this.error,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (docId.present) {
      map['doc_id'] = Variable<String>(docId.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (stage.present) {
      map['stage'] = Variable<String>(stage.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (payloadJson.present) {
      map['payload_json'] = Variable<String>(payloadJson.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PipelineJobsCompanion(')
          ..write('id: $id, ')
          ..write('docId: $docId, ')
          ..write('topic: $topic, ')
          ..write('stage: $stage, ')
          ..write('status: $status, ')
          ..write('payloadJson: $payloadJson, ')
          ..write('error: $error, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearningRecordsTable extends LearningRecords
    with TableInfo<$LearningRecordsTable, LearningRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
    'node_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _learnedAtMeta = const VerificationMeta(
    'learnedAt',
  );
  @override
  late final GeneratedColumn<int> learnedAt = GeneratedColumn<int>(
    'learned_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('cloud_map'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, nodeId, learnedAt, source];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<LearningRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('node_id')) {
      context.handle(
        _nodeIdMeta,
        nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_nodeIdMeta);
    }
    if (data.containsKey('learned_at')) {
      context.handle(
        _learnedAtMeta,
        learnedAt.isAcceptableOrUnknown(data['learned_at']!, _learnedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_learnedAtMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      nodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}node_id'],
      )!,
      learnedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}learned_at'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $LearningRecordsTable createAlias(String alias) {
    return $LearningRecordsTable(attachedDatabase, alias);
  }
}

class LearningRecord extends DataClass implements Insertable<LearningRecord> {
  final String id;
  final String nodeId;
  final int learnedAt;
  final String source;
  const LearningRecord({
    required this.id,
    required this.nodeId,
    required this.learnedAt,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['node_id'] = Variable<String>(nodeId);
    map['learned_at'] = Variable<int>(learnedAt);
    map['source'] = Variable<String>(source);
    return map;
  }

  LearningRecordsCompanion toCompanion(bool nullToAbsent) {
    return LearningRecordsCompanion(
      id: Value(id),
      nodeId: Value(nodeId),
      learnedAt: Value(learnedAt),
      source: Value(source),
    );
  }

  factory LearningRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningRecord(
      id: serializer.fromJson<String>(json['id']),
      nodeId: serializer.fromJson<String>(json['nodeId']),
      learnedAt: serializer.fromJson<int>(json['learnedAt']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nodeId': serializer.toJson<String>(nodeId),
      'learnedAt': serializer.toJson<int>(learnedAt),
      'source': serializer.toJson<String>(source),
    };
  }

  LearningRecord copyWith({
    String? id,
    String? nodeId,
    int? learnedAt,
    String? source,
  }) => LearningRecord(
    id: id ?? this.id,
    nodeId: nodeId ?? this.nodeId,
    learnedAt: learnedAt ?? this.learnedAt,
    source: source ?? this.source,
  );
  LearningRecord copyWithCompanion(LearningRecordsCompanion data) {
    return LearningRecord(
      id: data.id.present ? data.id.value : this.id,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      learnedAt: data.learnedAt.present ? data.learnedAt.value : this.learnedAt,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningRecord(')
          ..write('id: $id, ')
          ..write('nodeId: $nodeId, ')
          ..write('learnedAt: $learnedAt, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nodeId, learnedAt, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningRecord &&
          other.id == this.id &&
          other.nodeId == this.nodeId &&
          other.learnedAt == this.learnedAt &&
          other.source == this.source);
}

class LearningRecordsCompanion extends UpdateCompanion<LearningRecord> {
  final Value<String> id;
  final Value<String> nodeId;
  final Value<int> learnedAt;
  final Value<String> source;
  final Value<int> rowid;
  const LearningRecordsCompanion({
    this.id = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.learnedAt = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LearningRecordsCompanion.insert({
    required String id,
    required String nodeId,
    required int learnedAt,
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nodeId = Value(nodeId),
       learnedAt = Value(learnedAt);
  static Insertable<LearningRecord> custom({
    Expression<String>? id,
    Expression<String>? nodeId,
    Expression<int>? learnedAt,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nodeId != null) 'node_id': nodeId,
      if (learnedAt != null) 'learned_at': learnedAt,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LearningRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? nodeId,
    Value<int>? learnedAt,
    Value<String>? source,
    Value<int>? rowid,
  }) {
    return LearningRecordsCompanion(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      learnedAt: learnedAt ?? this.learnedAt,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (learnedAt.present) {
      map['learned_at'] = Variable<int>(learnedAt.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningRecordsCompanion(')
          ..write('id: $id, ')
          ..write('nodeId: $nodeId, ')
          ..write('learnedAt: $learnedAt, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuizzesTable extends Quizzes with TableInfo<$QuizzesTable, Quizze> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizzesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeJsonMeta = const VerificationMeta(
    'scopeJson',
  );
  @override
  late final GeneratedColumn<String> scopeJson = GeneratedColumn<String>(
    'scope_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('generating'),
  );
  static const VerificationMeta _accuracyMeta = const VerificationMeta(
    'accuracy',
  );
  @override
  late final GeneratedColumn<double> accuracy = GeneratedColumn<double>(
    'accuracy',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pointsAwardedMeta = const VerificationMeta(
    'pointsAwarded',
  );
  @override
  late final GeneratedColumn<int> pointsAwarded = GeneratedColumn<int>(
    'points_awarded',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _badgeAwardedMeta = const VerificationMeta(
    'badgeAwarded',
  );
  @override
  late final GeneratedColumn<bool> badgeAwarded = GeneratedColumn<bool>(
    'badge_awarded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("badge_awarded" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _submittedAtMeta = const VerificationMeta(
    'submittedAt',
  );
  @override
  late final GeneratedColumn<int> submittedAt = GeneratedColumn<int>(
    'submitted_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kind,
    scopeJson,
    status,
    accuracy,
    pointsAwarded,
    badgeAwarded,
    createdAt,
    submittedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quizzes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Quizze> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('scope_json')) {
      context.handle(
        _scopeJsonMeta,
        scopeJson.isAcceptableOrUnknown(data['scope_json']!, _scopeJsonMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('accuracy')) {
      context.handle(
        _accuracyMeta,
        accuracy.isAcceptableOrUnknown(data['accuracy']!, _accuracyMeta),
      );
    }
    if (data.containsKey('points_awarded')) {
      context.handle(
        _pointsAwardedMeta,
        pointsAwarded.isAcceptableOrUnknown(
          data['points_awarded']!,
          _pointsAwardedMeta,
        ),
      );
    }
    if (data.containsKey('badge_awarded')) {
      context.handle(
        _badgeAwardedMeta,
        badgeAwarded.isAcceptableOrUnknown(
          data['badge_awarded']!,
          _badgeAwardedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('submitted_at')) {
      context.handle(
        _submittedAtMeta,
        submittedAt.isAcceptableOrUnknown(
          data['submitted_at']!,
          _submittedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quizze map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quizze(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      scopeJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope_json'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      accuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accuracy'],
      ),
      pointsAwarded: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points_awarded'],
      )!,
      badgeAwarded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}badge_awarded'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      submittedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}submitted_at'],
      ),
    );
  }

  @override
  $QuizzesTable createAlias(String alias) {
    return $QuizzesTable(attachedDatabase, alias);
  }
}

class Quizze extends DataClass implements Insertable<Quizze> {
  final String id;
  final String kind;
  final String scopeJson;
  final String status;
  final double? accuracy;
  final int pointsAwarded;
  final bool badgeAwarded;
  final int createdAt;
  final int? submittedAt;
  const Quizze({
    required this.id,
    required this.kind,
    required this.scopeJson,
    required this.status,
    this.accuracy,
    required this.pointsAwarded,
    required this.badgeAwarded,
    required this.createdAt,
    this.submittedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    map['scope_json'] = Variable<String>(scopeJson);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || accuracy != null) {
      map['accuracy'] = Variable<double>(accuracy);
    }
    map['points_awarded'] = Variable<int>(pointsAwarded);
    map['badge_awarded'] = Variable<bool>(badgeAwarded);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || submittedAt != null) {
      map['submitted_at'] = Variable<int>(submittedAt);
    }
    return map;
  }

  QuizzesCompanion toCompanion(bool nullToAbsent) {
    return QuizzesCompanion(
      id: Value(id),
      kind: Value(kind),
      scopeJson: Value(scopeJson),
      status: Value(status),
      accuracy: accuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracy),
      pointsAwarded: Value(pointsAwarded),
      badgeAwarded: Value(badgeAwarded),
      createdAt: Value(createdAt),
      submittedAt: submittedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(submittedAt),
    );
  }

  factory Quizze.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quizze(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      scopeJson: serializer.fromJson<String>(json['scopeJson']),
      status: serializer.fromJson<String>(json['status']),
      accuracy: serializer.fromJson<double?>(json['accuracy']),
      pointsAwarded: serializer.fromJson<int>(json['pointsAwarded']),
      badgeAwarded: serializer.fromJson<bool>(json['badgeAwarded']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      submittedAt: serializer.fromJson<int?>(json['submittedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'scopeJson': serializer.toJson<String>(scopeJson),
      'status': serializer.toJson<String>(status),
      'accuracy': serializer.toJson<double?>(accuracy),
      'pointsAwarded': serializer.toJson<int>(pointsAwarded),
      'badgeAwarded': serializer.toJson<bool>(badgeAwarded),
      'createdAt': serializer.toJson<int>(createdAt),
      'submittedAt': serializer.toJson<int?>(submittedAt),
    };
  }

  Quizze copyWith({
    String? id,
    String? kind,
    String? scopeJson,
    String? status,
    Value<double?> accuracy = const Value.absent(),
    int? pointsAwarded,
    bool? badgeAwarded,
    int? createdAt,
    Value<int?> submittedAt = const Value.absent(),
  }) => Quizze(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    scopeJson: scopeJson ?? this.scopeJson,
    status: status ?? this.status,
    accuracy: accuracy.present ? accuracy.value : this.accuracy,
    pointsAwarded: pointsAwarded ?? this.pointsAwarded,
    badgeAwarded: badgeAwarded ?? this.badgeAwarded,
    createdAt: createdAt ?? this.createdAt,
    submittedAt: submittedAt.present ? submittedAt.value : this.submittedAt,
  );
  Quizze copyWithCompanion(QuizzesCompanion data) {
    return Quizze(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      scopeJson: data.scopeJson.present ? data.scopeJson.value : this.scopeJson,
      status: data.status.present ? data.status.value : this.status,
      accuracy: data.accuracy.present ? data.accuracy.value : this.accuracy,
      pointsAwarded: data.pointsAwarded.present
          ? data.pointsAwarded.value
          : this.pointsAwarded,
      badgeAwarded: data.badgeAwarded.present
          ? data.badgeAwarded.value
          : this.badgeAwarded,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      submittedAt: data.submittedAt.present
          ? data.submittedAt.value
          : this.submittedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quizze(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('scopeJson: $scopeJson, ')
          ..write('status: $status, ')
          ..write('accuracy: $accuracy, ')
          ..write('pointsAwarded: $pointsAwarded, ')
          ..write('badgeAwarded: $badgeAwarded, ')
          ..write('createdAt: $createdAt, ')
          ..write('submittedAt: $submittedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    kind,
    scopeJson,
    status,
    accuracy,
    pointsAwarded,
    badgeAwarded,
    createdAt,
    submittedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quizze &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.scopeJson == this.scopeJson &&
          other.status == this.status &&
          other.accuracy == this.accuracy &&
          other.pointsAwarded == this.pointsAwarded &&
          other.badgeAwarded == this.badgeAwarded &&
          other.createdAt == this.createdAt &&
          other.submittedAt == this.submittedAt);
}

class QuizzesCompanion extends UpdateCompanion<Quizze> {
  final Value<String> id;
  final Value<String> kind;
  final Value<String> scopeJson;
  final Value<String> status;
  final Value<double?> accuracy;
  final Value<int> pointsAwarded;
  final Value<bool> badgeAwarded;
  final Value<int> createdAt;
  final Value<int?> submittedAt;
  final Value<int> rowid;
  const QuizzesCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.scopeJson = const Value.absent(),
    this.status = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.pointsAwarded = const Value.absent(),
    this.badgeAwarded = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.submittedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuizzesCompanion.insert({
    required String id,
    required String kind,
    this.scopeJson = const Value.absent(),
    this.status = const Value.absent(),
    this.accuracy = const Value.absent(),
    this.pointsAwarded = const Value.absent(),
    this.badgeAwarded = const Value.absent(),
    required int createdAt,
    this.submittedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       createdAt = Value(createdAt);
  static Insertable<Quizze> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<String>? scopeJson,
    Expression<String>? status,
    Expression<double>? accuracy,
    Expression<int>? pointsAwarded,
    Expression<bool>? badgeAwarded,
    Expression<int>? createdAt,
    Expression<int>? submittedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (scopeJson != null) 'scope_json': scopeJson,
      if (status != null) 'status': status,
      if (accuracy != null) 'accuracy': accuracy,
      if (pointsAwarded != null) 'points_awarded': pointsAwarded,
      if (badgeAwarded != null) 'badge_awarded': badgeAwarded,
      if (createdAt != null) 'created_at': createdAt,
      if (submittedAt != null) 'submitted_at': submittedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuizzesCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<String>? scopeJson,
    Value<String>? status,
    Value<double?>? accuracy,
    Value<int>? pointsAwarded,
    Value<bool>? badgeAwarded,
    Value<int>? createdAt,
    Value<int?>? submittedAt,
    Value<int>? rowid,
  }) {
    return QuizzesCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      scopeJson: scopeJson ?? this.scopeJson,
      status: status ?? this.status,
      accuracy: accuracy ?? this.accuracy,
      pointsAwarded: pointsAwarded ?? this.pointsAwarded,
      badgeAwarded: badgeAwarded ?? this.badgeAwarded,
      createdAt: createdAt ?? this.createdAt,
      submittedAt: submittedAt ?? this.submittedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (scopeJson.present) {
      map['scope_json'] = Variable<String>(scopeJson.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (accuracy.present) {
      map['accuracy'] = Variable<double>(accuracy.value);
    }
    if (pointsAwarded.present) {
      map['points_awarded'] = Variable<int>(pointsAwarded.value);
    }
    if (badgeAwarded.present) {
      map['badge_awarded'] = Variable<bool>(badgeAwarded.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (submittedAt.present) {
      map['submitted_at'] = Variable<int>(submittedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizzesCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('scopeJson: $scopeJson, ')
          ..write('status: $status, ')
          ..write('accuracy: $accuracy, ')
          ..write('pointsAwarded: $pointsAwarded, ')
          ..write('badgeAwarded: $badgeAwarded, ')
          ..write('createdAt: $createdAt, ')
          ..write('submittedAt: $submittedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuizQuestionsTable extends QuizQuestions
    with TableInfo<$QuizQuestionsTable, QuizQuestion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizQuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quizIdMeta = const VerificationMeta('quizId');
  @override
  late final GeneratedColumn<String> quizId = GeneratedColumn<String>(
    'quiz_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
    'node_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stemMeta = const VerificationMeta('stem');
  @override
  late final GeneratedColumn<String> stem = GeneratedColumn<String>(
    'stem',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _optionsJsonMeta = const VerificationMeta(
    'optionsJson',
  );
  @override
  late final GeneratedColumn<String> optionsJson = GeneratedColumn<String>(
    'options_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerIndexMeta = const VerificationMeta(
    'answerIndex',
  );
  @override
  late final GeneratedColumn<int> answerIndex = GeneratedColumn<int>(
    'answer_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('基础'),
  );
  static const VerificationMeta _orderIdxMeta = const VerificationMeta(
    'orderIdx',
  );
  @override
  late final GeneratedColumn<int> orderIdx = GeneratedColumn<int>(
    'order_idx',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    quizId,
    nodeId,
    stem,
    optionsJson,
    answerIndex,
    explanation,
    difficulty,
    orderIdx,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz_questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuizQuestion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('quiz_id')) {
      context.handle(
        _quizIdMeta,
        quizId.isAcceptableOrUnknown(data['quiz_id']!, _quizIdMeta),
      );
    } else if (isInserting) {
      context.missing(_quizIdMeta);
    }
    if (data.containsKey('node_id')) {
      context.handle(
        _nodeIdMeta,
        nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta),
      );
    }
    if (data.containsKey('stem')) {
      context.handle(
        _stemMeta,
        stem.isAcceptableOrUnknown(data['stem']!, _stemMeta),
      );
    } else if (isInserting) {
      context.missing(_stemMeta);
    }
    if (data.containsKey('options_json')) {
      context.handle(
        _optionsJsonMeta,
        optionsJson.isAcceptableOrUnknown(
          data['options_json']!,
          _optionsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_optionsJsonMeta);
    }
    if (data.containsKey('answer_index')) {
      context.handle(
        _answerIndexMeta,
        answerIndex.isAcceptableOrUnknown(
          data['answer_index']!,
          _answerIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_answerIndexMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('order_idx')) {
      context.handle(
        _orderIdxMeta,
        orderIdx.isAcceptableOrUnknown(data['order_idx']!, _orderIdxMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizQuestion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizQuestion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      quizId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiz_id'],
      )!,
      nodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}node_id'],
      ),
      stem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stem'],
      )!,
      optionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}options_json'],
      )!,
      answerIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}answer_index'],
      )!,
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      )!,
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      )!,
      orderIdx: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_idx'],
      )!,
    );
  }

  @override
  $QuizQuestionsTable createAlias(String alias) {
    return $QuizQuestionsTable(attachedDatabase, alias);
  }
}

class QuizQuestion extends DataClass implements Insertable<QuizQuestion> {
  final String id;
  final String quizId;
  final String? nodeId;
  final String stem;
  final String optionsJson;
  final int answerIndex;
  final String explanation;
  final String difficulty;
  final int orderIdx;
  const QuizQuestion({
    required this.id,
    required this.quizId,
    this.nodeId,
    required this.stem,
    required this.optionsJson,
    required this.answerIndex,
    required this.explanation,
    required this.difficulty,
    required this.orderIdx,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['quiz_id'] = Variable<String>(quizId);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['stem'] = Variable<String>(stem);
    map['options_json'] = Variable<String>(optionsJson);
    map['answer_index'] = Variable<int>(answerIndex);
    map['explanation'] = Variable<String>(explanation);
    map['difficulty'] = Variable<String>(difficulty);
    map['order_idx'] = Variable<int>(orderIdx);
    return map;
  }

  QuizQuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuizQuestionsCompanion(
      id: Value(id),
      quizId: Value(quizId),
      nodeId: nodeId == null && nullToAbsent
          ? const Value.absent()
          : Value(nodeId),
      stem: Value(stem),
      optionsJson: Value(optionsJson),
      answerIndex: Value(answerIndex),
      explanation: Value(explanation),
      difficulty: Value(difficulty),
      orderIdx: Value(orderIdx),
    );
  }

  factory QuizQuestion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizQuestion(
      id: serializer.fromJson<String>(json['id']),
      quizId: serializer.fromJson<String>(json['quizId']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      stem: serializer.fromJson<String>(json['stem']),
      optionsJson: serializer.fromJson<String>(json['optionsJson']),
      answerIndex: serializer.fromJson<int>(json['answerIndex']),
      explanation: serializer.fromJson<String>(json['explanation']),
      difficulty: serializer.fromJson<String>(json['difficulty']),
      orderIdx: serializer.fromJson<int>(json['orderIdx']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'quizId': serializer.toJson<String>(quizId),
      'nodeId': serializer.toJson<String?>(nodeId),
      'stem': serializer.toJson<String>(stem),
      'optionsJson': serializer.toJson<String>(optionsJson),
      'answerIndex': serializer.toJson<int>(answerIndex),
      'explanation': serializer.toJson<String>(explanation),
      'difficulty': serializer.toJson<String>(difficulty),
      'orderIdx': serializer.toJson<int>(orderIdx),
    };
  }

  QuizQuestion copyWith({
    String? id,
    String? quizId,
    Value<String?> nodeId = const Value.absent(),
    String? stem,
    String? optionsJson,
    int? answerIndex,
    String? explanation,
    String? difficulty,
    int? orderIdx,
  }) => QuizQuestion(
    id: id ?? this.id,
    quizId: quizId ?? this.quizId,
    nodeId: nodeId.present ? nodeId.value : this.nodeId,
    stem: stem ?? this.stem,
    optionsJson: optionsJson ?? this.optionsJson,
    answerIndex: answerIndex ?? this.answerIndex,
    explanation: explanation ?? this.explanation,
    difficulty: difficulty ?? this.difficulty,
    orderIdx: orderIdx ?? this.orderIdx,
  );
  QuizQuestion copyWithCompanion(QuizQuestionsCompanion data) {
    return QuizQuestion(
      id: data.id.present ? data.id.value : this.id,
      quizId: data.quizId.present ? data.quizId.value : this.quizId,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      stem: data.stem.present ? data.stem.value : this.stem,
      optionsJson: data.optionsJson.present
          ? data.optionsJson.value
          : this.optionsJson,
      answerIndex: data.answerIndex.present
          ? data.answerIndex.value
          : this.answerIndex,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      orderIdx: data.orderIdx.present ? data.orderIdx.value : this.orderIdx,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizQuestion(')
          ..write('id: $id, ')
          ..write('quizId: $quizId, ')
          ..write('nodeId: $nodeId, ')
          ..write('stem: $stem, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('answerIndex: $answerIndex, ')
          ..write('explanation: $explanation, ')
          ..write('difficulty: $difficulty, ')
          ..write('orderIdx: $orderIdx')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    quizId,
    nodeId,
    stem,
    optionsJson,
    answerIndex,
    explanation,
    difficulty,
    orderIdx,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizQuestion &&
          other.id == this.id &&
          other.quizId == this.quizId &&
          other.nodeId == this.nodeId &&
          other.stem == this.stem &&
          other.optionsJson == this.optionsJson &&
          other.answerIndex == this.answerIndex &&
          other.explanation == this.explanation &&
          other.difficulty == this.difficulty &&
          other.orderIdx == this.orderIdx);
}

class QuizQuestionsCompanion extends UpdateCompanion<QuizQuestion> {
  final Value<String> id;
  final Value<String> quizId;
  final Value<String?> nodeId;
  final Value<String> stem;
  final Value<String> optionsJson;
  final Value<int> answerIndex;
  final Value<String> explanation;
  final Value<String> difficulty;
  final Value<int> orderIdx;
  final Value<int> rowid;
  const QuizQuestionsCompanion({
    this.id = const Value.absent(),
    this.quizId = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.stem = const Value.absent(),
    this.optionsJson = const Value.absent(),
    this.answerIndex = const Value.absent(),
    this.explanation = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.orderIdx = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuizQuestionsCompanion.insert({
    required String id,
    required String quizId,
    this.nodeId = const Value.absent(),
    required String stem,
    required String optionsJson,
    required int answerIndex,
    this.explanation = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.orderIdx = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       quizId = Value(quizId),
       stem = Value(stem),
       optionsJson = Value(optionsJson),
       answerIndex = Value(answerIndex);
  static Insertable<QuizQuestion> custom({
    Expression<String>? id,
    Expression<String>? quizId,
    Expression<String>? nodeId,
    Expression<String>? stem,
    Expression<String>? optionsJson,
    Expression<int>? answerIndex,
    Expression<String>? explanation,
    Expression<String>? difficulty,
    Expression<int>? orderIdx,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quizId != null) 'quiz_id': quizId,
      if (nodeId != null) 'node_id': nodeId,
      if (stem != null) 'stem': stem,
      if (optionsJson != null) 'options_json': optionsJson,
      if (answerIndex != null) 'answer_index': answerIndex,
      if (explanation != null) 'explanation': explanation,
      if (difficulty != null) 'difficulty': difficulty,
      if (orderIdx != null) 'order_idx': orderIdx,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuizQuestionsCompanion copyWith({
    Value<String>? id,
    Value<String>? quizId,
    Value<String?>? nodeId,
    Value<String>? stem,
    Value<String>? optionsJson,
    Value<int>? answerIndex,
    Value<String>? explanation,
    Value<String>? difficulty,
    Value<int>? orderIdx,
    Value<int>? rowid,
  }) {
    return QuizQuestionsCompanion(
      id: id ?? this.id,
      quizId: quizId ?? this.quizId,
      nodeId: nodeId ?? this.nodeId,
      stem: stem ?? this.stem,
      optionsJson: optionsJson ?? this.optionsJson,
      answerIndex: answerIndex ?? this.answerIndex,
      explanation: explanation ?? this.explanation,
      difficulty: difficulty ?? this.difficulty,
      orderIdx: orderIdx ?? this.orderIdx,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (quizId.present) {
      map['quiz_id'] = Variable<String>(quizId.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (stem.present) {
      map['stem'] = Variable<String>(stem.value);
    }
    if (optionsJson.present) {
      map['options_json'] = Variable<String>(optionsJson.value);
    }
    if (answerIndex.present) {
      map['answer_index'] = Variable<int>(answerIndex.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (orderIdx.present) {
      map['order_idx'] = Variable<int>(orderIdx.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizQuestionsCompanion(')
          ..write('id: $id, ')
          ..write('quizId: $quizId, ')
          ..write('nodeId: $nodeId, ')
          ..write('stem: $stem, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('answerIndex: $answerIndex, ')
          ..write('explanation: $explanation, ')
          ..write('difficulty: $difficulty, ')
          ..write('orderIdx: $orderIdx, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PointsLedgerTable extends PointsLedger
    with TableInfo<$PointsLedgerTable, PointsLedgerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointsLedgerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deltaMeta = const VerificationMeta('delta');
  @override
  late final GeneratedColumn<int> delta = GeneratedColumn<int>(
    'delta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quizIdMeta = const VerificationMeta('quizId');
  @override
  late final GeneratedColumn<String> quizId = GeneratedColumn<String>(
    'quiz_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _balanceAfterMeta = const VerificationMeta(
    'balanceAfter',
  );
  @override
  late final GeneratedColumn<int> balanceAfter = GeneratedColumn<int>(
    'balance_after',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    delta,
    source,
    quizId,
    reason,
    balanceAfter,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'points_ledger';
  @override
  VerificationContext validateIntegrity(
    Insertable<PointsLedgerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('delta')) {
      context.handle(
        _deltaMeta,
        delta.isAcceptableOrUnknown(data['delta']!, _deltaMeta),
      );
    } else if (isInserting) {
      context.missing(_deltaMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('quiz_id')) {
      context.handle(
        _quizIdMeta,
        quizId.isAcceptableOrUnknown(data['quiz_id']!, _quizIdMeta),
      );
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    if (data.containsKey('balance_after')) {
      context.handle(
        _balanceAfterMeta,
        balanceAfter.isAcceptableOrUnknown(
          data['balance_after']!,
          _balanceAfterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_balanceAfterMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PointsLedgerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PointsLedgerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      delta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}delta'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      quizId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiz_id'],
      ),
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      balanceAfter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance_after'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PointsLedgerTable createAlias(String alias) {
    return $PointsLedgerTable(attachedDatabase, alias);
  }
}

class PointsLedgerData extends DataClass
    implements Insertable<PointsLedgerData> {
  final String id;
  final int delta;
  final String source;
  final String? quizId;
  final String reason;
  final int balanceAfter;
  final int createdAt;
  const PointsLedgerData({
    required this.id,
    required this.delta,
    required this.source,
    this.quizId,
    required this.reason,
    required this.balanceAfter,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['delta'] = Variable<int>(delta);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || quizId != null) {
      map['quiz_id'] = Variable<String>(quizId);
    }
    map['reason'] = Variable<String>(reason);
    map['balance_after'] = Variable<int>(balanceAfter);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  PointsLedgerCompanion toCompanion(bool nullToAbsent) {
    return PointsLedgerCompanion(
      id: Value(id),
      delta: Value(delta),
      source: Value(source),
      quizId: quizId == null && nullToAbsent
          ? const Value.absent()
          : Value(quizId),
      reason: Value(reason),
      balanceAfter: Value(balanceAfter),
      createdAt: Value(createdAt),
    );
  }

  factory PointsLedgerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointsLedgerData(
      id: serializer.fromJson<String>(json['id']),
      delta: serializer.fromJson<int>(json['delta']),
      source: serializer.fromJson<String>(json['source']),
      quizId: serializer.fromJson<String?>(json['quizId']),
      reason: serializer.fromJson<String>(json['reason']),
      balanceAfter: serializer.fromJson<int>(json['balanceAfter']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'delta': serializer.toJson<int>(delta),
      'source': serializer.toJson<String>(source),
      'quizId': serializer.toJson<String?>(quizId),
      'reason': serializer.toJson<String>(reason),
      'balanceAfter': serializer.toJson<int>(balanceAfter),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  PointsLedgerData copyWith({
    String? id,
    int? delta,
    String? source,
    Value<String?> quizId = const Value.absent(),
    String? reason,
    int? balanceAfter,
    int? createdAt,
  }) => PointsLedgerData(
    id: id ?? this.id,
    delta: delta ?? this.delta,
    source: source ?? this.source,
    quizId: quizId.present ? quizId.value : this.quizId,
    reason: reason ?? this.reason,
    balanceAfter: balanceAfter ?? this.balanceAfter,
    createdAt: createdAt ?? this.createdAt,
  );
  PointsLedgerData copyWithCompanion(PointsLedgerCompanion data) {
    return PointsLedgerData(
      id: data.id.present ? data.id.value : this.id,
      delta: data.delta.present ? data.delta.value : this.delta,
      source: data.source.present ? data.source.value : this.source,
      quizId: data.quizId.present ? data.quizId.value : this.quizId,
      reason: data.reason.present ? data.reason.value : this.reason,
      balanceAfter: data.balanceAfter.present
          ? data.balanceAfter.value
          : this.balanceAfter,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PointsLedgerData(')
          ..write('id: $id, ')
          ..write('delta: $delta, ')
          ..write('source: $source, ')
          ..write('quizId: $quizId, ')
          ..write('reason: $reason, ')
          ..write('balanceAfter: $balanceAfter, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, delta, source, quizId, reason, balanceAfter, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointsLedgerData &&
          other.id == this.id &&
          other.delta == this.delta &&
          other.source == this.source &&
          other.quizId == this.quizId &&
          other.reason == this.reason &&
          other.balanceAfter == this.balanceAfter &&
          other.createdAt == this.createdAt);
}

class PointsLedgerCompanion extends UpdateCompanion<PointsLedgerData> {
  final Value<String> id;
  final Value<int> delta;
  final Value<String> source;
  final Value<String?> quizId;
  final Value<String> reason;
  final Value<int> balanceAfter;
  final Value<int> createdAt;
  final Value<int> rowid;
  const PointsLedgerCompanion({
    this.id = const Value.absent(),
    this.delta = const Value.absent(),
    this.source = const Value.absent(),
    this.quizId = const Value.absent(),
    this.reason = const Value.absent(),
    this.balanceAfter = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PointsLedgerCompanion.insert({
    required String id,
    required int delta,
    required String source,
    this.quizId = const Value.absent(),
    this.reason = const Value.absent(),
    required int balanceAfter,
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       delta = Value(delta),
       source = Value(source),
       balanceAfter = Value(balanceAfter),
       createdAt = Value(createdAt);
  static Insertable<PointsLedgerData> custom({
    Expression<String>? id,
    Expression<int>? delta,
    Expression<String>? source,
    Expression<String>? quizId,
    Expression<String>? reason,
    Expression<int>? balanceAfter,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (delta != null) 'delta': delta,
      if (source != null) 'source': source,
      if (quizId != null) 'quiz_id': quizId,
      if (reason != null) 'reason': reason,
      if (balanceAfter != null) 'balance_after': balanceAfter,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PointsLedgerCompanion copyWith({
    Value<String>? id,
    Value<int>? delta,
    Value<String>? source,
    Value<String?>? quizId,
    Value<String>? reason,
    Value<int>? balanceAfter,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return PointsLedgerCompanion(
      id: id ?? this.id,
      delta: delta ?? this.delta,
      source: source ?? this.source,
      quizId: quizId ?? this.quizId,
      reason: reason ?? this.reason,
      balanceAfter: balanceAfter ?? this.balanceAfter,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (delta.present) {
      map['delta'] = Variable<int>(delta.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (quizId.present) {
      map['quiz_id'] = Variable<String>(quizId.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (balanceAfter.present) {
      map['balance_after'] = Variable<int>(balanceAfter.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointsLedgerCompanion(')
          ..write('id: $id, ')
          ..write('delta: $delta, ')
          ..write('source: $source, ')
          ..write('quizId: $quizId, ')
          ..write('reason: $reason, ')
          ..write('balanceAfter: $balanceAfter, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BadgesTable extends Badges with TableInfo<$BadgesTable, Badge> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BadgesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodKeyMeta = const VerificationMeta(
    'periodKey',
  );
  @override
  late final GeneratedColumn<String> periodKey = GeneratedColumn<String>(
    'period_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quizIdMeta = const VerificationMeta('quizId');
  @override
  late final GeneratedColumn<String> quizId = GeneratedColumn<String>(
    'quiz_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _earnedAtMeta = const VerificationMeta(
    'earnedAt',
  );
  @override
  late final GeneratedColumn<int> earnedAt = GeneratedColumn<int>(
    'earned_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, kind, periodKey, quizId, earnedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'badges';
  @override
  VerificationContext validateIntegrity(
    Insertable<Badge> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('period_key')) {
      context.handle(
        _periodKeyMeta,
        periodKey.isAcceptableOrUnknown(data['period_key']!, _periodKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_periodKeyMeta);
    }
    if (data.containsKey('quiz_id')) {
      context.handle(
        _quizIdMeta,
        quizId.isAcceptableOrUnknown(data['quiz_id']!, _quizIdMeta),
      );
    }
    if (data.containsKey('earned_at')) {
      context.handle(
        _earnedAtMeta,
        earnedAt.isAcceptableOrUnknown(data['earned_at']!, _earnedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_earnedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Badge map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Badge(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      periodKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period_key'],
      )!,
      quizId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiz_id'],
      ),
      earnedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}earned_at'],
      )!,
    );
  }

  @override
  $BadgesTable createAlias(String alias) {
    return $BadgesTable(attachedDatabase, alias);
  }
}

class Badge extends DataClass implements Insertable<Badge> {
  final String id;
  final String kind;
  final String periodKey;
  final String? quizId;
  final int earnedAt;
  const Badge({
    required this.id,
    required this.kind,
    required this.periodKey,
    this.quizId,
    required this.earnedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    map['period_key'] = Variable<String>(periodKey);
    if (!nullToAbsent || quizId != null) {
      map['quiz_id'] = Variable<String>(quizId);
    }
    map['earned_at'] = Variable<int>(earnedAt);
    return map;
  }

  BadgesCompanion toCompanion(bool nullToAbsent) {
    return BadgesCompanion(
      id: Value(id),
      kind: Value(kind),
      periodKey: Value(periodKey),
      quizId: quizId == null && nullToAbsent
          ? const Value.absent()
          : Value(quizId),
      earnedAt: Value(earnedAt),
    );
  }

  factory Badge.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Badge(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      periodKey: serializer.fromJson<String>(json['periodKey']),
      quizId: serializer.fromJson<String?>(json['quizId']),
      earnedAt: serializer.fromJson<int>(json['earnedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'periodKey': serializer.toJson<String>(periodKey),
      'quizId': serializer.toJson<String?>(quizId),
      'earnedAt': serializer.toJson<int>(earnedAt),
    };
  }

  Badge copyWith({
    String? id,
    String? kind,
    String? periodKey,
    Value<String?> quizId = const Value.absent(),
    int? earnedAt,
  }) => Badge(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    periodKey: periodKey ?? this.periodKey,
    quizId: quizId.present ? quizId.value : this.quizId,
    earnedAt: earnedAt ?? this.earnedAt,
  );
  Badge copyWithCompanion(BadgesCompanion data) {
    return Badge(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      periodKey: data.periodKey.present ? data.periodKey.value : this.periodKey,
      quizId: data.quizId.present ? data.quizId.value : this.quizId,
      earnedAt: data.earnedAt.present ? data.earnedAt.value : this.earnedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Badge(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('periodKey: $periodKey, ')
          ..write('quizId: $quizId, ')
          ..write('earnedAt: $earnedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, kind, periodKey, quizId, earnedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Badge &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.periodKey == this.periodKey &&
          other.quizId == this.quizId &&
          other.earnedAt == this.earnedAt);
}

class BadgesCompanion extends UpdateCompanion<Badge> {
  final Value<String> id;
  final Value<String> kind;
  final Value<String> periodKey;
  final Value<String?> quizId;
  final Value<int> earnedAt;
  final Value<int> rowid;
  const BadgesCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.periodKey = const Value.absent(),
    this.quizId = const Value.absent(),
    this.earnedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BadgesCompanion.insert({
    required String id,
    required String kind,
    required String periodKey,
    this.quizId = const Value.absent(),
    required int earnedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       periodKey = Value(periodKey),
       earnedAt = Value(earnedAt);
  static Insertable<Badge> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<String>? periodKey,
    Expression<String>? quizId,
    Expression<int>? earnedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (periodKey != null) 'period_key': periodKey,
      if (quizId != null) 'quiz_id': quizId,
      if (earnedAt != null) 'earned_at': earnedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BadgesCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<String>? periodKey,
    Value<String?>? quizId,
    Value<int>? earnedAt,
    Value<int>? rowid,
  }) {
    return BadgesCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      periodKey: periodKey ?? this.periodKey,
      quizId: quizId ?? this.quizId,
      earnedAt: earnedAt ?? this.earnedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (periodKey.present) {
      map['period_key'] = Variable<String>(periodKey.value);
    }
    if (quizId.present) {
      map['quiz_id'] = Variable<String>(quizId.value);
    }
    if (earnedAt.present) {
      map['earned_at'] = Variable<int>(earnedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BadgesCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('periodKey: $periodKey, ')
          ..write('quizId: $quizId, ')
          ..write('earnedAt: $earnedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SkinsTable extends Skins with TableInfo<$SkinsTable, Skin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unlockTypeMeta = const VerificationMeta(
    'unlockType',
  );
  @override
  late final GeneratedColumn<String> unlockType = GeneratedColumn<String>(
    'unlock_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costPointsMeta = const VerificationMeta(
    'costPoints',
  );
  @override
  late final GeneratedColumn<int> costPoints = GeneratedColumn<int>(
    'cost_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _thresholdPointsMeta = const VerificationMeta(
    'thresholdPoints',
  );
  @override
  late final GeneratedColumn<int> thresholdPoints = GeneratedColumn<int>(
    'threshold_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _requiredBadgesJsonMeta =
      const VerificationMeta('requiredBadgesJson');
  @override
  late final GeneratedColumn<String> requiredBadgesJson =
      GeneratedColumn<String>(
        'required_badges_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('{}'),
      );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _paletteRefMeta = const VerificationMeta(
    'paletteRef',
  );
  @override
  late final GeneratedColumn<String> paletteRef = GeneratedColumn<String>(
    'palette_ref',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownedAtMeta = const VerificationMeta(
    'ownedAt',
  );
  @override
  late final GeneratedColumn<int> ownedAt = GeneratedColumn<int>(
    'owned_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _equippedMeta = const VerificationMeta(
    'equipped',
  );
  @override
  late final GeneratedColumn<bool> equipped = GeneratedColumn<bool>(
    'equipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("equipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    unlockType,
    costPoints,
    thresholdPoints,
    requiredBadgesJson,
    description,
    paletteRef,
    ownedAt,
    equipped,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skins';
  @override
  VerificationContext validateIntegrity(
    Insertable<Skin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('unlock_type')) {
      context.handle(
        _unlockTypeMeta,
        unlockType.isAcceptableOrUnknown(data['unlock_type']!, _unlockTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_unlockTypeMeta);
    }
    if (data.containsKey('cost_points')) {
      context.handle(
        _costPointsMeta,
        costPoints.isAcceptableOrUnknown(data['cost_points']!, _costPointsMeta),
      );
    }
    if (data.containsKey('threshold_points')) {
      context.handle(
        _thresholdPointsMeta,
        thresholdPoints.isAcceptableOrUnknown(
          data['threshold_points']!,
          _thresholdPointsMeta,
        ),
      );
    }
    if (data.containsKey('required_badges_json')) {
      context.handle(
        _requiredBadgesJsonMeta,
        requiredBadgesJson.isAcceptableOrUnknown(
          data['required_badges_json']!,
          _requiredBadgesJsonMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('palette_ref')) {
      context.handle(
        _paletteRefMeta,
        paletteRef.isAcceptableOrUnknown(data['palette_ref']!, _paletteRefMeta),
      );
    }
    if (data.containsKey('owned_at')) {
      context.handle(
        _ownedAtMeta,
        ownedAt.isAcceptableOrUnknown(data['owned_at']!, _ownedAtMeta),
      );
    }
    if (data.containsKey('equipped')) {
      context.handle(
        _equippedMeta,
        equipped.isAcceptableOrUnknown(data['equipped']!, _equippedMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Skin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Skin(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      unlockType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unlock_type'],
      )!,
      costPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cost_points'],
      )!,
      thresholdPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}threshold_points'],
      )!,
      requiredBadgesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}required_badges_json'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      paletteRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}palette_ref'],
      ),
      ownedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}owned_at'],
      ),
      equipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}equipped'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $SkinsTable createAlias(String alias) {
    return $SkinsTable(attachedDatabase, alias);
  }
}

class Skin extends DataClass implements Insertable<Skin> {
  final String id;
  final String name;
  final String category;
  final String unlockType;
  final int costPoints;
  final int thresholdPoints;
  final String requiredBadgesJson;
  final String description;
  final String? paletteRef;
  final int? ownedAt;
  final bool equipped;
  final int sortOrder;
  const Skin({
    required this.id,
    required this.name,
    required this.category,
    required this.unlockType,
    required this.costPoints,
    required this.thresholdPoints,
    required this.requiredBadgesJson,
    required this.description,
    this.paletteRef,
    this.ownedAt,
    required this.equipped,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['unlock_type'] = Variable<String>(unlockType);
    map['cost_points'] = Variable<int>(costPoints);
    map['threshold_points'] = Variable<int>(thresholdPoints);
    map['required_badges_json'] = Variable<String>(requiredBadgesJson);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || paletteRef != null) {
      map['palette_ref'] = Variable<String>(paletteRef);
    }
    if (!nullToAbsent || ownedAt != null) {
      map['owned_at'] = Variable<int>(ownedAt);
    }
    map['equipped'] = Variable<bool>(equipped);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  SkinsCompanion toCompanion(bool nullToAbsent) {
    return SkinsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      unlockType: Value(unlockType),
      costPoints: Value(costPoints),
      thresholdPoints: Value(thresholdPoints),
      requiredBadgesJson: Value(requiredBadgesJson),
      description: Value(description),
      paletteRef: paletteRef == null && nullToAbsent
          ? const Value.absent()
          : Value(paletteRef),
      ownedAt: ownedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(ownedAt),
      equipped: Value(equipped),
      sortOrder: Value(sortOrder),
    );
  }

  factory Skin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Skin(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      unlockType: serializer.fromJson<String>(json['unlockType']),
      costPoints: serializer.fromJson<int>(json['costPoints']),
      thresholdPoints: serializer.fromJson<int>(json['thresholdPoints']),
      requiredBadgesJson: serializer.fromJson<String>(
        json['requiredBadgesJson'],
      ),
      description: serializer.fromJson<String>(json['description']),
      paletteRef: serializer.fromJson<String?>(json['paletteRef']),
      ownedAt: serializer.fromJson<int?>(json['ownedAt']),
      equipped: serializer.fromJson<bool>(json['equipped']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'unlockType': serializer.toJson<String>(unlockType),
      'costPoints': serializer.toJson<int>(costPoints),
      'thresholdPoints': serializer.toJson<int>(thresholdPoints),
      'requiredBadgesJson': serializer.toJson<String>(requiredBadgesJson),
      'description': serializer.toJson<String>(description),
      'paletteRef': serializer.toJson<String?>(paletteRef),
      'ownedAt': serializer.toJson<int?>(ownedAt),
      'equipped': serializer.toJson<bool>(equipped),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  Skin copyWith({
    String? id,
    String? name,
    String? category,
    String? unlockType,
    int? costPoints,
    int? thresholdPoints,
    String? requiredBadgesJson,
    String? description,
    Value<String?> paletteRef = const Value.absent(),
    Value<int?> ownedAt = const Value.absent(),
    bool? equipped,
    int? sortOrder,
  }) => Skin(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    unlockType: unlockType ?? this.unlockType,
    costPoints: costPoints ?? this.costPoints,
    thresholdPoints: thresholdPoints ?? this.thresholdPoints,
    requiredBadgesJson: requiredBadgesJson ?? this.requiredBadgesJson,
    description: description ?? this.description,
    paletteRef: paletteRef.present ? paletteRef.value : this.paletteRef,
    ownedAt: ownedAt.present ? ownedAt.value : this.ownedAt,
    equipped: equipped ?? this.equipped,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  Skin copyWithCompanion(SkinsCompanion data) {
    return Skin(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      unlockType: data.unlockType.present
          ? data.unlockType.value
          : this.unlockType,
      costPoints: data.costPoints.present
          ? data.costPoints.value
          : this.costPoints,
      thresholdPoints: data.thresholdPoints.present
          ? data.thresholdPoints.value
          : this.thresholdPoints,
      requiredBadgesJson: data.requiredBadgesJson.present
          ? data.requiredBadgesJson.value
          : this.requiredBadgesJson,
      description: data.description.present
          ? data.description.value
          : this.description,
      paletteRef: data.paletteRef.present
          ? data.paletteRef.value
          : this.paletteRef,
      ownedAt: data.ownedAt.present ? data.ownedAt.value : this.ownedAt,
      equipped: data.equipped.present ? data.equipped.value : this.equipped,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Skin(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('unlockType: $unlockType, ')
          ..write('costPoints: $costPoints, ')
          ..write('thresholdPoints: $thresholdPoints, ')
          ..write('requiredBadgesJson: $requiredBadgesJson, ')
          ..write('description: $description, ')
          ..write('paletteRef: $paletteRef, ')
          ..write('ownedAt: $ownedAt, ')
          ..write('equipped: $equipped, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    unlockType,
    costPoints,
    thresholdPoints,
    requiredBadgesJson,
    description,
    paletteRef,
    ownedAt,
    equipped,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Skin &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.unlockType == this.unlockType &&
          other.costPoints == this.costPoints &&
          other.thresholdPoints == this.thresholdPoints &&
          other.requiredBadgesJson == this.requiredBadgesJson &&
          other.description == this.description &&
          other.paletteRef == this.paletteRef &&
          other.ownedAt == this.ownedAt &&
          other.equipped == this.equipped &&
          other.sortOrder == this.sortOrder);
}

class SkinsCompanion extends UpdateCompanion<Skin> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> unlockType;
  final Value<int> costPoints;
  final Value<int> thresholdPoints;
  final Value<String> requiredBadgesJson;
  final Value<String> description;
  final Value<String?> paletteRef;
  final Value<int?> ownedAt;
  final Value<bool> equipped;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const SkinsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.unlockType = const Value.absent(),
    this.costPoints = const Value.absent(),
    this.thresholdPoints = const Value.absent(),
    this.requiredBadgesJson = const Value.absent(),
    this.description = const Value.absent(),
    this.paletteRef = const Value.absent(),
    this.ownedAt = const Value.absent(),
    this.equipped = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SkinsCompanion.insert({
    required String id,
    required String name,
    required String category,
    required String unlockType,
    this.costPoints = const Value.absent(),
    this.thresholdPoints = const Value.absent(),
    this.requiredBadgesJson = const Value.absent(),
    this.description = const Value.absent(),
    this.paletteRef = const Value.absent(),
    this.ownedAt = const Value.absent(),
    this.equipped = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       unlockType = Value(unlockType);
  static Insertable<Skin> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? unlockType,
    Expression<int>? costPoints,
    Expression<int>? thresholdPoints,
    Expression<String>? requiredBadgesJson,
    Expression<String>? description,
    Expression<String>? paletteRef,
    Expression<int>? ownedAt,
    Expression<bool>? equipped,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (unlockType != null) 'unlock_type': unlockType,
      if (costPoints != null) 'cost_points': costPoints,
      if (thresholdPoints != null) 'threshold_points': thresholdPoints,
      if (requiredBadgesJson != null)
        'required_badges_json': requiredBadgesJson,
      if (description != null) 'description': description,
      if (paletteRef != null) 'palette_ref': paletteRef,
      if (ownedAt != null) 'owned_at': ownedAt,
      if (equipped != null) 'equipped': equipped,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SkinsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String>? unlockType,
    Value<int>? costPoints,
    Value<int>? thresholdPoints,
    Value<String>? requiredBadgesJson,
    Value<String>? description,
    Value<String?>? paletteRef,
    Value<int?>? ownedAt,
    Value<bool>? equipped,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return SkinsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      unlockType: unlockType ?? this.unlockType,
      costPoints: costPoints ?? this.costPoints,
      thresholdPoints: thresholdPoints ?? this.thresholdPoints,
      requiredBadgesJson: requiredBadgesJson ?? this.requiredBadgesJson,
      description: description ?? this.description,
      paletteRef: paletteRef ?? this.paletteRef,
      ownedAt: ownedAt ?? this.ownedAt,
      equipped: equipped ?? this.equipped,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (unlockType.present) {
      map['unlock_type'] = Variable<String>(unlockType.value);
    }
    if (costPoints.present) {
      map['cost_points'] = Variable<int>(costPoints.value);
    }
    if (thresholdPoints.present) {
      map['threshold_points'] = Variable<int>(thresholdPoints.value);
    }
    if (requiredBadgesJson.present) {
      map['required_badges_json'] = Variable<String>(requiredBadgesJson.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (paletteRef.present) {
      map['palette_ref'] = Variable<String>(paletteRef.value);
    }
    if (ownedAt.present) {
      map['owned_at'] = Variable<int>(ownedAt.value);
    }
    if (equipped.present) {
      map['equipped'] = Variable<bool>(equipped.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkinsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('unlockType: $unlockType, ')
          ..write('costPoints: $costPoints, ')
          ..write('thresholdPoints: $thresholdPoints, ')
          ..write('requiredBadgesJson: $requiredBadgesJson, ')
          ..write('description: $description, ')
          ..write('paletteRef: $paletteRef, ')
          ..write('ownedAt: $ownedAt, ')
          ..write('equipped: $equipped, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsEntriesTable extends SettingsEntries
    with TableInfo<$SettingsEntriesTable, SettingsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingsEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SettingsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsEntry(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsEntriesTable createAlias(String alias) {
    return $SettingsEntriesTable(attachedDatabase, alias);
  }
}

class SettingsEntry extends DataClass implements Insertable<SettingsEntry> {
  final String key;
  final String value;
  const SettingsEntry({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsEntriesCompanion toCompanion(bool nullToAbsent) {
    return SettingsEntriesCompanion(key: Value(key), value: Value(value));
  }

  factory SettingsEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsEntry(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SettingsEntry copyWith({String? key, String? value}) =>
      SettingsEntry(key: key ?? this.key, value: value ?? this.value);
  SettingsEntry copyWithCompanion(SettingsEntriesCompanion data) {
    return SettingsEntry(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsEntry(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsEntry &&
          other.key == this.key &&
          other.value == this.value);
}

class SettingsEntriesCompanion extends UpdateCompanion<SettingsEntry> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsEntriesCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsEntriesCompanion.insert({
    required String key,
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key);
  static Insertable<SettingsEntry> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsEntriesCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsEntriesCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsEntriesCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $KnowledgeNodesTable knowledgeNodes = $KnowledgeNodesTable(this);
  late final $KnowledgeEdgesTable knowledgeEdges = $KnowledgeEdgesTable(this);
  late final $FedDocumentsTable fedDocuments = $FedDocumentsTable(this);
  late final $ChunksTable chunks = $ChunksTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $CloudSnapshotsTable cloudSnapshots = $CloudSnapshotsTable(this);
  late final $PipelineJobsTable pipelineJobs = $PipelineJobsTable(this);
  late final $LearningRecordsTable learningRecords = $LearningRecordsTable(
    this,
  );
  late final $QuizzesTable quizzes = $QuizzesTable(this);
  late final $QuizQuestionsTable quizQuestions = $QuizQuestionsTable(this);
  late final $PointsLedgerTable pointsLedger = $PointsLedgerTable(this);
  late final $BadgesTable badges = $BadgesTable(this);
  late final $SkinsTable skins = $SkinsTable(this);
  late final $SettingsEntriesTable settingsEntries = $SettingsEntriesTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    knowledgeNodes,
    knowledgeEdges,
    fedDocuments,
    chunks,
    sessions,
    messages,
    cloudSnapshots,
    pipelineJobs,
    learningRecords,
    quizzes,
    quizQuestions,
    pointsLedger,
    badges,
    skins,
    settingsEntries,
  ];
}

typedef $$KnowledgeNodesTableCreateCompanionBuilder =
    KnowledgeNodesCompanion Function({
      required String id,
      Value<String> cloudId,
      required String title,
      Value<String> summary,
      Value<String> content,
      Value<String> gradeTag,
      Value<int> basicLevel,
      Value<int> necessity,
      Value<String> source,
      Value<String?> sourceDocId,
      Value<String> layerPath,
      Value<double> posX,
      Value<double> posY,
      Value<String> status,
      Value<String> modelFingerprint,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$KnowledgeNodesTableUpdateCompanionBuilder =
    KnowledgeNodesCompanion Function({
      Value<String> id,
      Value<String> cloudId,
      Value<String> title,
      Value<String> summary,
      Value<String> content,
      Value<String> gradeTag,
      Value<int> basicLevel,
      Value<int> necessity,
      Value<String> source,
      Value<String?> sourceDocId,
      Value<String> layerPath,
      Value<double> posX,
      Value<double> posY,
      Value<String> status,
      Value<String> modelFingerprint,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

class $$KnowledgeNodesTableFilterComposer
    extends Composer<_$AppDb, $KnowledgeNodesTable> {
  $$KnowledgeNodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cloudId => $composableBuilder(
    column: $table.cloudId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gradeTag => $composableBuilder(
    column: $table.gradeTag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get basicLevel => $composableBuilder(
    column: $table.basicLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get necessity => $composableBuilder(
    column: $table.necessity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceDocId => $composableBuilder(
    column: $table.sourceDocId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get layerPath => $composableBuilder(
    column: $table.layerPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get posX => $composableBuilder(
    column: $table.posX,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get posY => $composableBuilder(
    column: $table.posY,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelFingerprint => $composableBuilder(
    column: $table.modelFingerprint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KnowledgeNodesTableOrderingComposer
    extends Composer<_$AppDb, $KnowledgeNodesTable> {
  $$KnowledgeNodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cloudId => $composableBuilder(
    column: $table.cloudId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gradeTag => $composableBuilder(
    column: $table.gradeTag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get basicLevel => $composableBuilder(
    column: $table.basicLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get necessity => $composableBuilder(
    column: $table.necessity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceDocId => $composableBuilder(
    column: $table.sourceDocId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get layerPath => $composableBuilder(
    column: $table.layerPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get posX => $composableBuilder(
    column: $table.posX,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get posY => $composableBuilder(
    column: $table.posY,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelFingerprint => $composableBuilder(
    column: $table.modelFingerprint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KnowledgeNodesTableAnnotationComposer
    extends Composer<_$AppDb, $KnowledgeNodesTable> {
  $$KnowledgeNodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cloudId =>
      $composableBuilder(column: $table.cloudId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get gradeTag =>
      $composableBuilder(column: $table.gradeTag, builder: (column) => column);

  GeneratedColumn<int> get basicLevel => $composableBuilder(
    column: $table.basicLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get necessity =>
      $composableBuilder(column: $table.necessity, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get sourceDocId => $composableBuilder(
    column: $table.sourceDocId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get layerPath =>
      $composableBuilder(column: $table.layerPath, builder: (column) => column);

  GeneratedColumn<double> get posX =>
      $composableBuilder(column: $table.posX, builder: (column) => column);

  GeneratedColumn<double> get posY =>
      $composableBuilder(column: $table.posY, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get modelFingerprint => $composableBuilder(
    column: $table.modelFingerprint,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$KnowledgeNodesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $KnowledgeNodesTable,
          KnowledgeNode,
          $$KnowledgeNodesTableFilterComposer,
          $$KnowledgeNodesTableOrderingComposer,
          $$KnowledgeNodesTableAnnotationComposer,
          $$KnowledgeNodesTableCreateCompanionBuilder,
          $$KnowledgeNodesTableUpdateCompanionBuilder,
          (
            KnowledgeNode,
            BaseReferences<_$AppDb, $KnowledgeNodesTable, KnowledgeNode>,
          ),
          KnowledgeNode,
          PrefetchHooks Function()
        > {
  $$KnowledgeNodesTableTableManager(_$AppDb db, $KnowledgeNodesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KnowledgeNodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KnowledgeNodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KnowledgeNodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cloudId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String> gradeTag = const Value.absent(),
                Value<int> basicLevel = const Value.absent(),
                Value<int> necessity = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> sourceDocId = const Value.absent(),
                Value<String> layerPath = const Value.absent(),
                Value<double> posX = const Value.absent(),
                Value<double> posY = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> modelFingerprint = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeNodesCompanion(
                id: id,
                cloudId: cloudId,
                title: title,
                summary: summary,
                content: content,
                gradeTag: gradeTag,
                basicLevel: basicLevel,
                necessity: necessity,
                source: source,
                sourceDocId: sourceDocId,
                layerPath: layerPath,
                posX: posX,
                posY: posY,
                status: status,
                modelFingerprint: modelFingerprint,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> cloudId = const Value.absent(),
                required String title,
                Value<String> summary = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String> gradeTag = const Value.absent(),
                Value<int> basicLevel = const Value.absent(),
                Value<int> necessity = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> sourceDocId = const Value.absent(),
                Value<String> layerPath = const Value.absent(),
                Value<double> posX = const Value.absent(),
                Value<double> posY = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> modelFingerprint = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeNodesCompanion.insert(
                id: id,
                cloudId: cloudId,
                title: title,
                summary: summary,
                content: content,
                gradeTag: gradeTag,
                basicLevel: basicLevel,
                necessity: necessity,
                source: source,
                sourceDocId: sourceDocId,
                layerPath: layerPath,
                posX: posX,
                posY: posY,
                status: status,
                modelFingerprint: modelFingerprint,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KnowledgeNodesTable, KnowledgeNode>(table),
                  BaseReferences<_$AppDb, $KnowledgeNodesTable, KnowledgeNode>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KnowledgeNodesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $KnowledgeNodesTable,
      KnowledgeNode,
      $$KnowledgeNodesTableFilterComposer,
      $$KnowledgeNodesTableOrderingComposer,
      $$KnowledgeNodesTableAnnotationComposer,
      $$KnowledgeNodesTableCreateCompanionBuilder,
      $$KnowledgeNodesTableUpdateCompanionBuilder,
      (
        KnowledgeNode,
        BaseReferences<_$AppDb, $KnowledgeNodesTable, KnowledgeNode>,
      ),
      KnowledgeNode,
      PrefetchHooks Function()
    >;
typedef $$KnowledgeEdgesTableCreateCompanionBuilder =
    KnowledgeEdgesCompanion Function({
      required String id,
      required String fromId,
      required String toId,
      required String relation,
      Value<double> confidence,
      Value<String> createdBy,
      Value<String?> snapshotId,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$KnowledgeEdgesTableUpdateCompanionBuilder =
    KnowledgeEdgesCompanion Function({
      Value<String> id,
      Value<String> fromId,
      Value<String> toId,
      Value<String> relation,
      Value<double> confidence,
      Value<String> createdBy,
      Value<String?> snapshotId,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$KnowledgeEdgesTableFilterComposer
    extends Composer<_$AppDb, $KnowledgeEdgesTable> {
  $$KnowledgeEdgesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromId => $composableBuilder(
    column: $table.fromId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toId => $composableBuilder(
    column: $table.toId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relation => $composableBuilder(
    column: $table.relation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get snapshotId => $composableBuilder(
    column: $table.snapshotId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KnowledgeEdgesTableOrderingComposer
    extends Composer<_$AppDb, $KnowledgeEdgesTable> {
  $$KnowledgeEdgesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromId => $composableBuilder(
    column: $table.fromId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toId => $composableBuilder(
    column: $table.toId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relation => $composableBuilder(
    column: $table.relation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdBy => $composableBuilder(
    column: $table.createdBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get snapshotId => $composableBuilder(
    column: $table.snapshotId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KnowledgeEdgesTableAnnotationComposer
    extends Composer<_$AppDb, $KnowledgeEdgesTable> {
  $$KnowledgeEdgesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fromId =>
      $composableBuilder(column: $table.fromId, builder: (column) => column);

  GeneratedColumn<String> get toId =>
      $composableBuilder(column: $table.toId, builder: (column) => column);

  GeneratedColumn<String> get relation =>
      $composableBuilder(column: $table.relation, builder: (column) => column);

  GeneratedColumn<double> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get snapshotId => $composableBuilder(
    column: $table.snapshotId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$KnowledgeEdgesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $KnowledgeEdgesTable,
          KnowledgeEdge,
          $$KnowledgeEdgesTableFilterComposer,
          $$KnowledgeEdgesTableOrderingComposer,
          $$KnowledgeEdgesTableAnnotationComposer,
          $$KnowledgeEdgesTableCreateCompanionBuilder,
          $$KnowledgeEdgesTableUpdateCompanionBuilder,
          (
            KnowledgeEdge,
            BaseReferences<_$AppDb, $KnowledgeEdgesTable, KnowledgeEdge>,
          ),
          KnowledgeEdge,
          PrefetchHooks Function()
        > {
  $$KnowledgeEdgesTableTableManager(_$AppDb db, $KnowledgeEdgesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KnowledgeEdgesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KnowledgeEdgesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KnowledgeEdgesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> fromId = const Value.absent(),
                Value<String> toId = const Value.absent(),
                Value<String> relation = const Value.absent(),
                Value<double> confidence = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<String?> snapshotId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeEdgesCompanion(
                id: id,
                fromId: fromId,
                toId: toId,
                relation: relation,
                confidence: confidence,
                createdBy: createdBy,
                snapshotId: snapshotId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String fromId,
                required String toId,
                required String relation,
                Value<double> confidence = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<String?> snapshotId = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => KnowledgeEdgesCompanion.insert(
                id: id,
                fromId: fromId,
                toId: toId,
                relation: relation,
                confidence: confidence,
                createdBy: createdBy,
                snapshotId: snapshotId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KnowledgeEdgesTable, KnowledgeEdge>(table),
                  BaseReferences<_$AppDb, $KnowledgeEdgesTable, KnowledgeEdge>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KnowledgeEdgesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $KnowledgeEdgesTable,
      KnowledgeEdge,
      $$KnowledgeEdgesTableFilterComposer,
      $$KnowledgeEdgesTableOrderingComposer,
      $$KnowledgeEdgesTableAnnotationComposer,
      $$KnowledgeEdgesTableCreateCompanionBuilder,
      $$KnowledgeEdgesTableUpdateCompanionBuilder,
      (
        KnowledgeEdge,
        BaseReferences<_$AppDb, $KnowledgeEdgesTable, KnowledgeEdge>,
      ),
      KnowledgeEdge,
      PrefetchHooks Function()
    >;
typedef $$FedDocumentsTableCreateCompanionBuilder =
    FedDocumentsCompanion Function({
      required String id,
      required String cloudId,
      required String title,
      required String fileType,
      Value<String> rawPath,
      Value<String> parsedText,
      Value<String> status,
      Value<String?> errorMsg,
      Value<int> nodeCount,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$FedDocumentsTableUpdateCompanionBuilder =
    FedDocumentsCompanion Function({
      Value<String> id,
      Value<String> cloudId,
      Value<String> title,
      Value<String> fileType,
      Value<String> rawPath,
      Value<String> parsedText,
      Value<String> status,
      Value<String?> errorMsg,
      Value<int> nodeCount,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$FedDocumentsTableFilterComposer
    extends Composer<_$AppDb, $FedDocumentsTable> {
  $$FedDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cloudId => $composableBuilder(
    column: $table.cloudId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawPath => $composableBuilder(
    column: $table.rawPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parsedText => $composableBuilder(
    column: $table.parsedText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMsg => $composableBuilder(
    column: $table.errorMsg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nodeCount => $composableBuilder(
    column: $table.nodeCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FedDocumentsTableOrderingComposer
    extends Composer<_$AppDb, $FedDocumentsTable> {
  $$FedDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cloudId => $composableBuilder(
    column: $table.cloudId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawPath => $composableBuilder(
    column: $table.rawPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parsedText => $composableBuilder(
    column: $table.parsedText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMsg => $composableBuilder(
    column: $table.errorMsg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nodeCount => $composableBuilder(
    column: $table.nodeCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FedDocumentsTableAnnotationComposer
    extends Composer<_$AppDb, $FedDocumentsTable> {
  $$FedDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cloudId =>
      $composableBuilder(column: $table.cloudId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<String> get rawPath =>
      $composableBuilder(column: $table.rawPath, builder: (column) => column);

  GeneratedColumn<String> get parsedText => $composableBuilder(
    column: $table.parsedText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get errorMsg =>
      $composableBuilder(column: $table.errorMsg, builder: (column) => column);

  GeneratedColumn<int> get nodeCount =>
      $composableBuilder(column: $table.nodeCount, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FedDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $FedDocumentsTable,
          FedDocument,
          $$FedDocumentsTableFilterComposer,
          $$FedDocumentsTableOrderingComposer,
          $$FedDocumentsTableAnnotationComposer,
          $$FedDocumentsTableCreateCompanionBuilder,
          $$FedDocumentsTableUpdateCompanionBuilder,
          (
            FedDocument,
            BaseReferences<_$AppDb, $FedDocumentsTable, FedDocument>,
          ),
          FedDocument,
          PrefetchHooks Function()
        > {
  $$FedDocumentsTableTableManager(_$AppDb db, $FedDocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FedDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FedDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FedDocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> cloudId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<String> rawPath = const Value.absent(),
                Value<String> parsedText = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> errorMsg = const Value.absent(),
                Value<int> nodeCount = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FedDocumentsCompanion(
                id: id,
                cloudId: cloudId,
                title: title,
                fileType: fileType,
                rawPath: rawPath,
                parsedText: parsedText,
                status: status,
                errorMsg: errorMsg,
                nodeCount: nodeCount,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String cloudId,
                required String title,
                required String fileType,
                Value<String> rawPath = const Value.absent(),
                Value<String> parsedText = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> errorMsg = const Value.absent(),
                Value<int> nodeCount = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => FedDocumentsCompanion.insert(
                id: id,
                cloudId: cloudId,
                title: title,
                fileType: fileType,
                rawPath: rawPath,
                parsedText: parsedText,
                status: status,
                errorMsg: errorMsg,
                nodeCount: nodeCount,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FedDocumentsTable, FedDocument>(table),
                  BaseReferences<_$AppDb, $FedDocumentsTable, FedDocument>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FedDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $FedDocumentsTable,
      FedDocument,
      $$FedDocumentsTableFilterComposer,
      $$FedDocumentsTableOrderingComposer,
      $$FedDocumentsTableAnnotationComposer,
      $$FedDocumentsTableCreateCompanionBuilder,
      $$FedDocumentsTableUpdateCompanionBuilder,
      (FedDocument, BaseReferences<_$AppDb, $FedDocumentsTable, FedDocument>),
      FedDocument,
      PrefetchHooks Function()
    >;
typedef $$ChunksTableCreateCompanionBuilder = ChunksCompanion Function({
  required String id,
  Value<String?> docId,
  Value<String?> nodeId,
  required String content,
  Value<Uint8List?> embedding,
  Value<int> dim,
  Value<String> modelTag,
  required int createdAt,
  Value<int> rowid,
});
typedef $$ChunksTableUpdateCompanionBuilder = ChunksCompanion Function({
  Value<String> id,
  Value<String?> docId,
  Value<String?> nodeId,
  Value<String> content,
  Value<Uint8List?> embedding,
  Value<int> dim,
  Value<String> modelTag,
  Value<int> createdAt,
  Value<int> rowid,
});

class $$ChunksTableFilterComposer extends Composer<_$AppDb, $ChunksTable> {
  $$ChunksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get docId => $composableBuilder(
    column: $table.docId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nodeId => $composableBuilder(
    column: $table.nodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get embedding => $composableBuilder(
    column: $table.embedding,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dim => $composableBuilder(
    column: $table.dim,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelTag => $composableBuilder(
    column: $table.modelTag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChunksTableOrderingComposer extends Composer<_$AppDb, $ChunksTable> {
  $$ChunksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get docId => $composableBuilder(
    column: $table.docId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nodeId => $composableBuilder(
    column: $table.nodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get embedding => $composableBuilder(
    column: $table.embedding,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dim => $composableBuilder(
    column: $table.dim,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelTag => $composableBuilder(
    column: $table.modelTag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChunksTableAnnotationComposer extends Composer<_$AppDb, $ChunksTable> {
  $$ChunksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get docId =>
      $composableBuilder(column: $table.docId, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<Uint8List> get embedding =>
      $composableBuilder(column: $table.embedding, builder: (column) => column);

  GeneratedColumn<int> get dim =>
      $composableBuilder(column: $table.dim, builder: (column) => column);

  GeneratedColumn<String> get modelTag =>
      $composableBuilder(column: $table.modelTag, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ChunksTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ChunksTable,
          Chunk,
          $$ChunksTableFilterComposer,
          $$ChunksTableOrderingComposer,
          $$ChunksTableAnnotationComposer,
          $$ChunksTableCreateCompanionBuilder,
          $$ChunksTableUpdateCompanionBuilder,
          (Chunk, BaseReferences<_$AppDb, $ChunksTable, Chunk>),
          Chunk,
          PrefetchHooks Function()
        > {
  $$ChunksTableTableManager(_$AppDb db, $ChunksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChunksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChunksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChunksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> docId = const Value.absent(),
                Value<String?> nodeId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<Uint8List?> embedding = const Value.absent(),
                Value<int> dim = const Value.absent(),
                Value<String> modelTag = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChunksCompanion(
                id: id,
                docId: docId,
                nodeId: nodeId,
                content: content,
                embedding: embedding,
                dim: dim,
                modelTag: modelTag,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> docId = const Value.absent(),
                Value<String?> nodeId = const Value.absent(),
                required String content,
                Value<Uint8List?> embedding = const Value.absent(),
                Value<int> dim = const Value.absent(),
                Value<String> modelTag = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ChunksCompanion.insert(
                id: id,
                docId: docId,
                nodeId: nodeId,
                content: content,
                embedding: embedding,
                dim: dim,
                modelTag: modelTag,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ChunksTable, Chunk>(table),
                  BaseReferences<_$AppDb, $ChunksTable, Chunk>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChunksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ChunksTable,
      Chunk,
      $$ChunksTableFilterComposer,
      $$ChunksTableOrderingComposer,
      $$ChunksTableAnnotationComposer,
      $$ChunksTableCreateCompanionBuilder,
      $$ChunksTableUpdateCompanionBuilder,
      (Chunk, BaseReferences<_$AppDb, $ChunksTable, Chunk>),
      Chunk,
      PrefetchHooks Function()
    >;
typedef $$SessionsTableCreateCompanionBuilder = SessionsCompanion Function({
  required String id,
  Value<String> title,
  Value<String> mode,
  required int createdAt,
  Value<int> rowid,
});
typedef $$SessionsTableUpdateCompanionBuilder = SessionsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> mode,
  Value<int> createdAt,
  Value<int> rowid,
});

class $$SessionsTableFilterComposer extends Composer<_$AppDb, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDb, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDb, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $SessionsTable,
          Session,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (Session, BaseReferences<_$AppDb, $SessionsTable, Session>),
          Session,
          PrefetchHooks Function()
        > {
  $$SessionsTableTableManager(_$AppDb db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion(
                id: id,
                title: title,
                mode: mode,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> title = const Value.absent(),
                Value<String> mode = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                title: title,
                mode: mode,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SessionsTable, Session>(table),
                  BaseReferences<_$AppDb, $SessionsTable, Session>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $SessionsTable,
      Session,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (Session, BaseReferences<_$AppDb, $SessionsTable, Session>),
      Session,
      PrefetchHooks Function()
    >;
typedef $$MessagesTableCreateCompanionBuilder = MessagesCompanion Function({
  required String id,
  required String sessionId,
  required String role,
  required String content,
  Value<String?> citationsJson,
  Value<String?> providerId,
  required int createdAt,
  Value<int> rowid,
});
typedef $$MessagesTableUpdateCompanionBuilder = MessagesCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<String> role,
  Value<String> content,
  Value<String?> citationsJson,
  Value<String?> providerId,
  Value<int> createdAt,
  Value<int> rowid,
});

class $$MessagesTableFilterComposer extends Composer<_$AppDb, $MessagesTable> {
  $$MessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get citationsJson => $composableBuilder(
    column: $table.citationsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MessagesTableOrderingComposer
    extends Composer<_$AppDb, $MessagesTable> {
  $$MessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get citationsJson => $composableBuilder(
    column: $table.citationsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MessagesTableAnnotationComposer
    extends Composer<_$AppDb, $MessagesTable> {
  $$MessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get citationsJson => $composableBuilder(
    column: $table.citationsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get providerId => $composableBuilder(
    column: $table.providerId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$MessagesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $MessagesTable,
          Message,
          $$MessagesTableFilterComposer,
          $$MessagesTableOrderingComposer,
          $$MessagesTableAnnotationComposer,
          $$MessagesTableCreateCompanionBuilder,
          $$MessagesTableUpdateCompanionBuilder,
          (Message, BaseReferences<_$AppDb, $MessagesTable, Message>),
          Message,
          PrefetchHooks Function()
        > {
  $$MessagesTableTableManager(_$AppDb db, $MessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String?> citationsJson = const Value.absent(),
                Value<String?> providerId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessagesCompanion(
                id: id,
                sessionId: sessionId,
                role: role,
                content: content,
                citationsJson: citationsJson,
                providerId: providerId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required String role,
                required String content,
                Value<String?> citationsJson = const Value.absent(),
                Value<String?> providerId = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => MessagesCompanion.insert(
                id: id,
                sessionId: sessionId,
                role: role,
                content: content,
                citationsJson: citationsJson,
                providerId: providerId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MessagesTable, Message>(table),
                  BaseReferences<_$AppDb, $MessagesTable, Message>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $MessagesTable,
      Message,
      $$MessagesTableFilterComposer,
      $$MessagesTableOrderingComposer,
      $$MessagesTableAnnotationComposer,
      $$MessagesTableCreateCompanionBuilder,
      $$MessagesTableUpdateCompanionBuilder,
      (Message, BaseReferences<_$AppDb, $MessagesTable, Message>),
      Message,
      PrefetchHooks Function()
    >;
typedef $$CloudSnapshotsTableCreateCompanionBuilder =
    CloudSnapshotsCompanion Function({
      required String id,
      required String name,
      required String gradeTag,
      required String subject,
      required int version,
      Value<String> stagesJson,
      Value<String> nodeIdsJson,
      Value<String> edgeIdsJson,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$CloudSnapshotsTableUpdateCompanionBuilder =
    CloudSnapshotsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> gradeTag,
      Value<String> subject,
      Value<int> version,
      Value<String> stagesJson,
      Value<String> nodeIdsJson,
      Value<String> edgeIdsJson,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$CloudSnapshotsTableFilterComposer
    extends Composer<_$AppDb, $CloudSnapshotsTable> {
  $$CloudSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gradeTag => $composableBuilder(
    column: $table.gradeTag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subject => $composableBuilder(
    column: $table.subject,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stagesJson => $composableBuilder(
    column: $table.stagesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nodeIdsJson => $composableBuilder(
    column: $table.nodeIdsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get edgeIdsJson => $composableBuilder(
    column: $table.edgeIdsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CloudSnapshotsTableOrderingComposer
    extends Composer<_$AppDb, $CloudSnapshotsTable> {
  $$CloudSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gradeTag => $composableBuilder(
    column: $table.gradeTag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subject => $composableBuilder(
    column: $table.subject,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stagesJson => $composableBuilder(
    column: $table.stagesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nodeIdsJson => $composableBuilder(
    column: $table.nodeIdsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get edgeIdsJson => $composableBuilder(
    column: $table.edgeIdsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CloudSnapshotsTableAnnotationComposer
    extends Composer<_$AppDb, $CloudSnapshotsTable> {
  $$CloudSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get gradeTag =>
      $composableBuilder(column: $table.gradeTag, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get stagesJson => $composableBuilder(
    column: $table.stagesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nodeIdsJson => $composableBuilder(
    column: $table.nodeIdsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get edgeIdsJson => $composableBuilder(
    column: $table.edgeIdsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CloudSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $CloudSnapshotsTable,
          CloudSnapshot,
          $$CloudSnapshotsTableFilterComposer,
          $$CloudSnapshotsTableOrderingComposer,
          $$CloudSnapshotsTableAnnotationComposer,
          $$CloudSnapshotsTableCreateCompanionBuilder,
          $$CloudSnapshotsTableUpdateCompanionBuilder,
          (
            CloudSnapshot,
            BaseReferences<_$AppDb, $CloudSnapshotsTable, CloudSnapshot>,
          ),
          CloudSnapshot,
          PrefetchHooks Function()
        > {
  $$CloudSnapshotsTableTableManager(_$AppDb db, $CloudSnapshotsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CloudSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CloudSnapshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CloudSnapshotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> gradeTag = const Value.absent(),
                Value<String> subject = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> stagesJson = const Value.absent(),
                Value<String> nodeIdsJson = const Value.absent(),
                Value<String> edgeIdsJson = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CloudSnapshotsCompanion(
                id: id,
                name: name,
                gradeTag: gradeTag,
                subject: subject,
                version: version,
                stagesJson: stagesJson,
                nodeIdsJson: nodeIdsJson,
                edgeIdsJson: edgeIdsJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String gradeTag,
                required String subject,
                required int version,
                Value<String> stagesJson = const Value.absent(),
                Value<String> nodeIdsJson = const Value.absent(),
                Value<String> edgeIdsJson = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CloudSnapshotsCompanion.insert(
                id: id,
                name: name,
                gradeTag: gradeTag,
                subject: subject,
                version: version,
                stagesJson: stagesJson,
                nodeIdsJson: nodeIdsJson,
                edgeIdsJson: edgeIdsJson,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CloudSnapshotsTable, CloudSnapshot>(table),
                  BaseReferences<_$AppDb, $CloudSnapshotsTable, CloudSnapshot>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CloudSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $CloudSnapshotsTable,
      CloudSnapshot,
      $$CloudSnapshotsTableFilterComposer,
      $$CloudSnapshotsTableOrderingComposer,
      $$CloudSnapshotsTableAnnotationComposer,
      $$CloudSnapshotsTableCreateCompanionBuilder,
      $$CloudSnapshotsTableUpdateCompanionBuilder,
      (
        CloudSnapshot,
        BaseReferences<_$AppDb, $CloudSnapshotsTable, CloudSnapshot>,
      ),
      CloudSnapshot,
      PrefetchHooks Function()
    >;
typedef $$PipelineJobsTableCreateCompanionBuilder =
    PipelineJobsCompanion Function({
      required String id,
      Value<String?> docId,
      Value<String?> topic,
      required String stage,
      Value<String> status,
      Value<String> payloadJson,
      Value<String?> error,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$PipelineJobsTableUpdateCompanionBuilder =
    PipelineJobsCompanion Function({
      Value<String> id,
      Value<String?> docId,
      Value<String?> topic,
      Value<String> stage,
      Value<String> status,
      Value<String> payloadJson,
      Value<String?> error,
      Value<int> updatedAt,
      Value<int> rowid,
    });

class $$PipelineJobsTableFilterComposer
    extends Composer<_$AppDb, $PipelineJobsTable> {
  $$PipelineJobsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get docId => $composableBuilder(
    column: $table.docId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topic => $composableBuilder(
    column: $table.topic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stage => $composableBuilder(
    column: $table.stage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PipelineJobsTableOrderingComposer
    extends Composer<_$AppDb, $PipelineJobsTable> {
  $$PipelineJobsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get docId => $composableBuilder(
    column: $table.docId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topic => $composableBuilder(
    column: $table.topic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stage => $composableBuilder(
    column: $table.stage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PipelineJobsTableAnnotationComposer
    extends Composer<_$AppDb, $PipelineJobsTable> {
  $$PipelineJobsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get docId =>
      $composableBuilder(column: $table.docId, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<String> get stage =>
      $composableBuilder(column: $table.stage, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get payloadJson => $composableBuilder(
    column: $table.payloadJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PipelineJobsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PipelineJobsTable,
          PipelineJob,
          $$PipelineJobsTableFilterComposer,
          $$PipelineJobsTableOrderingComposer,
          $$PipelineJobsTableAnnotationComposer,
          $$PipelineJobsTableCreateCompanionBuilder,
          $$PipelineJobsTableUpdateCompanionBuilder,
          (
            PipelineJob,
            BaseReferences<_$AppDb, $PipelineJobsTable, PipelineJob>,
          ),
          PipelineJob,
          PrefetchHooks Function()
        > {
  $$PipelineJobsTableTableManager(_$AppDb db, $PipelineJobsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PipelineJobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PipelineJobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PipelineJobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> docId = const Value.absent(),
                Value<String?> topic = const Value.absent(),
                Value<String> stage = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String?> error = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PipelineJobsCompanion(
                id: id,
                docId: docId,
                topic: topic,
                stage: stage,
                status: status,
                payloadJson: payloadJson,
                error: error,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> docId = const Value.absent(),
                Value<String?> topic = const Value.absent(),
                required String stage,
                Value<String> status = const Value.absent(),
                Value<String> payloadJson = const Value.absent(),
                Value<String?> error = const Value.absent(),
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PipelineJobsCompanion.insert(
                id: id,
                docId: docId,
                topic: topic,
                stage: stage,
                status: status,
                payloadJson: payloadJson,
                error: error,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PipelineJobsTable, PipelineJob>(table),
                  BaseReferences<_$AppDb, $PipelineJobsTable, PipelineJob>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PipelineJobsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PipelineJobsTable,
      PipelineJob,
      $$PipelineJobsTableFilterComposer,
      $$PipelineJobsTableOrderingComposer,
      $$PipelineJobsTableAnnotationComposer,
      $$PipelineJobsTableCreateCompanionBuilder,
      $$PipelineJobsTableUpdateCompanionBuilder,
      (PipelineJob, BaseReferences<_$AppDb, $PipelineJobsTable, PipelineJob>),
      PipelineJob,
      PrefetchHooks Function()
    >;
typedef $$LearningRecordsTableCreateCompanionBuilder =
    LearningRecordsCompanion Function({
      required String id,
      required String nodeId,
      required int learnedAt,
      Value<String> source,
      Value<int> rowid,
    });
typedef $$LearningRecordsTableUpdateCompanionBuilder =
    LearningRecordsCompanion Function({
      Value<String> id,
      Value<String> nodeId,
      Value<int> learnedAt,
      Value<String> source,
      Value<int> rowid,
    });

class $$LearningRecordsTableFilterComposer
    extends Composer<_$AppDb, $LearningRecordsTable> {
  $$LearningRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nodeId => $composableBuilder(
    column: $table.nodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get learnedAt => $composableBuilder(
    column: $table.learnedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LearningRecordsTableOrderingComposer
    extends Composer<_$AppDb, $LearningRecordsTable> {
  $$LearningRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nodeId => $composableBuilder(
    column: $table.nodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get learnedAt => $composableBuilder(
    column: $table.learnedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LearningRecordsTableAnnotationComposer
    extends Composer<_$AppDb, $LearningRecordsTable> {
  $$LearningRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<int> get learnedAt =>
      $composableBuilder(column: $table.learnedAt, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$LearningRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $LearningRecordsTable,
          LearningRecord,
          $$LearningRecordsTableFilterComposer,
          $$LearningRecordsTableOrderingComposer,
          $$LearningRecordsTableAnnotationComposer,
          $$LearningRecordsTableCreateCompanionBuilder,
          $$LearningRecordsTableUpdateCompanionBuilder,
          (
            LearningRecord,
            BaseReferences<_$AppDb, $LearningRecordsTable, LearningRecord>,
          ),
          LearningRecord,
          PrefetchHooks Function()
        > {
  $$LearningRecordsTableTableManager(_$AppDb db, $LearningRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> nodeId = const Value.absent(),
                Value<int> learnedAt = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LearningRecordsCompanion(
                id: id,
                nodeId: nodeId,
                learnedAt: learnedAt,
                source: source,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String nodeId,
                required int learnedAt,
                Value<String> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LearningRecordsCompanion.insert(
                id: id,
                nodeId: nodeId,
                learnedAt: learnedAt,
                source: source,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LearningRecordsTable, LearningRecord>(table),
                  BaseReferences<
                    _$AppDb,
                    $LearningRecordsTable,
                    LearningRecord
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LearningRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $LearningRecordsTable,
      LearningRecord,
      $$LearningRecordsTableFilterComposer,
      $$LearningRecordsTableOrderingComposer,
      $$LearningRecordsTableAnnotationComposer,
      $$LearningRecordsTableCreateCompanionBuilder,
      $$LearningRecordsTableUpdateCompanionBuilder,
      (
        LearningRecord,
        BaseReferences<_$AppDb, $LearningRecordsTable, LearningRecord>,
      ),
      LearningRecord,
      PrefetchHooks Function()
    >;
typedef $$QuizzesTableCreateCompanionBuilder = QuizzesCompanion Function({
  required String id,
  required String kind,
  Value<String> scopeJson,
  Value<String> status,
  Value<double?> accuracy,
  Value<int> pointsAwarded,
  Value<bool> badgeAwarded,
  required int createdAt,
  Value<int?> submittedAt,
  Value<int> rowid,
});
typedef $$QuizzesTableUpdateCompanionBuilder = QuizzesCompanion Function({
  Value<String> id,
  Value<String> kind,
  Value<String> scopeJson,
  Value<String> status,
  Value<double?> accuracy,
  Value<int> pointsAwarded,
  Value<bool> badgeAwarded,
  Value<int> createdAt,
  Value<int?> submittedAt,
  Value<int> rowid,
});

class $$QuizzesTableFilterComposer extends Composer<_$AppDb, $QuizzesTable> {
  $$QuizzesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scopeJson => $composableBuilder(
    column: $table.scopeJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pointsAwarded => $composableBuilder(
    column: $table.pointsAwarded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get badgeAwarded => $composableBuilder(
    column: $table.badgeAwarded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuizzesTableOrderingComposer extends Composer<_$AppDb, $QuizzesTable> {
  $$QuizzesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scopeJson => $composableBuilder(
    column: $table.scopeJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accuracy => $composableBuilder(
    column: $table.accuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pointsAwarded => $composableBuilder(
    column: $table.pointsAwarded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get badgeAwarded => $composableBuilder(
    column: $table.badgeAwarded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuizzesTableAnnotationComposer
    extends Composer<_$AppDb, $QuizzesTable> {
  $$QuizzesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get scopeJson =>
      $composableBuilder(column: $table.scopeJson, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get accuracy =>
      $composableBuilder(column: $table.accuracy, builder: (column) => column);

  GeneratedColumn<int> get pointsAwarded => $composableBuilder(
    column: $table.pointsAwarded,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get badgeAwarded => $composableBuilder(
    column: $table.badgeAwarded,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => column,
  );
}

class $$QuizzesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $QuizzesTable,
          Quizze,
          $$QuizzesTableFilterComposer,
          $$QuizzesTableOrderingComposer,
          $$QuizzesTableAnnotationComposer,
          $$QuizzesTableCreateCompanionBuilder,
          $$QuizzesTableUpdateCompanionBuilder,
          (Quizze, BaseReferences<_$AppDb, $QuizzesTable, Quizze>),
          Quizze,
          PrefetchHooks Function()
        > {
  $$QuizzesTableTableManager(_$AppDb db, $QuizzesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizzesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizzesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizzesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> scopeJson = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double?> accuracy = const Value.absent(),
                Value<int> pointsAwarded = const Value.absent(),
                Value<bool> badgeAwarded = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int?> submittedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizzesCompanion(
                id: id,
                kind: kind,
                scopeJson: scopeJson,
                status: status,
                accuracy: accuracy,
                pointsAwarded: pointsAwarded,
                badgeAwarded: badgeAwarded,
                createdAt: createdAt,
                submittedAt: submittedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                Value<String> scopeJson = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double?> accuracy = const Value.absent(),
                Value<int> pointsAwarded = const Value.absent(),
                Value<bool> badgeAwarded = const Value.absent(),
                required int createdAt,
                Value<int?> submittedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizzesCompanion.insert(
                id: id,
                kind: kind,
                scopeJson: scopeJson,
                status: status,
                accuracy: accuracy,
                pointsAwarded: pointsAwarded,
                badgeAwarded: badgeAwarded,
                createdAt: createdAt,
                submittedAt: submittedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuizzesTable, Quizze>(table),
                  BaseReferences<_$AppDb, $QuizzesTable, Quizze>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuizzesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $QuizzesTable,
      Quizze,
      $$QuizzesTableFilterComposer,
      $$QuizzesTableOrderingComposer,
      $$QuizzesTableAnnotationComposer,
      $$QuizzesTableCreateCompanionBuilder,
      $$QuizzesTableUpdateCompanionBuilder,
      (Quizze, BaseReferences<_$AppDb, $QuizzesTable, Quizze>),
      Quizze,
      PrefetchHooks Function()
    >;
typedef $$QuizQuestionsTableCreateCompanionBuilder =
    QuizQuestionsCompanion Function({
      required String id,
      required String quizId,
      Value<String?> nodeId,
      required String stem,
      required String optionsJson,
      required int answerIndex,
      Value<String> explanation,
      Value<String> difficulty,
      Value<int> orderIdx,
      Value<int> rowid,
    });
typedef $$QuizQuestionsTableUpdateCompanionBuilder =
    QuizQuestionsCompanion Function({
      Value<String> id,
      Value<String> quizId,
      Value<String?> nodeId,
      Value<String> stem,
      Value<String> optionsJson,
      Value<int> answerIndex,
      Value<String> explanation,
      Value<String> difficulty,
      Value<int> orderIdx,
      Value<int> rowid,
    });

class $$QuizQuestionsTableFilterComposer
    extends Composer<_$AppDb, $QuizQuestionsTable> {
  $$QuizQuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quizId => $composableBuilder(
    column: $table.quizId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nodeId => $composableBuilder(
    column: $table.nodeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stem => $composableBuilder(
    column: $table.stem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get answerIndex => $composableBuilder(
    column: $table.answerIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIdx => $composableBuilder(
    column: $table.orderIdx,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuizQuestionsTableOrderingComposer
    extends Composer<_$AppDb, $QuizQuestionsTable> {
  $$QuizQuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quizId => $composableBuilder(
    column: $table.quizId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nodeId => $composableBuilder(
    column: $table.nodeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stem => $composableBuilder(
    column: $table.stem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get answerIndex => $composableBuilder(
    column: $table.answerIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIdx => $composableBuilder(
    column: $table.orderIdx,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuizQuestionsTableAnnotationComposer
    extends Composer<_$AppDb, $QuizQuestionsTable> {
  $$QuizQuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get quizId =>
      $composableBuilder(column: $table.quizId, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get stem =>
      $composableBuilder(column: $table.stem, builder: (column) => column);

  GeneratedColumn<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get answerIndex => $composableBuilder(
    column: $table.answerIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIdx =>
      $composableBuilder(column: $table.orderIdx, builder: (column) => column);
}

class $$QuizQuestionsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $QuizQuestionsTable,
          QuizQuestion,
          $$QuizQuestionsTableFilterComposer,
          $$QuizQuestionsTableOrderingComposer,
          $$QuizQuestionsTableAnnotationComposer,
          $$QuizQuestionsTableCreateCompanionBuilder,
          $$QuizQuestionsTableUpdateCompanionBuilder,
          (
            QuizQuestion,
            BaseReferences<_$AppDb, $QuizQuestionsTable, QuizQuestion>,
          ),
          QuizQuestion,
          PrefetchHooks Function()
        > {
  $$QuizQuestionsTableTableManager(_$AppDb db, $QuizQuestionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizQuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizQuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizQuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> quizId = const Value.absent(),
                Value<String?> nodeId = const Value.absent(),
                Value<String> stem = const Value.absent(),
                Value<String> optionsJson = const Value.absent(),
                Value<int> answerIndex = const Value.absent(),
                Value<String> explanation = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<int> orderIdx = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizQuestionsCompanion(
                id: id,
                quizId: quizId,
                nodeId: nodeId,
                stem: stem,
                optionsJson: optionsJson,
                answerIndex: answerIndex,
                explanation: explanation,
                difficulty: difficulty,
                orderIdx: orderIdx,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String quizId,
                Value<String?> nodeId = const Value.absent(),
                required String stem,
                required String optionsJson,
                required int answerIndex,
                Value<String> explanation = const Value.absent(),
                Value<String> difficulty = const Value.absent(),
                Value<int> orderIdx = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizQuestionsCompanion.insert(
                id: id,
                quizId: quizId,
                nodeId: nodeId,
                stem: stem,
                optionsJson: optionsJson,
                answerIndex: answerIndex,
                explanation: explanation,
                difficulty: difficulty,
                orderIdx: orderIdx,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuizQuestionsTable, QuizQuestion>(table),
                  BaseReferences<_$AppDb, $QuizQuestionsTable, QuizQuestion>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuizQuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $QuizQuestionsTable,
      QuizQuestion,
      $$QuizQuestionsTableFilterComposer,
      $$QuizQuestionsTableOrderingComposer,
      $$QuizQuestionsTableAnnotationComposer,
      $$QuizQuestionsTableCreateCompanionBuilder,
      $$QuizQuestionsTableUpdateCompanionBuilder,
      (
        QuizQuestion,
        BaseReferences<_$AppDb, $QuizQuestionsTable, QuizQuestion>,
      ),
      QuizQuestion,
      PrefetchHooks Function()
    >;
typedef $$PointsLedgerTableCreateCompanionBuilder =
    PointsLedgerCompanion Function({
      required String id,
      required int delta,
      required String source,
      Value<String?> quizId,
      Value<String> reason,
      required int balanceAfter,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$PointsLedgerTableUpdateCompanionBuilder =
    PointsLedgerCompanion Function({
      Value<String> id,
      Value<int> delta,
      Value<String> source,
      Value<String?> quizId,
      Value<String> reason,
      Value<int> balanceAfter,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$PointsLedgerTableFilterComposer
    extends Composer<_$AppDb, $PointsLedgerTable> {
  $$PointsLedgerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get delta => $composableBuilder(
    column: $table.delta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quizId => $composableBuilder(
    column: $table.quizId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balanceAfter => $composableBuilder(
    column: $table.balanceAfter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PointsLedgerTableOrderingComposer
    extends Composer<_$AppDb, $PointsLedgerTable> {
  $$PointsLedgerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get delta => $composableBuilder(
    column: $table.delta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quizId => $composableBuilder(
    column: $table.quizId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balanceAfter => $composableBuilder(
    column: $table.balanceAfter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PointsLedgerTableAnnotationComposer
    extends Composer<_$AppDb, $PointsLedgerTable> {
  $$PointsLedgerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get delta =>
      $composableBuilder(column: $table.delta, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get quizId =>
      $composableBuilder(column: $table.quizId, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<int> get balanceAfter => $composableBuilder(
    column: $table.balanceAfter,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PointsLedgerTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PointsLedgerTable,
          PointsLedgerData,
          $$PointsLedgerTableFilterComposer,
          $$PointsLedgerTableOrderingComposer,
          $$PointsLedgerTableAnnotationComposer,
          $$PointsLedgerTableCreateCompanionBuilder,
          $$PointsLedgerTableUpdateCompanionBuilder,
          (
            PointsLedgerData,
            BaseReferences<_$AppDb, $PointsLedgerTable, PointsLedgerData>,
          ),
          PointsLedgerData,
          PrefetchHooks Function()
        > {
  $$PointsLedgerTableTableManager(_$AppDb db, $PointsLedgerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PointsLedgerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PointsLedgerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PointsLedgerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> delta = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> quizId = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<int> balanceAfter = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PointsLedgerCompanion(
                id: id,
                delta: delta,
                source: source,
                quizId: quizId,
                reason: reason,
                balanceAfter: balanceAfter,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int delta,
                required String source,
                Value<String?> quizId = const Value.absent(),
                Value<String> reason = const Value.absent(),
                required int balanceAfter,
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PointsLedgerCompanion.insert(
                id: id,
                delta: delta,
                source: source,
                quizId: quizId,
                reason: reason,
                balanceAfter: balanceAfter,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PointsLedgerTable, PointsLedgerData>(table),
                  BaseReferences<_$AppDb, $PointsLedgerTable, PointsLedgerData>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PointsLedgerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PointsLedgerTable,
      PointsLedgerData,
      $$PointsLedgerTableFilterComposer,
      $$PointsLedgerTableOrderingComposer,
      $$PointsLedgerTableAnnotationComposer,
      $$PointsLedgerTableCreateCompanionBuilder,
      $$PointsLedgerTableUpdateCompanionBuilder,
      (
        PointsLedgerData,
        BaseReferences<_$AppDb, $PointsLedgerTable, PointsLedgerData>,
      ),
      PointsLedgerData,
      PrefetchHooks Function()
    >;
typedef $$BadgesTableCreateCompanionBuilder = BadgesCompanion Function({
  required String id,
  required String kind,
  required String periodKey,
  Value<String?> quizId,
  required int earnedAt,
  Value<int> rowid,
});
typedef $$BadgesTableUpdateCompanionBuilder = BadgesCompanion Function({
  Value<String> id,
  Value<String> kind,
  Value<String> periodKey,
  Value<String?> quizId,
  Value<int> earnedAt,
  Value<int> rowid,
});

class $$BadgesTableFilterComposer extends Composer<_$AppDb, $BadgesTable> {
  $$BadgesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get periodKey => $composableBuilder(
    column: $table.periodKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quizId => $composableBuilder(
    column: $table.quizId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get earnedAt => $composableBuilder(
    column: $table.earnedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BadgesTableOrderingComposer extends Composer<_$AppDb, $BadgesTable> {
  $$BadgesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodKey => $composableBuilder(
    column: $table.periodKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quizId => $composableBuilder(
    column: $table.quizId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get earnedAt => $composableBuilder(
    column: $table.earnedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BadgesTableAnnotationComposer extends Composer<_$AppDb, $BadgesTable> {
  $$BadgesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get periodKey =>
      $composableBuilder(column: $table.periodKey, builder: (column) => column);

  GeneratedColumn<String> get quizId =>
      $composableBuilder(column: $table.quizId, builder: (column) => column);

  GeneratedColumn<int> get earnedAt =>
      $composableBuilder(column: $table.earnedAt, builder: (column) => column);
}

class $$BadgesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $BadgesTable,
          Badge,
          $$BadgesTableFilterComposer,
          $$BadgesTableOrderingComposer,
          $$BadgesTableAnnotationComposer,
          $$BadgesTableCreateCompanionBuilder,
          $$BadgesTableUpdateCompanionBuilder,
          (Badge, BaseReferences<_$AppDb, $BadgesTable, Badge>),
          Badge,
          PrefetchHooks Function()
        > {
  $$BadgesTableTableManager(_$AppDb db, $BadgesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BadgesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BadgesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BadgesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> periodKey = const Value.absent(),
                Value<String?> quizId = const Value.absent(),
                Value<int> earnedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BadgesCompanion(
                id: id,
                kind: kind,
                periodKey: periodKey,
                quizId: quizId,
                earnedAt: earnedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                required String periodKey,
                Value<String?> quizId = const Value.absent(),
                required int earnedAt,
                Value<int> rowid = const Value.absent(),
              }) => BadgesCompanion.insert(
                id: id,
                kind: kind,
                periodKey: periodKey,
                quizId: quizId,
                earnedAt: earnedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BadgesTable, Badge>(table),
                  BaseReferences<_$AppDb, $BadgesTable, Badge>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BadgesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $BadgesTable,
      Badge,
      $$BadgesTableFilterComposer,
      $$BadgesTableOrderingComposer,
      $$BadgesTableAnnotationComposer,
      $$BadgesTableCreateCompanionBuilder,
      $$BadgesTableUpdateCompanionBuilder,
      (Badge, BaseReferences<_$AppDb, $BadgesTable, Badge>),
      Badge,
      PrefetchHooks Function()
    >;
typedef $$SkinsTableCreateCompanionBuilder = SkinsCompanion Function({
  required String id,
  required String name,
  required String category,
  required String unlockType,
  Value<int> costPoints,
  Value<int> thresholdPoints,
  Value<String> requiredBadgesJson,
  Value<String> description,
  Value<String?> paletteRef,
  Value<int?> ownedAt,
  Value<bool> equipped,
  Value<int> sortOrder,
  Value<int> rowid,
});
typedef $$SkinsTableUpdateCompanionBuilder = SkinsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> category,
  Value<String> unlockType,
  Value<int> costPoints,
  Value<int> thresholdPoints,
  Value<String> requiredBadgesJson,
  Value<String> description,
  Value<String?> paletteRef,
  Value<int?> ownedAt,
  Value<bool> equipped,
  Value<int> sortOrder,
  Value<int> rowid,
});

class $$SkinsTableFilterComposer extends Composer<_$AppDb, $SkinsTable> {
  $$SkinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get costPoints => $composableBuilder(
    column: $table.costPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get thresholdPoints => $composableBuilder(
    column: $table.thresholdPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get requiredBadgesJson => $composableBuilder(
    column: $table.requiredBadgesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paletteRef => $composableBuilder(
    column: $table.paletteRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ownedAt => $composableBuilder(
    column: $table.ownedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get equipped => $composableBuilder(
    column: $table.equipped,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SkinsTableOrderingComposer extends Composer<_$AppDb, $SkinsTable> {
  $$SkinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get costPoints => $composableBuilder(
    column: $table.costPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get thresholdPoints => $composableBuilder(
    column: $table.thresholdPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requiredBadgesJson => $composableBuilder(
    column: $table.requiredBadgesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paletteRef => $composableBuilder(
    column: $table.paletteRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ownedAt => $composableBuilder(
    column: $table.ownedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get equipped => $composableBuilder(
    column: $table.equipped,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SkinsTableAnnotationComposer extends Composer<_$AppDb, $SkinsTable> {
  $$SkinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get unlockType => $composableBuilder(
    column: $table.unlockType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get costPoints => $composableBuilder(
    column: $table.costPoints,
    builder: (column) => column,
  );

  GeneratedColumn<int> get thresholdPoints => $composableBuilder(
    column: $table.thresholdPoints,
    builder: (column) => column,
  );

  GeneratedColumn<String> get requiredBadgesJson => $composableBuilder(
    column: $table.requiredBadgesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paletteRef => $composableBuilder(
    column: $table.paletteRef,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ownedAt =>
      $composableBuilder(column: $table.ownedAt, builder: (column) => column);

  GeneratedColumn<bool> get equipped =>
      $composableBuilder(column: $table.equipped, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$SkinsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $SkinsTable,
          Skin,
          $$SkinsTableFilterComposer,
          $$SkinsTableOrderingComposer,
          $$SkinsTableAnnotationComposer,
          $$SkinsTableCreateCompanionBuilder,
          $$SkinsTableUpdateCompanionBuilder,
          (Skin, BaseReferences<_$AppDb, $SkinsTable, Skin>),
          Skin,
          PrefetchHooks Function()
        > {
  $$SkinsTableTableManager(_$AppDb db, $SkinsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SkinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SkinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SkinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> unlockType = const Value.absent(),
                Value<int> costPoints = const Value.absent(),
                Value<int> thresholdPoints = const Value.absent(),
                Value<String> requiredBadgesJson = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> paletteRef = const Value.absent(),
                Value<int?> ownedAt = const Value.absent(),
                Value<bool> equipped = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SkinsCompanion(
                id: id,
                name: name,
                category: category,
                unlockType: unlockType,
                costPoints: costPoints,
                thresholdPoints: thresholdPoints,
                requiredBadgesJson: requiredBadgesJson,
                description: description,
                paletteRef: paletteRef,
                ownedAt: ownedAt,
                equipped: equipped,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String category,
                required String unlockType,
                Value<int> costPoints = const Value.absent(),
                Value<int> thresholdPoints = const Value.absent(),
                Value<String> requiredBadgesJson = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> paletteRef = const Value.absent(),
                Value<int?> ownedAt = const Value.absent(),
                Value<bool> equipped = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SkinsCompanion.insert(
                id: id,
                name: name,
                category: category,
                unlockType: unlockType,
                costPoints: costPoints,
                thresholdPoints: thresholdPoints,
                requiredBadgesJson: requiredBadgesJson,
                description: description,
                paletteRef: paletteRef,
                ownedAt: ownedAt,
                equipped: equipped,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SkinsTable, Skin>(table),
                  BaseReferences<_$AppDb, $SkinsTable, Skin>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SkinsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $SkinsTable,
      Skin,
      $$SkinsTableFilterComposer,
      $$SkinsTableOrderingComposer,
      $$SkinsTableAnnotationComposer,
      $$SkinsTableCreateCompanionBuilder,
      $$SkinsTableUpdateCompanionBuilder,
      (Skin, BaseReferences<_$AppDb, $SkinsTable, Skin>),
      Skin,
      PrefetchHooks Function()
    >;
typedef $$SettingsEntriesTableCreateCompanionBuilder =
    SettingsEntriesCompanion Function({
      required String key,
      Value<String> value,
      Value<int> rowid,
    });
typedef $$SettingsEntriesTableUpdateCompanionBuilder =
    SettingsEntriesCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SettingsEntriesTableFilterComposer
    extends Composer<_$AppDb, $SettingsEntriesTable> {
  $$SettingsEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsEntriesTableOrderingComposer
    extends Composer<_$AppDb, $SettingsEntriesTable> {
  $$SettingsEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsEntriesTableAnnotationComposer
    extends Composer<_$AppDb, $SettingsEntriesTable> {
  $$SettingsEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $SettingsEntriesTable,
          SettingsEntry,
          $$SettingsEntriesTableFilterComposer,
          $$SettingsEntriesTableOrderingComposer,
          $$SettingsEntriesTableAnnotationComposer,
          $$SettingsEntriesTableCreateCompanionBuilder,
          $$SettingsEntriesTableUpdateCompanionBuilder,
          (
            SettingsEntry,
            BaseReferences<_$AppDb, $SettingsEntriesTable, SettingsEntry>,
          ),
          SettingsEntry,
          PrefetchHooks Function()
        > {
  $$SettingsEntriesTableTableManager(_$AppDb db, $SettingsEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => SettingsEntriesCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsEntriesCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsEntriesTable, SettingsEntry>(table),
                  BaseReferences<_$AppDb, $SettingsEntriesTable, SettingsEntry>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $SettingsEntriesTable,
      SettingsEntry,
      $$SettingsEntriesTableFilterComposer,
      $$SettingsEntriesTableOrderingComposer,
      $$SettingsEntriesTableAnnotationComposer,
      $$SettingsEntriesTableCreateCompanionBuilder,
      $$SettingsEntriesTableUpdateCompanionBuilder,
      (
        SettingsEntry,
        BaseReferences<_$AppDb, $SettingsEntriesTable, SettingsEntry>,
      ),
      SettingsEntry,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$KnowledgeNodesTableTableManager get knowledgeNodes =>
      $$KnowledgeNodesTableTableManager(_db, _db.knowledgeNodes);
  $$KnowledgeEdgesTableTableManager get knowledgeEdges =>
      $$KnowledgeEdgesTableTableManager(_db, _db.knowledgeEdges);
  $$FedDocumentsTableTableManager get fedDocuments =>
      $$FedDocumentsTableTableManager(_db, _db.fedDocuments);
  $$ChunksTableTableManager get chunks =>
      $$ChunksTableTableManager(_db, _db.chunks);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
  $$CloudSnapshotsTableTableManager get cloudSnapshots =>
      $$CloudSnapshotsTableTableManager(_db, _db.cloudSnapshots);
  $$PipelineJobsTableTableManager get pipelineJobs =>
      $$PipelineJobsTableTableManager(_db, _db.pipelineJobs);
  $$LearningRecordsTableTableManager get learningRecords =>
      $$LearningRecordsTableTableManager(_db, _db.learningRecords);
  $$QuizzesTableTableManager get quizzes =>
      $$QuizzesTableTableManager(_db, _db.quizzes);
  $$QuizQuestionsTableTableManager get quizQuestions =>
      $$QuizQuestionsTableTableManager(_db, _db.quizQuestions);
  $$PointsLedgerTableTableManager get pointsLedger =>
      $$PointsLedgerTableTableManager(_db, _db.pointsLedger);
  $$BadgesTableTableManager get badges =>
      $$BadgesTableTableManager(_db, _db.badges);
  $$SkinsTableTableManager get skins =>
      $$SkinsTableTableManager(_db, _db.skins);
  $$SettingsEntriesTableTableManager get settingsEntries =>
      $$SettingsEntriesTableTableManager(_db, _db.settingsEntries);
}
