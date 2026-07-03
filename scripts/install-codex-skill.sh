#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
src="$repo_root/skills/codex/roundtable-skill"
codex_home="${CODEX_HOME:-$HOME/.codex}"
dest="$codex_home/skills/roundtable-skill"

test -d "$src" || { echo "missing source skill: $src" >&2; exit 1; }
mkdir -p "$(dirname "$dest")"

if [ -e "$dest" ]; then
  backup="$dest.bak-$(date +%Y%m%d%H%M%S)"
  mv "$dest" "$backup"
  echo "backup: $backup"
fi

cp -R "$src" "$dest"
echo "installed: $dest"
echo "note: Lingtai must be installed and configured separately."
echo "next: ask Codex to 'Open Roundtable Skill for this task: <goal>'"
