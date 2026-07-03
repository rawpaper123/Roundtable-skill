# Example: Claude Code As Executor

Use this when Claude Code is the coding terminal that owns implementation,
checks, Git state, pull requests, deployment steps, and rollback.

Roundtable still requires Lingtai as the agent runtime. Claude Code is the
Executor, not a replacement for Lingtai.

## 1. Check The Target Project

PowerShell:

```powershell
C:\path\to\Roundtable-skill\scripts\check-roundtable.ps1 -RequireLingtai
```

Bash:

```bash
/path/to/Roundtable-skill/scripts/check-roundtable.sh --require-lingtai
```

If this fails, Claude Code can still follow the protocol docs, but it must not
claim real Roundtable execution.

## 2. Prompt Claude Code

```text
Use the Roundtable protocol for this task:
<your goal>

Lingtai is the required agent runtime. Do not claim real multi-agent execution unless Lingtai agents are configured and reachable.

Assign expert angles:
- runtime/release reliability
- security/privacy
- adversarial scope review

If an expert has no actionable concern, they must reply no opinion.

Claude Code is the Executor. It owns implementation, validation, Git/PR state, and rollback.
Lingtai agents advise only.
```

## 3. Expected Claude Code Behavior

Claude Code should:

- inspect the actual repo state,
- send bounded requests to available Lingtai agents,
- record replies and non-responses,
- synthesize must-fix, nice-to-have, and rejected advice,
- implement only the smallest in-scope diff,
- run relevant checks,
- report Git state and rollback.

## 4. Docs-Only Fallback

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
