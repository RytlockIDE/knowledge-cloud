import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// 生成 UUID v4。
String newUuid() => _uuid.v4();
