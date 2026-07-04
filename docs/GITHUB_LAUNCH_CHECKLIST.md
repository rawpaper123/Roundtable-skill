# GitHub Launch Checklist

Use this before posting Roundtable Skill publicly on GitHub, Hacker News,
Product Hunt, X, LinkedIn, or developer communities.

## Repository Metadata

- Repository is public.
- Description is short and searchable:

```text
Lingtai-powered multi-agent expert review loop for coding terminals: scoped plans, bounded waits, checks, rollback
```

- Topics include:
  - `agent-orchestration`
  - `ai-agents`
  - `coding-agents`
  - `developer-tools`
  - `workflow-automation`
  - `multi-agent`
  - `ai-coding`
  - `prompt-engineering`
  - `developer-productivity`
  - `agentic-workflows`
  - `lingtai`
  - `codex`
  - `claude-code`

## README First Screen

- Badges show docs, license, Lingtai requirement, executor neutrality, and Codex
  skill support.
- The first paragraph explains:
  - Lingtai provides expert agents,
  - the coding terminal stays the Executor,
  - the Executor owns scope, checks, Git, deploy, and rollback.
- The 10-second pitch is visible before the first screenshot.
- The demo image renders.
- English and Chinese entry points work.
- Quickstart does not imply Codex is required as the Executor.
- Quickstart explains what to do when readiness reports `docs_only`.
- README first screen helps visitors decide when to use or skip Roundtable.

## Conversion Links

Top-level README links should be grouped by user intent rather than shown as one
crowded row. They should include:

- Quickstart
- Install matrix
- Demo script
- First run checklist
- Why Roundtable
- Comparison
- Showcase
- Adoption
- Use cases
- Executor setup
- Agent roster
- Troubleshooting
- FAQ
- Security
- Launch copy
- Contributing

## Trust Checks

- [SECURITY.md](../SECURITY.md) exists.
- [CODE_OF_CONDUCT.md](../CODE_OF_CONDUCT.md) exists.
- [CONTRIBUTING.md](../CONTRIBUTING.md) exists.
- [PUBLIC_RELEASE_CHECKLIST.md](PUBLIC_RELEASE_CHECKLIST.md) exists.
- [POST_LAUNCH_ITERATION.md](POST_LAUNCH_ITERATION.md) exists.
- Issue templates exist for docs improvements and executor adapters.
- Setup help issue template exists for first-run blockers.
- GitHub Discussions is enabled for community questions and setup help.
- README and troubleshooting link to the welcome/setup discussion.
- Launch copy includes short posts for scope creep, fake-green checks, and
  silent-agent failure modes.
- Launch copy includes Product Hunt / directory submission fields.
- A pull request template exists and asks for scope, runtime boundary,
  validation, and rollback.
- Docs workflow badge points to the active GitHub Actions workflow.
- Latest Docs workflow run on `main` is successful.

## Runtime Boundary

- README says Lingtai is required and not bundled.
- README does not claim real multi-agent execution without Lingtai.
- `check-roundtable` reports `docs_only` honestly when `.lingtai/` is absent.
- `.lingtai/`, `.recipe/`, mailbox files, OAuth tokens, logs, and private runtime
  data are not committed.

## Local Preflight

PowerShell:

```powershell
git status --short
git diff --check
.\scripts\check-roundtable.ps1
git ls-files | Select-String -Pattern '(^|/)(\.lingtai|\.recipe)(/|$)|(^|/)(codex-auth\.json|\.env)$|(\.pem|\.key|\.log)$|(^|/)mailbox(/|$)'
```

Bash:

```bash
git status --short
git diff --check
./scripts/check-roundtable.sh
git ls-files | grep -E '(^|/)(\.lingtai|\.recipe)(/|$)|(^|/)(codex-auth\.json|\.env)$|(\.pem|\.key|\.log)$|(^|/)mailbox(/|$)' || true
```

The sensitive-path scan should show no committed runtime or secret files.

## Launch Copy

Use [LAUNCH_COPY.md](LAUNCH_COPY.md) for copy/paste posts.

Short version:

```text
Roundtable Skill adds a Lingtai expert panel around your coding terminal.
Experts advise; your terminal stays the Executor and owns implementation,
checks, Git, deploy, and rollback.
```

Problem line:

```text
Most agentic coding failures are coordination failures: scope creep, fake green
checks, silent agents, missing rollback, and unclear ownership.
```

Call to action:

```text
Start with QUICKSTART.md, then run the 60-second demo script.
```

## Do Not Launch If

- the README first screen is stale,
- docs CI is failing,
- sensitive-path scan finds runtime or secret files,
- the repo implies Lingtai is bundled,
- the demo script claims fake agent replies,
- rollback instructions are missing.
