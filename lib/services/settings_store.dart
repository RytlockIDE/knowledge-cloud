import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 应用设置存储：普通项 SharedPreferences，敏感项（API Key）安全存储。
class SettingsStore {
  static const _kOllamaBaseUrl = 'ollama_base_url';
  static const _kLocalChatModel = 'local_chat_model';
  static const _kLocalEmbedModel = 'local_embed_model';
  static const _kCloudBaseUrl = 'cloud_base_url';
  static const _kCloudModel = 'cloud_model';
  static const _kRoutePolicy = 'route_policy';
  static const _kThemeMode = 'theme_mode';
  static const _kEquippedThemeSkin = 'equipped_theme_skin';
  static const _kEmbedModelTag = 'embed_model_tag';
  static const _kApiKey = 'cloud_api_key';

  SharedPreferences? _prefs;

  /// API Key 内存缓存（路由器同步路径使用）。
  String apiKeyCache = '';

  static const _secure = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _prefs!;

  // ---- Ollama ----
  String get ollamaBaseUrl =>
      prefs.getString(_kOllamaBaseUrl) ?? 'http://localhost:11434';
  Future<void> setOllamaBaseUrl(String v) => prefs.setString(_kOllamaBaseUrl, v);

  String get localChatModel => prefs.getString(_kLocalChatModel) ?? 'qwen2.5:3b';
  Future<void> setLocalChatModel(String v) => prefs.setString(_kLocalChatModel, v);

  String get localEmbedModel =>
      prefs.getString(_kLocalEmbedModel) ?? 'nomic-embed-text';
  Future<void> setLocalEmbedModel(String v) =>
      prefs.setString(_kLocalEmbedModel, v);

  // ---- Cloud ----
  String get cloudBaseUrl =>
      prefs.getString(_kCloudBaseUrl) ?? 'https://api.deepseek.com/v1';
  Future<void> setCloudBaseUrl(String v) => prefs.setString(_kCloudBaseUrl, v);

  String get cloudModel => prefs.getString(_kCloudModel) ?? 'deepseek-chat';
  Future<void> setCloudModel(String v) => prefs.setString(_kCloudModel, v);

  Future<String> get apiKey async => await _secure.read(key: _kApiKey) ?? '';
  Future<void> setApiKey(String v) => _secure.write(key: _kApiKey, value: v);

  // ---- Routing ----
  String get routePolicy => prefs.getString(_kRoutePolicy) ?? 'auto';
  Future<void> setRoutePolicy(String v) => prefs.setString(_kRoutePolicy, v);

  // ---- Theme ----
  String get themeMode => prefs.getString(_kThemeMode) ?? 'system';
  Future<void> setThemeMode(String v) => prefs.setString(_kThemeMode, v);

  String get equippedThemeSkin =>
      prefs.getString(_kEquippedThemeSkin) ?? 'cloud_light';
  Future<void> setEquippedThemeSkin(String v) =>
      prefs.setString(_kEquippedThemeSkin, v);

  // ---- Embedding fingerprint ----
  String get embedModelTag => prefs.getString(_kEmbedModelTag) ?? '';
  Future<void> setEmbedModelTag(String v) => prefs.setString(_kEmbedModelTag, v);

  // ---- Quiz counts ----
  int quizCount(String kind) => prefs.getInt('quiz_count_$kind') ?? _defaultQuizCount(kind);
  Future<void> setQuizCount(String kind, int n) =>
      prefs.setInt('quiz_count_$kind', n);

  static int _defaultQuizCount(String kind) => switch (kind) {
        'new_knowledge' || 'daily' => 5,
        'weekly' => 10,
        'monthly' => 15,
        'annual' => 20,
        _ => 5,
      };
}

final settingsStoreProvider = Provider<SettingsStore>((ref) {
  final s = SettingsStore();
  ref.onDispose(() {});
  return s;
});
