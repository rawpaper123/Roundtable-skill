# Install Matrix

Use this to decide which setup path matches your coding terminal.

Roundtable Skill has two parts:

1. **Lingtai** is the required expert-agent runtime.
2. **The Executor** is your coding terminal.

This repository does not bundle Lingtai and does not create agents
automatically.

## Matrix

| Executor | Best setup path | Automatic today | Still manual |
| --- | --- | --- | --- |
| Codex | Install the Codex skill with `scripts/install-codex-skill.*` | Codex skill files | Lingtai install, OAuth/login, agent roster, expert assignment |
| Claude Code | Use the generic prompt or Claude adapter | Nothing executor-specific | Lingtai setup, prompt paste, Executor discipline |
| Cursor | Use the generic prompt template | Nothing executor-specific | Lingtai setup, prompt paste, Executor discipline |
| Windsurf | Use the generic prompt template | Nothing executor-specific | Lingtai setup, prompt paste, Executor discipline |
| Kimi Work | Use the generic prompt template | Nothing executor-specific | Lingtai setup, prompt paste, Executor discipline |
| Other coding terminal | Use the generic prompt template | Nothing executor-specific | Lingtai setup, prompt paste, Executor discipline |

## Codex Fast Path

PowerShell:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-codex-skill.ps1"
```

Bash:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-codex-skill.sh"
```

## Non-Codex Fast Path

Copy the generic Executor prompt into your coding terminal:

- [roundtable-executor-prompt.md](../templates/executor/roundtable-executor-prompt.md)

Then verify Lingtai in the target project:

```text
mode: operational_candidate
```

If the target project reports `docs_only`, do not claim a real expert-panel run.

## Next Step

- First install path: [QUICKSTART.md](../QUICKSTART.md)
- Runtime setup: [LINGTAI_SETUP.md](LINGTAI_SETUP.md)
- Executor contract: [EXECUTOR_SETUP.md](EXECUTOR_SETUP.md)
- Pass/fail check: [FIRST_RUN_CHECKLIST.md](FIRST_RUN_CHECKLIST.md)
