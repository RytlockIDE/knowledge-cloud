# 「知识云」学生专家系统 — 实施计划（v2）

## Context（背景）

工作目录 `c:\Users\YongMing Ni\Desktop\Tree` 为空，属于绿地项目。用户需求：构建一个面向学生的桌面级知识专家系统——

1. **混合算力**：Ollama 本地模型承担基础对话（离线兜底）；联网时云端 API（OpenAI 兼容协议）与本地共同提供算力，按任务复杂度智能分流，云端失败自动降级本地。
2. **本地知识库 + 知识云图**：知识可更新迭代，以力导向"知识云图"可视化，按「基础程度(1-5) × 课程必要程度(1-3)」分级分层（递进式）。
3. **智能体四阶段流水线**：自主抓取 → 迭代 → 逻辑关联性推敲 → 节点位置确定，实现知识自我迭代；用户投喂内容走同一管线，并生成可区分的「私有子云」。
4. **年级蒸馏**：输入年级+学科，结合课程目标从知识库蒸馏出递进式知识云快照（版本化）。
5. **激励闭环（新增）**：学习积分系统 + 练习系统 + 皮肤 Mod——学生在云图/蒸馏视图中标记"已掌握"知识后触发练习，通过考试评价（阶梯式）获得积分与勋章，用积分兑换皮肤或累计积分自动解锁皮肤，勋章数量作为高级皮肤的约束条件，形成"学习→练习→评价→奖励→个性化"的正激励外驱循环。
6. **跨端**：Dart + Flutter Desktop（Windows/macOS/Linux），多端一键安装包。
7. **UI**：面向学生的趣味美观风格（调研结论见下）。

### 已确认的关键决策
- 云端 API：OpenAI 兼容协议，base_url + api_key 可配置（默认 DeepSeek，兼容通义/智谱/OpenAI），密钥用 flutter_secure_storage。
- 本地模型：默认 qwen2.5 系列（3b 起步，可在设置页切换），通过 Ollama REST（localhost:11434）。
- 嵌入向量：仅用本地 Ollama 嵌入模型保证向量空间一致；存 SQLite BLOB，余弦暴力 TopK（单学科节点 ≤3000，无需 faiss）。
- 抓取源 v1：维基百科 REST API + 用户投喂（txt/md/pdf/docx）；架构预留扩展。
- 客观题自动判分（v1 仅选择题+判断题）；主观题判分列为后续扩展。
- 优先实现 Windows（msix），macOS/Linux 打包配置一并就位。

### UI 风格调研结论
- 游戏化激励（掌握度/徽章/积分）、大圆角卡片（16-24px）、低饱和浅底 + 高饱和点缀色、"云"拟物隐喻（云朵吉祥物/云雨动画）、微交互 200-300ms 弹性曲线、深色模式 = "星夜云图"（深藏青底 + 发光节点）。
- 节点颜色映射年级（小学暖黄/初中天蓝/高中紫罗兰/通用青绿），节点大小映射必要程度，边类型用线型区分（前置实线/包含粗线/关联虚线/推论点线）。

## 激励系统规则（用户指定的计分规则，作为实现依据）

### 练习体系（5 类）
| 类型 | 范围 | 难度 | 计分 | 勋章 |
|---|---|---|---|---|
| 新知掌握练 | 刚标记"已掌握"的节点 | 基础 | 100% 通过 → 1 分，否则 0 分（可重做） | — |
| 日练 | 当日所学知识 | 基础 | 100% 掌握 → 1 分 | — |
| 周练 | 本周所学知识 | 进阶 | 正确率 [60,75)→1 分；[75,90)→2 分；≥90→3 分；<60→0 分 | 满分（100%）额外得周勋章 |
| 月练 | 本学段所有已学知识 | 进阶 | 同周练 | 满分得月勋章 |
| 年度总练 | 所有已学知识 | 综合（按学段设计） | 十倍计分：[60,75)→10；[75,90)→20；≥90→30 | 满分得年度勋章 |

- 题量默认：新知练 5 题 / 日练 5 题 / 周练 10 题 / 月练 15 题 / 年度练 20 题（设置页可调）。
- 练习触发：标记"已掌握"后弹窗邀请新知掌握练；日/周/月/年练在练习中心手动开启（有学习记录时才可用），显示周期状态与历史成绩。
- 勋章累计数量是皮肤商店的解锁约束条件之一。

### 皮肤 Mod（双解锁路径 + 勋章约束）
1. **积分兑换**：消耗可用积分（累计积分随兑换扣减）。
2. **累计积分达成**：达到阈值自动解锁（不扣分）。
3. **勋章约束**：部分皮肤需持有指定类型/数量勋章（如"星雨粒子节点特效"需 4 枚周勋章；"毕业礼年度限定"需 1 枚年度勋章）。
- 皮肤类别：应用主题皮肤（整套配色/背景）、云朵吉祥物形象、知识云图节点特效（粒子/星雨）、界面边框 Mod。
- 正激励反馈：兑换/解锁庆祝动画、勋章墙、积分进度条、每周学习报告卡片。

## 总体架构

```
UI 层 features/（对话、知识云图、节点详情、投喂管理、年级蒸馏、
              练习中心、考试作答、奖励中心、设置）
状态层 Riverpod + go_router（NavigationRail 壳布局）
业务层 domain/
  AgentOrchestrator（四阶段流水线）、Distiller（蒸馏）、GraphEngine
  QuizEngine（组卷：RAG 圈定范围 → LLM 出题 → 校验入库 → 判分计分）
  RewardService（积分流水、勋章发放、皮肤解锁/兑换/装备）
服务层 services/
  LlmRouter ─ OllamaClient / OpenaiCompatClient / 熔断器
  RagService(chunker→embedder→vector_store→retriever)
  IngestService(文档解析 + WikiClient) / ConnectivityService
数据层 data/（drift SQLite + DAO + Repositories）
外部：Ollama REST │ 云端 OpenAI 兼容 API │ 维基百科 API
```

**混合算力路由（LlmRouter）**：任务分级 simpleChat/ragChat→本地，kgGenerate/kgRelate/distill/quizGenerate→云端（结构化任务默认云端，本地兜底），embed 强制本地。自动模式：connectivity_plus + 云端探活(3s) → 按 TaskKind 路由 → 云端熔断器(连续3次失败熔断60s) → 失败降级本地并打 `degraded` 标记（UI 显示"本地模式"）。统一流式抽象：`ChatClient.chatStream() → Stream<LlmEvent>(Delta/Done/Error/ProviderSwitched)`。

**出题管线（QuizEngine）**：
1. 圈题范围：按练习类型从 learning_records 取时间窗内已掌握节点（新知=本次标记集合；日=当日；周=本 ISO 周；月=本学段全部已掌握；年=全部）→ RAG 扩展相关内容上下文；
2. LLM 出题（quizGenerate，云端优先，jsonMode）：`{"questions":[{"stem","options":[4项],"answer_index","explanation","node_id","difficulty"}]}`，按节点难度映射（基础题=单一概念；进阶题=跨节点关联/前提链推理）；
3. 校验：answer_index 越界/重复题干去重/选项数≠4 剔除，不足题量补生成一次；
4. 判分：纯本地规则（选项比对）→ 计算正确率 → 按上表计分 → 写 points_ledger + badges（满分）→ 触发解锁检查。

## 数据模型（drift/SQLite）核心表

- `knowledge_nodes`：id, cloud_id('main'或'feed_'+docId), title/summary/content, grade_tag, basic_level(1-5), necessity(1-3), source(agent_crawl|user_feed|seed), layer_path, pos_x/pos_y, status(draft|confirmed)
- `knowledge_edges`：from/to, relation(prerequisite|contains|related|inference), confidence, created_by, snapshot_id
- `learning_records`（新增）：id, node_id, learned_at, source(distill|cloud_map|practice)
- `quizzes`（新增）：id, kind(new_knowledge|daily|weekly|monthly|annual), scope_json(节点id), status(generating|ready|in_progress|submitted|failed), accuracy, points_awarded, badge_awarded, created_at, submitted_at
- `quiz_questions`（新增）：id, quiz_id, node_id, stem, options_json, answer_index, explanation, difficulty
- `points_ledger`（新增）：id, delta, source(quiz|admin), quiz_id?, reason, balance_after, created_at
- `badges`（新增）：id, kind(weekly|monthly|annual), period_key(如 2026-W38/2026-09/2026), quiz_id, earned_at
- `skins`（新增，内置种子数据）：id, name, category(theme|mascot|node_fx|frame), unlock_type(redeem|threshold), cost_points, threshold_points, required_badges_json, asset_ref, owned_at?, equipped?
- `fed_documents`、`chunks`（RAG 向量, model_tag 指纹）、`sessions/messages`、`cloud_snapshots`、`pipeline_jobs`

## UI 页面（9 页）

1. **对话页**：云朵吉祥物开场；气泡流式输出；"知识库模式"引用胶囊；离线"本地模式"角标。
2. **知识云图页**：flutter_force_directed_graph 主视图；主云/子云切换；图例；筛选；节点特效皮肤作用于此。
3. **节点详情页**：摘要/正文/层级面包屑/关系列表/来源；"标记已掌握"按钮（触发新知掌握练邀请 + 写 learning_records）。
4. **投喂管理页**：拖拽上传、解析状态、子云生成。
5. **年级蒸馏页**：两步向导 + 阶段脉络树（graphview）+ 版本对比。
6. **练习中心页**（新增）：五类练习卡片（范围/难度/奖励说明/周期状态/历史成绩）；日周月年练入口与倒计时徽章。
7. **考试作答页**（新增）：逐题作答流（选项卡、进度条）、交卷确认、判分结果页（正确率环 + 得分动效 + 勋章弹出动画 + 积分入账提示）。
8. **奖励中心页**（新增）：积分余额与流水、勋章墙（周/月/年度分栏）、皮肤商店（按类别 Tab：主题/吉祥物/节点特效/边框；每款展示解锁条件——积分价/阈值/所需勋章；兑换按钮、装备按钮、未解锁置灰+进度提示）、解锁庆祝全屏动效。
9. **设置页**：Ollama/云端配置、路由策略、主题与已装备皮肤、嵌入指纹重建、题量配置。

## 技术依赖

flutter_riverpod, go_router, drift(+drift_dev), sqlite3_flutter_libs, connectivity_plus, dio, flutter_force_directed_graph ^1.0.6, graphview 1.5.1（不兼容则自绘备选）, flutter_markdown, file_selector, pdfrx, archive, flutter_secure_storage, window_manager, uuid/intl/logger, lottie（庆祝/勋章动效）; dev: msix, flutter_launcher_icons, flutter_lints。

## 项目结构

```
lib/
├─ main.dart / app.dart（主题+go_router，主题可被皮肤 Mod 覆盖）
├─ core/（config, theme/tokens+light+dark+skin_loader, utils/json_repair, errors）
├─ data/（models/app_db.dart, dao/, repositories/）
├─ services/
│  ├─ llm/（chat_client.dart, llm_router.dart, ollama_client.dart,
│  │        openai_compat_client.dart, circuit_breaker.dart）
│  ├─ network/connectivity_service.dart
│  ├─ rag/（chunker, embedder, vector_store, retriever）
│  ├─ ingest/（document_parser, wiki_client）+ secure_store.dart
├─ domain/
│  ├─ agent/（orchestrator.dart, stages/, prompts/, schema_validator.dart）
│  ├─ distill/distiller.dart
│  ├─ quiz/（quiz_engine.dart, scoring.dart, prompts/quiz_prompt.dart）
│  ├─ reward/（reward_service.dart, skin_catalog.dart 种子皮肤定义）
│  └─ graph/（layout_rules, layer_builder）
└─ features/（shell, chat, cloud_map, node_detail, feed, distill,
             practice, quiz_runner, reward_center, settings）
    + widgets/（cloud_mascot, celebration_overlay, badge_wall_item 等）
```

## 实施里程碑

| 阶段 | 内容 | 验收标准 |
|---|---|---|
| **M0 骨架与本地对话** | 工程初始化、双主题、NavigationRail 壳、设置页、OllamaClient 流式对话、未安装检测引导 | qwen2.5:3b 流式对话；拔网线正常；主题切换生效 |
| **M1 数据层与云图 MVP** | drift 全表（含激励表）、图仓库、力导向渲染、节点/边增删改拖拽、子云切换 | 手动 20 节点图 60fps；重启数据持久 |
| **M2 RAG 与混合路由** | embedder/vector_store/retriever、LlmRouter 完整降级链、对话引用胶囊 | 断云自动降级本地有提示；知识库问答带引用 |
| **M3 智能体流水线与投喂** | 四阶段编排、断点续跑、txt/md 解析、子云生成、容错 JSON、兜底关联 | 投喂 5000 字 md 产出 ≥10 节点 ≥8 边子云；kill 后可续跑 |
| **M4 维基抓取与蒸馏** | WikiClient、pdf/docx、Distiller、快照版本化、graphview 脉络树、筛选器、"标记已掌握" | "初中+数学"产出 3-5 阶段前置链快照可回看 |
| **M5 练习与积分系统** | QuizEngine（范围圈定/LLM 出题/校验）、考试作答页、计分规则引擎（五类练习）、points_ledger/badges、学习记录联动 | 各类练习正确计分（含边界 60/75/90/100）；满分发勋章；错题带解析与出处节点 |
| **M6 皮肤 Mod 与奖励中心** | 皮肤商店、双解锁+勋章约束、装备生效（主题/吉祥物/节点特效/边框）、庆祝动效、勋章墙、积分流水 | 积分兑换扣减正确；阈值达成自动解锁；勋章不足皮肤置灰并显示进度；装备皮肤全局生效 |
| **M7 打磨与三端打包** | 动效/空态/性能优化（节点懒加载、出题后台任务）、msix/DMG/deb/AppImage | 三平台安装包可运行；500 节点缩放平移 >30fps |

## 关键风险与规避

- 本地 3b 结构化输出弱（含出题）→ 结构化任务默认云端 + jsonMode 低温小批量 + 嵌入相似度兜底 + "待审核"终态
- LLM 出题质量（答案错误/超纲）→ 出题强制绑定 node_id 与 explanation 引用原文；本地规则校验；错题反馈入口可人工标记坏题并重出
- 云端不可用 → 熔断器 + 自动降级 + UI 明示；练习出题失败可稍后重试，不影响已获积分
- 图谱性能 → 默认只渲染当前云，>200 节点按筛选裁剪 + 聚簇折叠 + 坐标缓存
- 换嵌入模型 → model_tag 指纹启动校验，不一致强制重建索引
- 积分刷分 → 同一 quiz 不重复计分（quiz.status 提交即锁定）；重做未满分不扣分但仅首次满分发勋章（period_key 幂等约束）
- Ollama 未安装 → 首启健康检查 + 图形化引导 + 端口可配置

## 验证方式

1. **每阶段**：`flutter analyze` 零错误 + `flutter test`（单元测试：json_repair、向量余弦、路由降级、schema 校验器、**计分边界函数（59/60/74/75/89/90/100）**、勋章幂等、皮肤解锁条件判定）
2. **M0**：Ollama + qwen2.5:3b 流式对话；禁用网卡验证离线
3. **M2**：填入 DeepSeek key 验证路由日志；断云端 base_url 验证熔断降级
4. **M3**：投喂样例 md → 检查 nodes/edges/jobs 表与子云 cloud_id；kill 后 resume
5. **M5**：标记 3 个节点已掌握 → 新知掌握练全对得 1 分；构造 60%/75%/90%/100% 正确率验证周练计分与满分勋章
6. **M6**：兑换皮肤后 balance_after 正确、装备后主题/吉祥物/节点特效即时生效；阈值解锁与勋章约束按 catalog 规则触发
7. **端到端**：`flutter build windows --release && dart run msix:create` 产出安装包并安装运行
