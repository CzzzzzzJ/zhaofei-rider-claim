# Changelog

## [1.0.0] — 2026-06-09

### 新增
- 首次工程化重构，从单文件 Markdown 拆为 Claude Code Skill 标准结构
- `SKILL.md` 主入口，含 Progressive Disclosure 路由表
- `references/` 9 个知识模块：事故类型 / SOP / 收费 / 判例 / 保险 / 法律 / 抖音模板 / 禁忌 / 市场数据
- `prompts/` 2 个角色：客服 Bot "小安" + 内容创作助手
- `data/skill-config.json` 结构化配置
- README + LICENSE + CHANGELOG

### 优化
- YAML frontmatter 标准化（name / description / license / version / author）
- 触发词扩充：覆盖中文（骑手理赔、外卖工伤、配送时间陷阱等）+ 英文（rider claim、delivery accident）
- 内部数据脱敏：律师代号化、合作方代号化、内部系统名移除
- 客服回复字数硬限制：单轮 ≤150 字，抖音评论 ≤100 字
- 6 个判例补充案号 / 当事人 / 关键判决三要素
- 法律依据补充完整条文 + 反制话术

### 移除
- 内部飞书系统 token / API 凭证
- 律师真实姓名 / 联系方式
- 合作方真实公司名
- 财务结算细则

### 已知限制
- 仅覆盖南京 + 部分省份（杭州 / 山东 / 苏州 / 新疆案例）
- 跨平台（顺丰同城等）数据待沉淀
- 新职伤试点城市未单独成模块

## [0.x] — 2026-05-29

- 赵飞团队龙虾军团原始单文件版本
- 内容形态：单 Markdown，含完整业务知识 + 客服 prompt + Kimi 记忆版
