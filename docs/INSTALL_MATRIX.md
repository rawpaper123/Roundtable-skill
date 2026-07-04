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
| Codex | Run `scripts/install-roundtable.*` or `scripts/install-codex-skill.*` | Codex skill files | Lingtai install, OAuth/login, agent roster, expert assignment |
| Claude Code | Run `scripts/install-roundtable.*`, then use the generic prompt or Claude adapter | Repo fetch, prompt path, readiness path | Native Claude adapter, Lingtai setup, prompt paste, Executor discipline |
| Cursor | Run `scripts/install-roundtable.*`, then use the generic prompt template | Repo fetch, prompt path, readiness path | Native Cursor adapter, Lingtai setup, prompt paste, Executor discipline |
| Windsurf | Run `scripts/install-roundtable.*`, then use the generic prompt template | Repo fetch, prompt path, readiness path | Native Windsurf adapter, Lingtai setup, prompt paste, Executor discipline |
| Kimi Work | Run `scripts/install-roundtable.*`, then use the generic prompt template | Repo fetch, prompt path, readiness path | Native Kimi Work adapter, Lingtai setup, prompt paste, Executor discipline |
| Other coding terminal | Run `scripts/install-roundtable.*`, then use the generic prompt template | Repo fetch, prompt path, readiness path | Native adapter if that terminal has one, Lingtai setup, prompt paste, Executor discipline |

## Universal Fast Path

PowerShell:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-roundtable.ps1"
```

Bash:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-roundtable.sh"
```

This command does not pretend all coding agents share the same native skill
format. It installs the native Codex skill when available and gives every other
Executor the protocol prompt and readiness path.

## Non-Codex Path

Copy the generic Executor prompt into your coding terminal:

- [roundtable-executor-prompt.md](../templates/executor/roundtable-executor-prompt.md)
- [executor-neutral-terminals.md](../examples/executor-neutral-terminals.md)

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
