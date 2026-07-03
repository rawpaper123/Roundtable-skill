# FAQ

## Is Roundtable a replacement for Codex, Claude Code, Cursor, or Windsurf?

No. Your coding terminal is still the **Executor**.

Roundtable adds Lingtai-backed expert review around the Executor. The Executor
still owns the final plan, code changes, verification, Git state, deployment,
and rollback.

## Does Roundtable work without Lingtai?

No. Without Lingtai configured, this repository is docs, templates, and install
helpers only.

Use:

```bash
./scripts/check-roundtable.sh --require-lingtai
```

or:

```powershell
.\scripts\check-roundtable.ps1 -RequireLingtai
```

## Does this repository install Lingtai automatically?

No. Lingtai setup is explicit because it may involve local agents, OAuth, model
providers, and private runtime state.

Start with [LINGTAI_SETUP.md](LINGTAI_SETUP.md).

## What exactly gets installed by the Codex installer?

Only the Codex skill files:

```text
$CODEX_HOME/skills/roundtable-skill
```

Existing installs are moved to a timestamped backup before replacement.

## How do I uninstall the Codex skill?

Delete the installed skill directory:

```powershell
Remove-Item -Recurse -Force "$HOME\.codex\skills\roundtable-skill"
```

or:

```bash
rm -rf "$HOME/.codex/skills/roundtable-skill"
```

If you use `CODEX_HOME`, remove it from that location instead.

## Does Roundtable commit mailbox files or agent logs?

No. Do not commit `.lingtai/`, mailbox files, logs, OAuth tokens, auth JSON, or
runtime data.

The mailbox diagnostic scripts report counts and status only. They do not print
message bodies.

## What if an expert has no advice?

That is allowed and expected.

The expert should reply:

```text
No opinion from my expert perspective.
```

This avoids invented review comments.

## What if an expert does not respond?

Do not wait forever.

Run:

```bash
./scripts/check-lingtai-mailbox.sh
```

or:

```powershell
.\scripts\check-lingtai-mailbox.ps1
```

Then make one bounded safe repair attempt, such as waking or restarting the
orchestrator. If it still does not respond, record the non-response and let the
Executor continue.

## Is Roundtable safe for production work?

It is designed for production-sensitive work, but it is not magic.

You still need:

- scoped changes,
- no secrets in prompts or logs,
- real validation,
- clear rollback.

Roundtable helps enforce that discipline.

## When should I not use Roundtable?

Skip it for:

- typos,
- one-line copy edits,
- mechanical formatting,
- changes you can verify faster than you can convene experts.

Use [USE_CASES.md](USE_CASES.md) for good fits.
