# Quickstart

Goal: fetch Roundtable, choose your Executor path, verify Lingtai, and run your
first Roundtable in about 5 minutes.

## 0. 60-Second Fit Check

Before installing or running anything, answer:

1. Is this task risky enough that independent expert advice would help?
2. Is Lingtai configured, or are you ready to configure it before claiming a
   real expert-panel run?
3. Is one Executor ready to own the final decision, validation, and rollback?

If any answer is "no", do not force Roundtable. Use the docs as a reference,
or come back when the task has enough release, security, data, architecture, or
user-trust risk to justify the loop.

## 1. Install Or Fetch The Roundtable Pack

Run the universal setup command first. It installs the native Codex skill when
Codex is available. For Claude Code, Cursor, Windsurf, Kimi Work, and other
coding agents, it prints the executor-neutral prompt and readiness path.

PowerShell:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-roundtable.ps1"
```

Bash:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-roundtable.sh"
```

If you already cloned this repository, run the local installer instead:

```powershell
.\scripts\install-roundtable.ps1
```

```bash
./scripts/install-roundtable.sh
```

There is no universal native skill format across all coding agents yet.
Roundtable therefore provides:

- a native Codex skill installer,
- an executor-neutral protocol prompt for other agents,
- Lingtai readiness checks shared by every Executor.

For Executor-specific notes, use:

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

If the check reports `docs_only`:

- do not run a fake Roundtable,
- open [docs/LINGTAI_SETUP.md](docs/LINGTAI_SETUP.md),
- configure Lingtai and at least one agent in the target project,
- rerun the readiness check from that target project root.

If messages queue or agents stay silent after setup, use
[docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md).

If you only have one agent, start there. See
[docs/AGENT_ROSTER_GUIDE.md](docs/AGENT_ROSTER_GUIDE.md) for how to grow from
one agent to a three-agent review panel.

## 3. Ask Your Executor

```text
Use Roundtable Skill / Roundtable protocol for this task:
review this one-line change before I ship it.

Executor is the coding terminal I am using now.
Lingtai agents advise; the Executor owns implementation, verification, Git, and rollback.

Assign expert angles:
- user/trust voice: what would feel wrong to the user
- evidence voice: what checks or facts prove this is safe
- adversarial scope voice: what should be rejected as unnecessary

If an expert has no actionable concern, they must reply no opinion.
```

You should see Lingtai expert replies, Executor synthesis, validation, and
rollback.

For executor-specific examples, use:

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
