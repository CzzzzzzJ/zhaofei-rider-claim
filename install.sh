#!/usr/bin/env bash
#
# zhaofei-rider-claim · 一键安装脚本
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/CzzzzzzJ/zhaofei-rider-claim/main/install.sh | bash
#
# 环境变量:
#   INSTALL_DIR  自定义安装目录 (默认: ~/.claude/skills/zhaofei-rider-claim)
#   REPO_URL     自定义仓库地址 (默认: 官方仓库)
#   BRANCH       自定义分支 (默认: main)

set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/CzzzzzzJ/zhaofei-rider-claim.git}"
BRANCH="${BRANCH:-main}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.claude/skills/zhaofei-rider-claim}"

color_green() { printf "\033[32m%s\033[0m\n" "$1"; }
color_yellow() { printf "\033[33m%s\033[0m\n" "$1"; }
color_red() { printf "\033[31m%s\033[0m\n" "$1" >&2; }

if ! command -v git >/dev/null 2>&1; then
    color_red "[error] 未检测到 git, 请先安装 git 后重试"
    exit 1
fi

mkdir -p "$(dirname "$INSTALL_DIR")"

if [[ -d "$INSTALL_DIR/.git" ]]; then
    color_yellow "[info] 检测到已安装, 执行更新..."
    git -C "$INSTALL_DIR" fetch origin "$BRANCH"
    git -C "$INSTALL_DIR" reset --hard "origin/$BRANCH"
elif [[ -e "$INSTALL_DIR" ]]; then
    color_red "[error] 目标目录已存在但不是 git 仓库: $INSTALL_DIR"
    color_red "        请手动备份/删除后重试, 或设置 INSTALL_DIR 环境变量指向其他位置"
    exit 1
else
    color_yellow "[info] 克隆 Skill 到 $INSTALL_DIR ..."
    git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$INSTALL_DIR"
fi

color_green ""
color_green "============================================================"
color_green "  zhaofei-rider-claim 安装成功"
color_green "  路径: $INSTALL_DIR"
color_green "============================================================"
echo ""
echo "下一步:"
echo "  1. Claude Code 用户 - 重启 Claude Code, 输入触发词激活 Skill"
echo "     (例如: '骑手撞车了怎么办' / '外卖工伤怎么赔')"
echo ""
echo "  2. 其他 Agent 用户 - 把 SKILL.md 内容作为 system prompt"
echo "     把 references/ 子文件作为知识库片段"
echo ""
echo "  3. 升级: 重新执行 install.sh, 或在安装目录执行 git pull"
echo ""
echo "  仓库: $REPO_URL"
echo "  问题反馈: ${REPO_URL%.git}/issues"
echo ""
