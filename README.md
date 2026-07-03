# Roundtable Skill 🪑

[中文](README.zh-CN.md) | English

[![GitHub stars](https://img.shields.io/github/stars/rawpaper123/Roundtable-skill?style=social)](https://github.com/rawpaper123/Roundtable-skill/stargazers)
[![Docs](https://github.com/rawpaper123/Roundtable-skill/actions/workflows/docs.yml/badge.svg)](https://github.com/rawpaper123/Roundtable-skill/actions/workflows/docs.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-black.svg)](LICENSE)
[![Lingtai required](https://img.shields.io/badge/Lingtai-required-black.svg)](https://github.com/LingTai-AI/lingtai)
[![Executor neutral](https://img.shields.io/badge/executor-neutral-black.svg)](docs/EXECUTOR_SETUP.md)
[![Codex skill](https://img.shields.io/badge/Codex-skill-black.svg)](skills/codex/roundtable-skill/SKILL.md)

Bring Lingtai-powered expert review into your coding terminal, with one
Executor accountable for scope, checks, and rollback.

**10-second pitch:** use Roundtable when a risky change needs independent expert
advice, strict scope control, real checks, and a rollback-ready report, without
handing repo ownership to autonomous agents.

![Roundtable Skill terminal preview](assets/roundtable-terminal-demo.svg)

**New here? Start with [QUICKSTART.md](QUICKSTART.md).**

[Install](#install-as-a-codex-skill) · [Quickstart](QUICKSTART.md) ·
[Demo script](docs/DEMO_SCRIPT.md) · [Demo](examples/sanitized-roundtable-run.md) ·
[Why Roundtable?](docs/WHY_ROUNDTABLE.md) · [Comparison](docs/COMPARISON.md) ·
[Showcase](docs/SHOWCASE.md) · [Adoption](docs/ADOPTION.md) ·
[Use cases](docs/USE_CASES.md) · [Executor setup](docs/EXECUTOR_SETUP.md) ·
[Agent roster](docs/AGENT_ROSTER_GUIDE.md) · [Roadmap](docs/ROADMAP.md) ·
[Troubleshooting](docs/TROUBLESHOOTING.md) · [FAQ](docs/FAQ.md) ·
[Security](SECURITY.md) · [Launch checklist](docs/GITHUB_LAUNCH_CHECKLIST.md) ·
[Release notes](CHANGELOG.md) ·
[Contributing](CONTRIBUTING.md)

Roundtable Skill is an executor-neutral workflow for shipping agentic coding
changes with discipline: task-specific Lingtai experts advise, while your
current coding terminal owns the final plan, implementation, verification, Git,
deployment, and rollback.

The current coding terminal is the **Executor**. It can be Codex, Claude Code,
Kimi Work, Cursor, Windsurf, or another agentic terminal. The Executor owns the
final implementation, verification, Git state, pull request, deployment, and
rollback. Roundtable agents advise; they do not override the user or the
Executor.

Roundtable Skill is built on
[Lingtai](https://github.com/LingTai-AI/lingtai) as the agent runtime. This
repository does not bundle Lingtai. Without Lingtai configured, this repository
only provides readable docs and templates; it cannot run a working multi-agent
Roundtable.

## Why Use It?

Most agentic coding failures are not syntax failures. They are coordination
failures:

- the planner expands scope,
- the reviewer invents concerns,
- the executor ships without verifying production reality,
- one silent agent blocks the whole loop,
- nobody owns rollback.

Roundtable Skill fixes that with a small protocol:

- 🧭 **Dynamic expert roles** - pick the right reviewers for this task, not fixed personas forever.
- 🧑‍⚖️ **Executor as final arbiter** - experts advise, your coding terminal decides and ships.
- ✅ **No-opinion rule** - experts can say "no concerns" instead of inventing work.
- ⏱️ **Bounded waiting** - no infinite agent loops.
- 🛠️ **Repair silent agents once** - check delivery/liveness, wake once, then continue.
- 🔒 **No secrets by design** - runtime state and tokens stay out of the repo.
- 🔁 **Rollback-first delivery** - every serious change ends with validation and rollback.

## Why Switch From A Normal Prompt?

A normal prompt asks one model to be planner, critic, implementer, and release
manager at the same time. That works for small tasks, then gets messy.

Roundtable makes the loop explicit:

```text
User goal -> expert panel -> executor synthesis -> implementation -> verification -> rollback-ready report
```

It is simple because it keeps the protocol small and leaves execution in your
coding terminal. It is effective because Lingtai provides the agent network and
Roundtable forces every participant to stay in a role.

## See It In 30 Seconds

The loop should feel concrete:

```text
User goal -> Lingtai experts -> Executor synthesis -> smallest safe diff -> checks -> rollback
```

```text
Security/privacy expert: add a negative auth smoke before merge.
Release expert: No opinion from my expert perspective.
Scope reviewer: reject the login redesign; it is out of scope.

Executor:
accepted: negative auth smoke
rejected: login redesign
verified: tests pass, diff scoped, rollback ready
```

If an agent is silent, Roundtable diagnoses delivery instead of waiting forever:

```text
$ ./scripts/check-lingtai-mailbox.sh
status: queued_outbox
orchestrator_state: asleep
```

Read the full sanitized examples:

- [examples/terminal-transcript.md](examples/terminal-transcript.md)
- [examples/sanitized-roundtable-run.md](examples/sanitized-roundtable-run.md)
- [examples/agent-roster-growth.md](examples/agent-roster-growth.md)
- [examples/executor-adapter-codex.md](examples/executor-adapter-codex.md)
- [examples/executor-adapter-claude-code.md](examples/executor-adapter-claude-code.md)

## What It Does

- Assigns task-specific expert angles to configured Lingtai agents.
- Requests concise planner or review feedback.
- Requires no-opinion replies instead of invented suggestions.
- Uses bounded waits and one bounded repair attempt for non-responsive agents.
- Keeps the Executor as final arbiter and implementation owner.
- Protects scope, secrets, Git hygiene, and rollback discipline.

## Install As A Codex Skill

Fast path from GitHub:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-codex-skill.ps1"
```

or:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-codex-skill.sh"
```

From a local checkout:

```powershell
.\scripts\install-codex-skill.ps1
```

or:

```bash
./scripts/install-codex-skill.sh
```

This only installs the Codex skill files. Lingtai is still required and must be
installed/configured separately.

Then ask:

```text
Open Roundtable Skill for this task: <your goal>
```

or:

```text
Use Roundtable Skill. Assign dynamic expert angles. If an expert has no concern, they must reply no opinion.
```

## Best First Use Case

Use it when a task is too important for a single-agent monologue:

- release gates
- production debugging
- database or auth changes
- architecture slices
- public launch readiness
- security/privacy review
- product flows where user trust matters

## Lingtai Setup

Roundtable Skill requires Lingtai for real expert-panel execution. It does not
bundle Lingtai. Install and configure Lingtai separately:

- Lingtai GitHub: <https://github.com/LingTai-AI/lingtai>
- Setup guide: [docs/LINGTAI_SETUP.md](docs/LINGTAI_SETUP.md)

Check local readiness:

```powershell
.\scripts\check-roundtable.ps1
```

or:

```bash
./scripts/check-roundtable.sh
```

## Repository Layout

```text
docs/
  SHOWCASE.md
  DEMO_SCRIPT.md
  COMPARISON.md
  ADOPTION.md
  USE_CASES.md
  AGENT_ROSTER_GUIDE.md
  TROUBLESHOOTING.md
  FAQ.md
  MAINTAINER_RELEASE.md
  PUBLIC_RELEASE_CHECKLIST.md
  GITHUB_LAUNCH_CHECKLIST.md
  EXECUTOR_SETUP.md
  EXECUTOR_CONTRACT.md
  LINGTAI_SETUP.md
  ROUNDTABLE_PROTOCOL.md
  WHY_ROUNDTABLE.md
  ROADMAP.md
CHANGELOG.md
CONTRIBUTING.md
QUICKSTART.md
assets/
  roundtable-terminal-demo.svg
skills/
  codex/roundtable-skill/SKILL.md
templates/
  executor/roundtable-executor-prompt.md
  lingtai/agent-roster.example.md
  lingtai/request-template.md
  lingtai/roundtable-agent-template.md
scripts/
  install-codex-skill.ps1
  install-codex-skill.sh
  check-roundtable.ps1
  check-roundtable.sh
  check-lingtai-mailbox.ps1
  check-lingtai-mailbox.sh
examples/
  terminal-transcript.md
  sanitized-roundtable-run.md
  agent-roster-growth.md
  executor-adapter-codex.md
  executor-adapter-claude-code.md
  generic-product-goal.md
  release-gate-goal.md
```

## Core Rule

If an expert has no actionable concern, it must still reply:

```text
No opinion from my expert perspective.
```

Silence is treated as a runtime issue: record it, attempt one bounded safe
repair, then continue if the agent remains unavailable.

## Safety

Do not commit:

- `.lingtai/`
- mailbox files
- OAuth tokens
- `codex-auth.json`
- private keys
- logs
- project secrets
- runtime data

## License

MIT
