# First Run Checklist

Use this after [QUICKSTART.md](../QUICKSTART.md) to decide whether Roundtable is
actually ready, only in docs-only mode, or blocked.

## 1. Pick The Target Project

Run readiness checks from the project where you want Roundtable experts to
review work, not from this repository unless this repository is the target.

PowerShell:

```powershell
cd C:\path\to\your-project
C:\path\to\Roundtable-skill\scripts\check-roundtable.ps1 -RequireLingtai
```

Bash:

```bash
cd /path/to/your-project
/path/to/Roundtable-skill/scripts/check-roundtable.sh --require-lingtai
```

## 2. Ready State

You are ready for a real Roundtable run when the check reports:

```text
lingtai_cli: True
dot_lingtai: True
agent_manifests: 1
mode: operational_candidate
```

`agent_manifests` can be more than `1`. Start with one agent if that is all you
have.

## 3. Docs-Only State

If the check reports `mode: docs_only`, do not fake expert replies.

You can still use:

- [ROUNDTABLE_PROTOCOL.md](ROUNDTABLE_PROTOCOL.md)
- [EXECUTOR_SETUP.md](EXECUTOR_SETUP.md)
- [../templates/executor/roundtable-executor-prompt.md](../templates/executor/roundtable-executor-prompt.md)

But a real expert panel requires Lingtai, `.lingtai/`, and at least one agent.

## 4. First Good Task

Use a low-risk but real task:

```text
Open Roundtable Skill for this task:
review this small PR before I merge it.

Assign expert angles:
- release reliability
- security/privacy
- adversarial scope review

If an expert has no actionable concern, they must reply no opinion.
```

Avoid using the first run for production deploys, migrations, secrets, or data
deletion.

## 5. Successful Output Shape

A good first run includes:

- agents asked and assigned expert angles,
- replies or bounded non-response notes,
- one safe repair attempt for silent agents,
- Executor synthesis,
- accepted advice,
- rejected scope-expanding advice,
- validation commands and results,
- Git state,
- rollback.

## 6. Stop And Fix If

Stop before claiming Roundtable is operational if:

- Lingtai CLI is missing,
- `.lingtai/` is missing in the target project,
- no agent manifests are found,
- all agents are silent after one bounded repair,
- the Executor invents agent replies,
- the report has no validation,
- the report has no rollback.

Use [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for the next fix.
