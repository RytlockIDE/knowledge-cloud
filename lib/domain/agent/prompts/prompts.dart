/// 智能体 Prompt 模板（四阶段 + 蒸馏 + 出题）。
class Prompts {
  const Prompts._();

  /// 阶段二：迭代生成节点。
  static String iterate({
    required String existingNodesSummary,
    required String material,
  }) =>
      '''
你是学科知识工程师。基于给定材料，为学生知识云生成原子知识节点。

规则：
1. 每个节点只表达一个概念/原理/事实，标题≤12字，摘要≤40字，内容≤200字；
2. 必须输出 grade_tag（取值：小学|初中|高中|通用）、basic_level（1=启蒙认知…5=拓展深化）、necessity（1=核心必学 2=重要 3=拓展）；
3. 已有节点列表如下（title|summary），若材料内容已被覆盖，不要重复创建：
$existingNodesSummary
4. 每个节点必须给出 evidence：支撑该节点的原文引用片段（≤60字）；
5. 最多输出 10 个节点；只输出 JSON，不要输出其他任何文字。

材料：
$material

输出格式：
{"nodes":[{"title":"...","summary":"...","content":"...","grade_tag":"...","basic_level":1,"necessity":1,"evidence":"..."}]}
''';

  /// 阶段三：逻辑关联推敲。
  static String relate({required String nodeList}) =>
      '''
你是知识图谱构建专家。给定学生知识云的节点列表，推敲节点之间的逻辑关系。

节点列表（id|标题|摘要）：
$nodeList

规则：
1. 仅允许以下关系类型：
   - prerequisite（前置）：必须满足"不理解A就无法理解B"的严格标准，方向为 A→B；
   - contains（包含）：A 是 B 的上位概念，方向为 A→B；
   - related（关联）：相关性联想；
   - inference（推论）：由 A 可推出 B；
2. 为每条关系给出 confidence（0~1），低于 0.6 的不要输出；
3. reason 用一句话说明依据；
4. 禁止成对互相 prerequisite；禁止自环；
5. 最多输出 30 条边；只输出 JSON。

输出格式：
{"edges":[{"from":"节点id","to":"节点id","relation":"prerequisite","confidence":0.9,"reason":"..."}]}
''';

  /// 阶段一（联网抓取后）的摘要压缩。
  static String crawlSummarize({required String topic, required String text}) =>
      '''
你是知识编辑。请将以下关于「$topic」的百科内容压缩为学习材料要点（保留定义、分类、原理、例子），400字以内，输出纯文本要点列表。

内容：
$text
''';

  /// 年级蒸馏。
  static String distill({
    required String gradeTag,
    required String subject,
    required String candidateNodes,
  }) =>
      '''
你是课程设计专家。依据 $gradeTag $subject 课程目标，从候选知识节点中蒸馏出一套递进式知识云。

候选节点（id|标题|基础程度|必要程度）：
$candidateNodes

要求：
1. 覆盖所有 necessity=1 的核心节点；
2. 按"基础程度递进"组织为 3~5 个学习阶段（stage），每阶段有简短名称；
3. 为阶段内与跨阶段的节点补齐 prerequisite 前置链（不理解A就无法理解B，A→B）；
4. 明确排除与该学段课程目标无关的节点，并给出理由；
5. 只输出 JSON。

输出格式：
{"stages":[{"name":"阶段名","node_ids":["..."]}],
 "prerequisites":[{"from":"...","to":"..."}],
 "excluded":[{"id":"...","reason":"..."}]}
''';

  /// 出题。
  static String quiz({
    required String difficulty,
    required String knowledgeContext,
    required int count,
  }) =>
      '''
你是 $difficulty 难度的学科命题老师。基于给定知识点材料出 $count 道客观选择题。

命题要求：
1. 每题必须绑定一个知识点（node_id）；
2. 4 个选项，恰好 1 个正确答案（answer_index 取 0~3）；
3. explanation 说明正确答案依据（≤80字），必须依据材料，不得超纲；
4. 干扰项要有迷惑性但明确错误；
5. 只输出 JSON。

知识点材料：
$knowledgeContext

输出格式：
{"questions":[{"node_id":"...","stem":"题干","options":["A","B","C","D"],"answer_index":0,"explanation":"...","difficulty":"$difficulty"}]}
''';
}
