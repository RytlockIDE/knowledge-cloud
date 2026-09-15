import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app.dart';
import '../../domain/quiz/scoring.dart';
import '../../services/llm/llm_router.dart';
import '../../services/rag/rag_service.dart';
import '../../services/settings_store.dart';

/// 设置页：本地模型 / 云端 API / 路由策略 / 主题 / 题量 / 向量索引。
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  late final SettingsStore _settings = ref.read(settingsStoreProvider);
  late final TextEditingController _ollamaUrl;
  late final TextEditingController _ollamaChat;
  late final TextEditingController _ollamaEmbed;
  late final TextEditingController _cloudUrl;
  late final TextEditingController _cloudModel;
  late final TextEditingController _apiKey;
  bool _obscureKey = true;
  bool _testingLocal = false;
  bool _testingCloud = false;
  bool _rebuilding = false;
  Map<String, int> _quizCounts = const {};

  @override
  void initState() {
    super.initState();
    _ollamaUrl = TextEditingController(text: _settings.ollamaBaseUrl);
    _ollamaChat = TextEditingController(text: _settings.localChatModel);
    _ollamaEmbed = TextEditingController(text: _settings.localEmbedModel);
    _cloudUrl = TextEditingController(text: _settings.cloudBaseUrl);
    _cloudModel = TextEditingController(text: _settings.cloudModel);
    _apiKey = TextEditingController();
    _quizCounts = {
      for (final k in const [
        'new_knowledge', 'daily', 'weekly', 'monthly', 'annual'
      ])
        k: _settings.quizCount(k),
    };
  }

  @override
  void dispose() {
    _ollamaUrl.dispose();
    _ollamaChat.dispose();
    _ollamaEmbed.dispose();
    _cloudUrl.dispose();
    _cloudModel.dispose();
    _apiKey.dispose();
    super.dispose();
  }

  void _toast(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _saveLocal() async {
    await _settings.setOllamaBaseUrl(_ollamaUrl.text.trim());
    await _settings.setLocalChatModel(_ollamaChat.text.trim());
    await _settings.setLocalEmbedModel(_ollamaEmbed.text.trim());
    // 触发路由器重建客户端（读取最新配置）
    ref.read(llmRouterProvider).ollama();
    _toast('本地模型配置已保存');
  }

  Future<void> _saveCloud() async {
    await _settings.setCloudBaseUrl(_cloudUrl.text.trim());
    await _settings.setCloudModel(_cloudModel.text.trim());
    await _settings.setApiKey(_apiKey.text.trim());
    await ref.read(llmRouterProvider).loadApiKey();
    _toast('云端 API 配置已保存');
  }

  Future<void> _testLocal() async {
    setState(() => _testingLocal = true);
    final router = ref.read(llmRouterProvider);
    await _saveLocal();
    final ok = await router.ollama().isHealthy();
    if (!mounted) return;
    setState(() => _testingLocal = false);
    if (ok) {
      final models = await router.ollama().listModels();
      if (!mounted) return;
      showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('本地服务正常'),
          content: Text(models.isEmpty
              ? '已连接，但未发现已安装模型，请先在终端执行 ollama pull。'
              : '已安装模型：\n${models.join('\n')}'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('好的')),
          ],
        ),
      );
    } else {
      _toast('无法连接本地 Ollama，请确认已启动（ollama serve）');
    }
  }

  Future<void> _testCloud() async {
    setState(() => _testingCloud = true);
    await _saveCloud();
    final ok = await ref.read(llmRouterProvider).cloudHealthy();
    if (!mounted) return;
    setState(() => _testingCloud = false);
    _toast(ok ? '云端服务连接成功' : '云端服务不可达，请检查地址 / 模型 / API Key');
  }

  Future<void> _rebuildIndex() async {
    setState(() => _rebuilding = true);
    try {
      final removed = await ref.read(ragServiceProvider).rebuildAll();
      if (!mounted) return;
      _toast('已清空 $removed 个向量块，知识节点将在下次访问时重新索引');
    } finally {
      if (mounted) setState(() => _rebuilding = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final policy = _settings.routePolicy;
    final mode = ref.watch(themeModeProvider);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _Section(
            title: '本地模型（Ollama）',
            icon: Icons.computer,
            children: [
              _TextField(
                label: '服务地址',
                controller: _ollamaUrl,
                hint: 'http://localhost:11434',
              ),
              _TextField(
                label: '对话模型',
                controller: _ollamaChat,
                hint: 'qwen2.5:3b',
              ),
              _TextField(
                label: '嵌入模型（向量检索）',
                controller: _ollamaEmbed,
                hint: 'nomic-embed-text',
              ),
              Row(
                children: [
                  FilledButton.tonal(
                    onPressed: _testingLocal ? null : _testLocal,
                    child: _testingLocal
                        ? const SizedBox(
                            width: 16, height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : const Text('测试连接'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(onPressed: _saveLocal, child: const Text('保存')),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Section(
            title: '云端 API（OpenAI 兼容）',
            icon: Icons.cloud_outlined,
            children: [
              _TextField(
                label: '接口地址',
                controller: _cloudUrl,
                hint: 'https://api.deepseek.com/v1',
              ),
              _TextField(
                label: '模型名称',
                controller: _cloudModel,
                hint: 'deepseek-chat',
              ),
              TextField(
                controller: _apiKey,
                obscureText: _obscureKey,
                decoration: InputDecoration(
                  labelText: 'API Key（已保存的可留空）',
                  hintText: 'sk-…',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureKey ? Icons.visibility_off : Icons.visibility),
                    onPressed: () =>
                        setState(() => _obscureKey = !_obscureKey),
                  ),
                ),
              ),
              Row(
                children: [
                  FilledButton.tonal(
                    onPressed: _testingCloud ? null : _testCloud,
                    child: _testingCloud
                        ? const SizedBox(
                            width: 16, height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : const Text('测试连接'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(onPressed: _saveCloud, child: const Text('保存')),
                ],
              ),
              Text(
                'API Key 使用系统安全存储加密保存；离线时系统自动切换为本地算力。',
                style: TextStyle(fontSize: 12, color: theme.colorScheme.outline),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Section(
            title: '算力路由策略',
            icon: Icons.alt_route,
            children: [
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'auto', label: Text('自动'), icon: Icon(Icons.auto_mode)),
                  ButtonSegment(value: 'forceLocal', label: Text('仅本地'), icon: Icon(Icons.computer)),
                  ButtonSegment(value: 'forceCloud', label: Text('仅云端'), icon: Icon(Icons.cloud)),
                ],
                selected: {policy},
                onSelectionChanged: (s) async {
                  await _settings.setRoutePolicy(s.first);
                  setState(() {});
                },
              ),
              const SizedBox(height: 8),
              Text(
                switch (policy) {
                  'forceLocal' => '所有任务仅在本地执行，完全离线可用。',
                  'forceCloud' => '所有任务走云端模型，需要网络与 API Key。',
                  _ => '对话与检索走本地；知识生成 / 出题 / 蒸馏优先云端，失败自动降级本地。',
                },
                style: TextStyle(fontSize: 12, color: theme.colorScheme.outline),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Section(
            title: '外观',
            icon: Icons.palette_outlined,
            children: [
              SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(value: ThemeMode.system, label: Text('跟随系统')),
                  ButtonSegment(value: ThemeMode.light, label: Text('浅色')),
                  ButtonSegment(value: ThemeMode.dark, label: Text('深色')),
                ],
                selected: {mode},
                onSelectionChanged: (s) async {
                  ref.read(themeModeProvider.notifier).state = s.first;
                  await _settings.setThemeMode(switch (s.first) {
                    ThemeMode.light => 'light',
                    ThemeMode.dark => 'dark',
                    _ => 'system',
                  });
                },
              ),
              const SizedBox(height: 8),
              Text('皮肤主题可在「奖励中心 → 皮肤商店」兑换并装备。',
                  style: TextStyle(fontSize: 12, color: theme.colorScheme.outline)),
            ],
          ),
          const SizedBox(height: 16),
          _Section(
            title: '练习题量',
            icon: Icons.quiz_outlined,
            children: [
              ..._quizCounts.keys.map((kind) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Expanded(child: Text(Scoring.kindLabel(kind))),
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: _quizCounts[kind]! <= 3
                              ? null
                              : () => _changeCount(kind, -1),
                        ),
                        Text('${_quizCounts[kind]}',
                            style: theme.textTheme.titleMedium),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: _quizCounts[kind]! >= 30
                              ? null
                              : () => _changeCount(kind, 1),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 16),
          _Section(
            title: '向量索引',
            icon: Icons.blur_linear,
            children: [
              Text(
                '嵌入模型：${_settings.localEmbedModel}${_settings.embedModelTag.isEmpty ? '' : '（指纹 ${_settings.embedModelTag}）'}',
                style: TextStyle(fontSize: 12, color: theme.colorScheme.outline),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: _rebuilding ? null : _rebuildIndex,
                icon: _rebuilding
                    ? const SizedBox(
                        width: 16, height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.refresh),
                label: const Text('重建向量索引'),
              ),
              Text(
                '更换嵌入模型后执行，避免新旧向量混用导致检索偏差。',
                style: TextStyle(fontSize: 12, color: theme.colorScheme.outline),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Future<void> _changeCount(String kind, int delta) async {
    final next = _quizCounts[kind]! + delta;
    await _settings.setQuizCount(kind, next);
    setState(() => _quizCounts[kind] = next);
  }
}

// ---- 通用组件 ----

class _Section extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _Section({required this.title, required this.icon, required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(title, style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 14),
            ...children.map((w) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: w,
                )),
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;

  const _TextField({
    required this.label,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
