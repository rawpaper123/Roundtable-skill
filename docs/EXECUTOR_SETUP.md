# Executor Setup

Roundtable Skill has two separate parts:

1. **Lingtai** is the agent runtime.
2. **The Executor** is the coding terminal the human is currently using.

Roundtable is not a standalone multi-agent runtime. Without Lingtai configured,
this repository is only a set of docs, templates, and install helpers.

## Support Matrix

| Executor | Setup path | What is automatic today | What remains manual |
| --- | --- | --- | --- |
| Codex | Use `scripts/install-codex-skill.*` | Installs the local Codex skill files | Lingtai installation, agent roster, OAuth/login, and task-specific expert assignment |
| Claude Code | Use the protocol docs and prompt template | Nothing repo-specific yet | Copy the Roundtable prompt, connect to an existing Lingtai setup, and keep Claude Code as Executor |
| Cursor | Use the protocol docs and prompt template | Nothing repo-specific yet | Copy the Roundtable prompt, connect to an existing Lingtai setup, and keep Cursor as Executor |
| Windsurf | Use the protocol docs and prompt template | Nothing repo-specific yet | Copy the Roundtable prompt, connect to an existing Lingtai setup, and keep Windsurf as Executor |
| Kimi Work | Use the protocol docs and prompt template | Nothing repo-specific yet | Copy the Roundtable prompt, connect to an existing Lingtai setup, and keep Kimi Work as Executor |

## Codex Setup

Install the Codex skill from GitHub:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-codex-skill.ps1"
```

or:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-codex-skill.sh"
```

Then configure Lingtai separately:

- Lingtai repo: <https://github.com/LingTai-AI/lingtai>
- Setup guide: [LINGTAI_SETUP.md](LINGTAI_SETUP.md)

Trigger:

```text
Open Roundtable Skill for this task: <your goal>
```

For a copy/paste Codex workflow, see
[executor-adapter-codex.md](../examples/executor-adapter-codex.md).

## Other Executors

For Claude Code, Cursor, Windsurf, Kimi Work, or another coding terminal, use
Roundtable as a protocol until executor-specific adapters exist.

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
