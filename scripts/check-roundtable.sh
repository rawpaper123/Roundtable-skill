#!/usr/bin/env bash
set -euo pipefail

require_lingtai=false
if [[ "${1:-}" == "--require-lingtai" ]]; then
  require_lingtai=true
fi

has_cmd() {
  command -v "$1" >/dev/null 2>&1
}

repo="$(pwd)"
has_git=false
has_lingtai=false
has_dot_lingtai=false
has_skill=false

has_cmd git && has_git=true
has_cmd lingtai && has_lingtai=true
[[ -d ".lingtai" ]] && has_dot_lingtai=true
[[ -f "skills/codex/roundtable-skill/SKILL.md" ]] && has_skill=true

agent_count=0
if [[ -d ".lingtai" ]]; then
  agent_count="$(find .lingtai -name .agent.json 2>/dev/null | wc -l | tr -d ' ')"
fi

echo "Roundtable readiness"
echo "repo: $repo"
echo "git: $has_git"
echo "lingtai_cli: $has_lingtai"
echo "dot_lingtai: $has_dot_lingtai"
echo "agent_manifests: $agent_count"
echo "codex_skill_present: $has_skill"

if [[ "$require_lingtai" == "true" ]]; then
  if [[ "$has_lingtai" != "true" || "$has_dot_lingtai" != "true" || "$agent_count" -lt 1 ]]; then
    echo "Lingtai is required but not ready. Install/configure Lingtai and create at least one agent." >&2
    exit 1
  fi
fi

if [[ "$has_lingtai" != "true" ]]; then
  echo "note: install Lingtai separately: https://github.com/LingTai-AI/lingtai"
fi
