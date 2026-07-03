# Example: Codex As Executor

Use this when Codex is the coding terminal that owns implementation, checks,
Git state, pull requests, deployment steps, and rollback.

## 1. Install The Codex Skill

Use [QUICKSTART.md](../QUICKSTART.md).

This installs only the Codex skill files. It does not install Lingtai or create
agents.

## 2. Check The Target Project

PowerShell:

```powershell
C:\path\to\Roundtable-skill\scripts\check-roundtable.ps1 -RequireLingtai
```

Bash:

```bash
/path/to/Roundtable-skill/scripts/check-roundtable.sh --require-lingtai
```

If this fails, Codex can still read the protocol, docs, and templates, but it
must not claim operational Roundtable execution.

## 3. Prompt Codex

```text
Open Roundtable Skill for this task:
<your goal>

Assign expert angles:
- runtime/release reliability
- security/privacy
- adversarial scope review

If an expert has no actionable concern, they must reply no opinion.

Codex is the Executor. It owns implementation, validation, Git/PR state, and rollback.
Lingtai agents advise only.
```

## 4. Expected Codex Behavior

Codex should:

- inspect the actual repo state,
- send bounded requests to available Lingtai agents,
- record replies and non-responses,
- synthesize must-fix, nice-to-have, and rejected advice,
- implement only the smallest in-scope diff,
- run relevant checks,
- report Git state and rollback.

## 5. Docs-Only Fallback

If the target project has no `.lingtai/` directory or no reachable agents, say so
clearly:

```text
Roundtable is not operational in this project yet. I can use the docs and templates, but real expert-panel execution requires Lingtai plus at least one agent.
```

Do not fake agent replies.

## Related

- [Executor setup](../docs/EXECUTOR_SETUP.md)
- [Agent roster guide](../docs/AGENT_ROSTER_GUIDE.md)
- [Roundtable protocol](../docs/ROUNDTABLE_PROTOCOL.md)
