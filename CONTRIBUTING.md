# Contributing

Thanks for improving Roundtable Skill.

Roundtable is a Lingtai-backed workflow skill for coding terminals. The useful
contribution is usually a clearer protocol, a safer setup path, or a better
first-run example.

## Good Contributions

- clearer quickstart steps
- better executor examples
- safer Lingtai setup notes
- sanitized Roundtable run examples
- issue templates and public docs improvements
- bug reports for install/readiness scripts
- small fixes to Codex skill packaging
- executor adapter docs for Claude Code, Cursor, Windsurf, Kimi Work, or similar terminals
- templates that help users run their first real Roundtable faster

## Good First PRs

- improve one confusing paragraph
- add one sanitized example
- tighten one troubleshooting section
- fix one broken link
- improve one install/readiness script message

## Keep The Boundary

Roundtable Skill is built on Lingtai. Do not position it as a working
multi-agent system without Lingtai configured.

Do not contribute:

- bundled Lingtai runtime copies
- real mailbox contents
- project-specific private workflows
- model/provider credentials
- hosted services
- telemetry collectors
- broad rewrites without an issue first
- claims that Roundtable works as real multi-agent software without Lingtai

Do not commit:

- `.lingtai/`
- `.recipe/`
- mailbox files
- OAuth tokens
- `codex-auth.json`
- `.env`
- private keys
- logs
- local runtime data

## Before Opening A PR

Run the smallest relevant checks:

```powershell
.\scripts\check-roundtable.ps1
git diff --check
```

If you touched bash scripts, also run:

```bash
./scripts/check-roundtable.sh
```

If you touched release or security docs, check:

- [SECURITY.md](SECURITY.md)
- [docs/PUBLIC_RELEASE_CHECKLIST.md](docs/PUBLIC_RELEASE_CHECKLIST.md)
- [docs/MAINTAINER_RELEASE.md](docs/MAINTAINER_RELEASE.md)

## PR Shape

Keep PRs small. Include:

- what changed
- why it helps first-run adoption, safety, or maintainability
- validation run
- rollback note

Prefer one focused docs or script improvement over a mixed rewrite.

## Review Standard

A PR is easier to merge when it:

- preserves the Lingtai runtime boundary,
- keeps the Executor as final arbiter,
- avoids fake multi-agent claims,
- has no secrets or runtime state,
- updates related docs when behavior changes,
- keeps rollback simple.
