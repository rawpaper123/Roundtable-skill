# Contributing

Thanks for improving Roundtable Skill.

## Good Contributions

- clearer quickstart steps
- better executor examples
- safer Lingtai setup notes
- sanitized Roundtable run examples
- bug reports for install/readiness scripts
- docs that make the first run faster

## Keep The Boundary

Roundtable Skill is built on Lingtai. Do not position it as a working
multi-agent system without Lingtai configured.

Do not commit:

- `.lingtai/`
- mailbox files
- OAuth tokens
- `codex-auth.json`
- private keys
- logs
- local runtime data

## Before Opening A PR

Run:

```powershell
.\scripts\check-roundtable.ps1
git diff --check
```

If you touched bash scripts, also run:

```bash
./scripts/check-roundtable.sh
```

## PR Shape

Keep PRs small. Include:

- what changed
- why it helps first-run adoption or safety
- validation run
- rollback note
