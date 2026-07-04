#!/usr/bin/env bash
set -euo pipefail

executor="${1:-auto}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

echo "Roundtable Skill setup"
echo "Repo: $repo_root"

codex_available=0
if command -v codex >/dev/null 2>&1; then
  codex_available=1
fi

if [[ "$executor" == "codex" || ( "$executor" == "auto" && "$codex_available" == "1" ) ]]; then
  echo "Detected Codex path. Installing native Codex skill..."
  "$script_dir/install-codex-skill.sh"
  echo "Codex skill install: complete"
else
  echo "Native Codex install: skipped"
fi

cat <<EOF

Next:
1. Configure Lingtai in your target project.
2. Run the readiness check from that project:
   $repo_root/scripts/check-roundtable.sh --require-lingtai
3. If your Executor is not Codex, paste this protocol prompt into it:
   $repo_root/templates/executor/roundtable-executor-prompt.md

Do not claim a real Roundtable run until Lingtai agents are reachable.
EOF
