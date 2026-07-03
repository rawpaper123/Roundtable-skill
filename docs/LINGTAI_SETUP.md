# Lingtai Setup

Roundtable Skill uses Lingtai as the multi-agent transport/runtime.

Lingtai is not bundled in this repository.

Repository:

<https://github.com/LingTai-AI/lingtai>

## Readiness Model

Roundtable is ready for use when:

- a Lingtai runtime is installed,
- the target project has a `.lingtai/` directory,
- at least one real agent exists,
- the agent has a mailbox,
- the agent can receive and reply to a Roundtable request.

At least one agent is required. There is no maximum.

## Recommended Agent Types

Assign roles per task, not permanently.

Useful directions:

- runtime/release reliability
- product trust
- security/privacy
- data integrity
- frontend UX
- backend/API contract
- docs/runbook clarity
- adversarial reviewer

Agent names in this repository are placeholders. Use your actual local agent
names when creating a roster or sending requests.

## Do Not Commit

Never commit Lingtai runtime state:

- `.lingtai/`
- mailbox contents
- agent logs
- OAuth tokens
- auth JSON files
- secrets

## Readiness Check

PowerShell:

```powershell
.\scripts\check-roundtable.ps1
```

Bash:

```bash
./scripts/check-roundtable.sh
```

The check script reports whether Lingtai appears installed, whether the current
directory has `.lingtai/`, and how many agent manifests are present.

It does not install Lingtai or create agents automatically. Installation and
OAuth should stay explicit.
