# Quickstart

Goal: choose your Executor path, verify Lingtai, and run your first Roundtable
in about 5 minutes.

## 1. Choose Your Executor Path

If your Executor is Codex, install the Codex skill.

PowerShell:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-codex-skill.ps1"
```

Bash:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-codex-skill.sh"
```

This only installs the Codex skill files. Lingtai is still required.

If you already cloned this repository, run the local installer instead:

```powershell
.\scripts\install-codex-skill.ps1
```

```bash
./scripts/install-codex-skill.sh
```

If your Executor is Claude Code, Cursor, Windsurf, Kimi Work, or another coding
terminal, skip the Codex installer and use:

- [docs/INSTALL_MATRIX.md](docs/INSTALL_MATRIX.md)
- [docs/EXECUTOR_SETUP.md](docs/EXECUTOR_SETUP.md)
- [templates/executor/roundtable-executor-prompt.md](templates/executor/roundtable-executor-prompt.md)
- [examples/executor-neutral-terminals.md](examples/executor-neutral-terminals.md)

## 2. Verify Lingtai In Your Target Project

```powershell
cd C:\path\to\your-project
C:\path\to\Roundtable-skill\scripts\check-roundtable.ps1 -RequireLingtai
```

or:

```bash
cd /path/to/your-project
/path/to/Roundtable-skill/scripts/check-roundtable.sh --require-lingtai
```

Expected: `lingtai_cli: true`, `dot_lingtai: true`, and `agent_manifests: 1`
or more.

If you only have one agent, start there. See
[docs/AGENT_ROSTER_GUIDE.md](docs/AGENT_ROSTER_GUIDE.md) for how to grow from
one agent to a three-agent review panel.

## 3. Ask Codex

```text
Open Roundtable Skill for this task:
review this one-line change before I ship it.

Assign expert angles:
- product trust
- security/privacy
- adversarial scope review

If an expert has no actionable concern, they must reply no opinion.
```

You should see Lingtai expert replies, Executor synthesis, validation, and
rollback.

For non-Codex Executors, use the same contract:

- [docs/EXECUTOR_SETUP.md](docs/EXECUTOR_SETUP.md)
- [templates/executor/roundtable-executor-prompt.md](templates/executor/roundtable-executor-prompt.md)
- [examples/executor-adapter-claude-code.md](examples/executor-adapter-claude-code.md)

If setup does not match the expected shape, use
[docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md).

For a pass/fail checklist after your first run, use
[docs/FIRST_RUN_CHECKLIST.md](docs/FIRST_RUN_CHECKLIST.md).

## 4. Expected Shape

The first successful run should include:

- which Lingtai agents were asked,
- each agent's expert angle,
- replies or bounded non-response notes,
- Executor synthesis,
- accepted and rejected advice,
- validation,
- rollback.

中文：这个流程只安装 Codex skill。Roundtable 真正运行仍然需要 Lingtai、`.lingtai/`
和至少一个 agent。
