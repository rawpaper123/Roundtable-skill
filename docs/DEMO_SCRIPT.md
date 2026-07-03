# 60-Second Demo Script

Use this to show Roundtable quickly in a README video, terminal demo, or launch
post.

## Setup Line

```text
Roundtable adds a Lingtai expert panel around your current coding terminal. The
experts advise. The Executor still owns implementation, checks, Git, and
rollback.
```

## Demo Prompt

```text
Open Roundtable Skill for this release gate:
decide whether this auth PR is safe to merge.

Assign expert angles:
- release reliability
- security/privacy
- adversarial scope review

Only report merge blockers, verification gaps, and rollback risks.
If an expert has no actionable concern, they must reply no opinion.
```

## Expected Replies

```text
Release reliability:
Must-fix: the PR changes auth behavior but only has a happy-path smoke.
Add one invalid-token smoke before merge.

Security/privacy:
Must-fix: verify auth failures do not print token, cookie, or auth header values.

Adversarial scope review:
Reject the login UI cleanup. It is unrelated to merge safety.
```

## Executor Synthesis

```text
Accepted:
- invalid-token smoke
- credential log scan

Rejected:
- login UI cleanup
- analytics refactor
- new auth abstraction

Smallest safe diff:
- one smoke check
- one log-safety check
- no UI changes
- no package changes
```

## Final Report Shape

```text
Validation:
- valid login smoke: pass
- invalid token smoke: pass
- log scan: pass
- diff scope: auth + smoke only

Decision:
- merge allowed

Rollback:
- git revert <merge_commit>
```

## What To Say Out Loud

```text
This is not autonomous chaos. The agents are reviewers with narrow expert
angles. The coding terminal is still the Executor. It accepts useful advice,
rejects scope creep, runs checks, and leaves rollback ready.
```

## If Lingtai Is Not Ready

Say:

```text
This checkout is docs-only right now. The protocol can be shown, but real
Roundtable execution requires Lingtai plus at least one reachable agent.
```

Do not fake agent replies.
