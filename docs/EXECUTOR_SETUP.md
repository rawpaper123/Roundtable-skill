# Executor Setup

Roundtable Skill has two separate parts:

1. **Lingtai** is the agent runtime.
2. **The Executor** is the coding terminal the human is currently using.

Roundtable is not a standalone multi-agent runtime. Without Lingtai configured,
this repository is only a set of docs, templates, and install helpers.

For the shortest setup comparison, see [INSTALL_MATRIX.md](INSTALL_MATRIX.md).

## Support Matrix

| Executor | Setup path | What is automatic today | What remains manual |
| --- | --- | --- | --- |
| Codex | Use `scripts/install-roundtable.*` or `scripts/install-codex-skill.*` | Installs the local Codex skill files | Lingtai installation, agent roster, OAuth/login, and task-specific expert assignment |
| Claude Code | Use `scripts/install-roundtable.*` and the protocol prompt | Repo fetch, prompt path, readiness path | Native Claude adapter, Lingtai setup, prompt paste, and Executor discipline |
| Cursor | Use `scripts/install-roundtable.*` and the protocol prompt | Repo fetch, prompt path, readiness path | Native Cursor adapter, Lingtai setup, prompt paste, and Executor discipline |
| Windsurf | Use `scripts/install-roundtable.*` and the protocol prompt | Repo fetch, prompt path, readiness path | Native Windsurf adapter, Lingtai setup, prompt paste, and Executor discipline |
| Kimi Work | Use `scripts/install-roundtable.*` and the protocol prompt | Repo fetch, prompt path, readiness path | Native Kimi Work adapter, Lingtai setup, prompt paste, and Executor discipline |

## Universal Setup

Fetch Roundtable and run the setup wrapper:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-roundtable.ps1"
```

or:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-roundtable.sh"
```

The wrapper installs a native Codex skill when Codex is available. Other
Executors receive the protocol prompt path and readiness check. This is a
portable setup path, not a fake claim that all terminals share one native skill
format.

Then configure Lingtai separately:

- Lingtai repo: <https://github.com/LingTai-AI/lingtai>
- Setup guide: [LINGTAI_SETUP.md](LINGTAI_SETUP.md)

Trigger:

```text
Open Roundtable Skill for this task: <your goal>
```

For a copy/paste Codex workflow, see
[executor-adapter-codex.md](../examples/executor-adapter-codex.md).

For a copy/paste Claude Code workflow, see
[executor-adapter-claude-code.md](../examples/executor-adapter-claude-code.md).

## Other Executors

For Claude Code, Cursor, Windsurf, Kimi Work, or another coding terminal, use
Roundtable as a protocol until executor-specific adapters exist.

Use the generic prompt template:
[roundtable-executor-prompt.md](../templates/executor/roundtable-executor-prompt.md).

For short executor-neutral examples, see
[executor-neutral-terminals.md](../examples/executor-neutral-terminals.md).

Paste a prompt like this into the terminal:

```text
Use Roundtable Skill / Roundtable protocol for this task.

Lingtai is the required agent runtime. Do not claim real multi-agent execution
unless Lingtai agents are configured and reachable.

You are the Executor. You own scope, implementation, verification, Git/PR state,
deployment when requested, final reporting, and rollback.

Assign dynamic expert angles to available Lingtai agents. If an expert has no
actionable concern, they must still reply: "No opinion from my expert
perspective."

Use bounded waits. If an agent does not respond, record it, attempt one safe
liveness/delivery repair, then continue if still unavailable.

Goal:
<your goal>
```

## Required Runtime Boundary

Do not present these states as equivalent:

- **Ready:** Lingtai is installed, configured, and agents can reply.
- **Docs-only:** Lingtai is not configured. You can still read the protocol and
  templates, but Roundtable is not operational.

The Executor can change from project to project. The Lingtai runtime requirement
does not change.

## Related Docs

- [EXECUTOR_CONTRACT.md](EXECUTOR_CONTRACT.md)
- [LINGTAI_SETUP.md](LINGTAI_SETUP.md)
- [ROUNDTABLE_PROTOCOL.md](ROUNDTABLE_PROTOCOL.md)
