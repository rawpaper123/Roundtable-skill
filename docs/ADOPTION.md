# Adoption Guide

You do not need Roundtable for every coding task.

Use it when the cost of a bad merge is higher than the cost of asking a small
expert panel first.

## If You Already Use Codex, Claude Code, Cursor, Or Windsurf

Keep using them. They are the **Executor**.

Roundtable adds the missing coordination layer around that Executor:

- Lingtai agents review from task-specific expert angles.
- Experts can say `No opinion from my expert perspective.`
- Silent agents get bounded diagnosis, not infinite waiting.
- The Executor still owns implementation, checks, Git, deploy, and rollback.

That is the point: more advice without giving up ownership.

## When It Pays Off

Use Roundtable for:

- release gates
- production debugging
- auth, privacy, security, or database changes
- architecture decisions
- public launch readiness
- work where rollback matters

Skip it for:

- typo fixes
- one-line copy changes
- mechanical formatting
- changes you can verify faster than you can convene experts

## What Changes In Your Workflow

Without Roundtable:

```text
prompt -> model answer -> implementation -> maybe tests
```

With Roundtable:

```text
goal -> Lingtai expert angles -> Executor synthesis -> smallest safe diff -> checks -> rollback-ready report
```

The useful part is not "more agents." The useful part is that every role has a
job and an exit condition.

## Setup Reality

Roundtable Skill is built on Lingtai. This repository does not bundle Lingtai.

- With Lingtai configured: Roundtable can run as an expert-panel workflow.
- Without Lingtai configured: this repository is docs, templates, and install
  helpers only.

Start here:

- [LINGTAI_SETUP.md](LINGTAI_SETUP.md)
- [EXECUTOR_SETUP.md](EXECUTOR_SETUP.md)
- [ROUNDTABLE_PROTOCOL.md](ROUNDTABLE_PROTOCOL.md)

## The First Task To Try

Pick a task where a second opinion is useful but the scope is still small:

```text
Open Roundtable Skill for this task:
review this PR before merge. Keep scope limited to release blockers, security,
data integrity, and rollback.
```

If the experts find nothing, they should say no opinion. That is a good result.
