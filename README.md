# zhaofei-rider-claim

> 外卖骑手事故 / 工伤 / 保险理赔的 **Agent Skill**，由赵飞团队业务沉淀 + 麦当 mdldm 工程化。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Agent: Skill](https://img.shields.io/badge/Agent-Skill-blue.svg)](#)
[![Version](https://img.shields.io/badge/version-1.0.0-green.svg)](CHANGELOG.md)

## 这是什么

把 1000+ 真实通话录音、20 个法院判例、200 个群聊案例沉淀成一个 **Agent-agnostic Skill**，让任意 AI Agent（Claude Code、Cursor、Cline、Codex、扣子、豆包、Dify、Cherry Studio 等）都能直接调用，给骑手提供事故初判、维权 SOP、判例援引、客服话术等服务。

## 适合谁用

- **骑手维权代理团队** — 用 Skill 标准化业务知识，培养新员工 / 实习生
- **AI 应用开发者** — 想做骑手保险 / 法律 SaaS 类产品
- **法律科普 / 自媒体作者** — 内容选题与判例库
- **保险行业研究者** — 理解骑手保险灰色地带

## 核心能力

| 能力 | 调用文件 |
|------|---------|
| 事故类型判断 | `references/accident-types.md` |
| 三类理赔 SOP | `references/sop.md` |
| 收费模型 + 垫付策略 | `references/pricing.md` |
| 6 个核心判例 | `references/cases.md` |
| 保险行业洞察 | `references/insurance.md` |
| 法律依据速查 | `references/legal.md` |
| 抖音评论 20 条模板 | `references/douyin-templates.md` |
| 红线 / 禁忌清单 | `references/taboos.md` |
| 市场数据（脱敏）| `references/market-resources.md` |
| "小安" 客服 Bot Prompt | `prompts/customer-service.md` |
| 内容创作 Bot Prompt | `prompts/content-creator.md` |
| 结构化配置 | `data/skill-config.json` |

## 快速开始

### 一行命令安装（推荐小白用户）

```bash
curl -fsSL https://raw.githubusercontent.com/CzzzzzzJ/zhaofei-rider-claim/main/install.sh | bash
```

脚本会自动 clone 到 `~/.claude/skills/zhaofei-rider-claim/`，已安装则自动更新。

支持环境变量自定义：

```bash
# 装到自定义目录
INSTALL_DIR=/path/to/your/skills curl -fsSL https://raw.githubusercontent.com/CzzzzzzJ/zhaofei-rider-claim/main/install.sh | bash
```

### git clone（推荐开发者）

```bash
git clone https://github.com/CzzzzzzJ/zhaofei-rider-claim.git ~/.claude/skills/zhaofei-rider-claim
```

后续更新：

```bash
cd ~/.claude/skills/zhaofei-rider-claim && git pull
```

### 启用 Skill

安装完成后：
- **Claude Code** — 重启后，输入触发词（如"骑手撞车了怎么办"），Skill 自动激活
- **其他 Agent** — 把 `SKILL.md` 作为 system prompt，`references/` 作为知识库

### 在扣子 / 豆包中使用（开源版）

1. 进入扣子工作流编辑器
2. 创建知识库，上传 `references/` 目录下所有 `.md` 文件
3. 创建智能体，把 `prompts/customer-service.md` 内容粘贴进角色设定
4. 绑定知识库
5. 测试发布

> **审核提示**：扣子/豆包对法律咨询类应用审核较严，建议：
> - 名称避开"理赔""维权"等敏感词，改为"骑手保险知识助手"
> - 角色设定中明确"仅提供信息参考，不替代法律意见"
> - 移除内部合作方真实姓名（已在开源版完成）

### 在 Dify / Cherry Studio / 自建 Agent 中使用

把 `SKILL.md` 内容作为 system prompt，子文件作为知识库片段，按 Progressive Disclosure 加载。

## 目录结构

```
zhaofei-rider-claim/
├── SKILL.md                       # 主入口（必读）
├── README.md                      # 本文件
├── LICENSE                        # MIT
├── CHANGELOG.md                   # 版本日志
├── references/                    # 知识模块（按需加载）
│   ├── accident-types.md
│   ├── sop.md
│   ├── pricing.md
│   ├── cases.md
│   ├── insurance.md
│   ├── legal.md
│   ├── douyin-templates.md
│   ├── taboos.md
│   └── market-resources.md
├── prompts/                       # 角色 Prompt
│   ├── customer-service.md        # 小安客服 Bot
│   └── content-creator.md         # 内容创作 Bot
└── data/
    └── skill-config.json          # 结构化配置
```

## 开源版 vs 内部版

本仓库是 **开源版**，已对以下信息脱敏：
- 律师真实姓名 / 律所 / 联系方式 → 用代号（L-HZ-01）替代
- 合作方真实公司名 → 用代号（P-01）替代
- 飞书 / 内部系统 token / API 凭证 → 全部移除
- 财务结算细则 → 移除

内部完整版仅团队成员可见，包含上述信息 + 派单规则 + 月度数据。

## 风险提示

本 Skill 输出 **不构成法律意见**，仅为信息参考。涉及具体案件，请联系持牌律师。

骑手师傅请记住：
- 出事第一时间留好事故认定书、诊断证明、医疗票据
- 专送 48 小时内通过站长报案
- 工伤个人申请时效 1 年，过期作废
- 不要相信"100% 赔到""加我必赔"等承诺

## 贡献

欢迎提交：
- 新判例（带案号）
- 新陷阱场景
- 平台规则更新（美团 / 饿了么 / 京东等）
- 新地区维权流程差异

提交方式：Issue + PR，或邮件联系仓库维护者。

## 致谢

- **赵飞团队 / 龙虾军团** — 业务沉淀与原始资料
- **麦当 mdldm** — Skill 工程化与开源版打包
- 所有把判例打到底的骑手师傅 — 你们的胜诉就是后来者的武器

## 协议

MIT License — 详见 [LICENSE](LICENSE)。

商用前请阅读 LICENSE 与 `references/taboos.md` 的红线清单。
