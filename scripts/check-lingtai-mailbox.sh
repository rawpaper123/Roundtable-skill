#!/usr/bin/env bash
set -euo pipefail

root="${1:-.}"
root="$(cd "$root" && pwd)"
lingtai="$root/.lingtai"

count_dirs() {
  [[ -d "$1" ]] || { echo 0; return; }
  find "$1" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' '
}

oldest_age_minutes() {
  [[ -d "$1" ]] || return
  oldest="$(find "$1" -mindepth 1 -maxdepth 1 -type d -printf '%T@ %p\n' 2>/dev/null | sort -n | head -n 1 | awk '{print $1}')"
  [[ -n "${oldest:-}" ]] || return
  awk -v now="$(date +%s)" -v then="$oldest" 'BEGIN { printf "%.1f", (now - then) / 60 }'
}

echo "Roundtable mailbox"
echo "repo: $root"

if [[ ! -d "$lingtai" ]]; then
  echo "dot_lingtai: false"
  echo "status: not_configured"
  echo "note: no .lingtai directory; mailbox delivery cannot run here."
  exit 0
fi

mailbox="$lingtai/human/mailbox"
outbox="$mailbox/outbox"
sent="$mailbox/sent"
inbox="$mailbox/inbox"

outbox_count="$(count_dirs "$outbox")"
sent_count="$(count_dirs "$sent")"
inbox_count="$(count_dirs "$inbox")"
oldest_outbox_age="$(oldest_age_minutes "$outbox")"

orchestrator=""
orchestrator_dir=""
while IFS= read -r agent_file; do
  if grep -Eq '"(karma|nirvana)"[[:space:]]*:[[:space:]]*true' "$agent_file"; then
    orchestrator_dir="$(dirname "$agent_file")"
    orchestrator="$(grep -m1 '"agent_name"' "$agent_file" | sed -E 's/.*"agent_name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
    [[ -n "$orchestrator" ]] || orchestrator="$(basename "$orchestrator_dir")"
    break
  fi
done < <(find "$lingtai" -name .agent.json 2>/dev/null)

orchestrator_state=""
heartbeat_age=""
if [[ -n "$orchestrator_dir" ]]; then
  if [[ -f "$orchestrator_dir/.status.json" ]]; then
    orchestrator_state="$(grep -m1 '"state"' "$orchestrator_dir/.status.json" | sed -E 's/.*"state"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/' || true)"
  fi
  if [[ -f "$orchestrator_dir/.agent.heartbeat" ]]; then
    heartbeat="$(cat "$orchestrator_dir/.agent.heartbeat")"
    heartbeat_age="$(awk -v now="$(date +%s)" -v hb="$heartbeat" 'BEGIN { age = now - hb; if (age < 0) age = 0; printf "%.1f", age }')"
  fi
fi

if [[ ! -d "$mailbox" ]]; then
  status="missing_human_mailbox"
elif [[ -z "$orchestrator_dir" ]]; then
  status="missing_orchestrator"
elif [[ "$outbox_count" -gt 0 ]]; then
  status="queued_outbox"
else
  status="clear"
fi

echo "dot_lingtai: true"
echo "human_mailbox: $([[ -d "$mailbox" ]] && echo true || echo false)"
echo "outbox_queued: $outbox_count"
echo "oldest_outbox_age_minutes: $oldest_outbox_age"
echo "sent_total: $sent_count"
echo "inbox_total: $inbox_count"
echo "orchestrator: $orchestrator"
echo "orchestrator_state: $orchestrator_state"
echo "orchestrator_heartbeat_age_seconds: $heartbeat_age"
echo "status: $status"

if [[ "$status" == "queued_outbox" ]]; then
  echo "note: queued outbox means the orchestrator has not claimed human mail yet."
  echo "note: check state/heartbeat, wake or restart once, then record non-response."
fi
