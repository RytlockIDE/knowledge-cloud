import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/uuid.dart';
import '../../data/models/app_db.dart';

/// 会话仓库。
class ChatRepository {
  final Ref ref;

  ChatRepository(this.ref);

  AppDb get _db => ref.read(appDbProvider);

  Future<List<Session>> sessions() => (_db.select(_db.sessions)
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
      .get();

  Future<Session> createSession({String mode = 'chat'}) async {
    final id = newUuid();
    await _db.into(_db.sessions).insert(
          SessionsCompanion.insert(
            id: id,
            mode: Value(mode),
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
    final query = _db.select(_db.sessions)
      ..where((t) => t.id.equals(id));
    return query.getSingle();
  }

  Future<List<Message>> messagesOf(String sessionId) => (_db
          .select(_db.messages)
        ..where((t) => t.sessionId.equals(sessionId))
        ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
      .get();

  Future<void> addMessage({
    required String sessionId,
    required String role,
    required String content,
    String? citationsJson,
    String? providerId,
  }) async {
    await _db.into(_db.messages).insert(
          MessagesCompanion.insert(
            id: newUuid(),
            sessionId: sessionId,
            role: role,
            content: content,
            citationsJson: Value(citationsJson),
            providerId: Value(providerId),
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ),
        );
  }
}

final chatRepositoryProvider =
    Provider<ChatRepository>((ref) => ChatRepository(ref));
