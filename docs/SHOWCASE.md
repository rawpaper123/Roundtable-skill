# Showcase: Release Gate

This is the job Roundtable should be known for:

> Stop a risky merge without turning the task into a giant redesign.

For a shorter copy/paste demo, see [DEMO_SCRIPT.md](DEMO_SCRIPT.md).

## Situation

A PR touches auth behavior before launch. A normal single-agent review may say
"looks good" or drift into unrelated UI cleanup.

Roundtable keeps the work bounded:

```text
Open Roundtable Skill for this release gate.

Goal: decide whether this auth PR is safe to merge.
Expert angles:
- release reliability
- security/privacy
- adversarial scope review

Only report merge blockers, verification gaps, and rollback risks.
If an expert has no concern, reply no opinion.
```

## Expert Panel

```text
Release reliability expert:
Must-fix: the PR changes auth behavior but only has a happy-path smoke.
Add one negative smoke proving an invalid token returns 401 and does not create
user state.
```

```text
Security/privacy expert:
Must-fix: verify no token, cookie, or auth header is printed in failure logs.
```

```text
Adversarial scope reviewer:
Reject the suggested login UI cleanup. It is unrelated to this release gate.
No product UI change is needed for merge safety.
```

## Executor Synthesis

```text
Accepted:
- add negative auth smoke
- check logs do not expose credentials

Rejected:
- login UI cleanup
- analytics refactor
- new auth abstraction

Implementation boundary:
- one backend guard if needed
- one smoke check
- no package changes
- no UI changes
```

## Verification

```text
checks:
- valid login smoke: pass
- invalid token smoke: pass
- log scan for token/cookie/header leakage: pass
- git diff scope: backend auth + smoke only

release decision:
- merge allowed

rollback:
- git revert <merge_commit>
```

## What Roundtable Changed

| Without Roundtable | With Roundtable |
| --- | --- |
| One model reviews its own plan | Separate expert angles review the merge |
| Scope creep sounds useful | Scope creep is explicitly rejected |
| "Looks good" may skip production risk | Verification gaps become must-fix items |
| Rollback is an afterthought | Rollback is part of done |

## The Contract

Lingtai agents advise. The current coding terminal is the Executor.

The Executor owns:

- final decision,
- implementation,
- checks,
- Git state,
- deploy/merge steps when requested,
- rollback report.

No Lingtai means no operational Roundtable. In that case, this page is only a
template for how to structure review.
