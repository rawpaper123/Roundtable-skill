# Example: Terminal Transcript

This is a sanitized terminal-style transcript. It shows the operational shape
of Roundtable without exposing private mailbox contents.

```text
$ roundtable "ship this auth change safely"

Executor
  goal: ship auth change safely
  runtime: Lingtai required
  experts:
    - Security/privacy
    - Release reliability
    - Scope control

Security/privacy
  must-fix: add a negative auth smoke before merge

Release reliability
  no opinion from my expert perspective

Scope control
  reject: redesigning login UI is out of scope

Executor synthesis
  accepted: negative auth smoke
  rejected: login UI redesign
  implementation: one backend guard, one smoke check

Verification
  tests: pass
  diff scope: backend auth + smoke only
  secrets: clean

Rollback
  git revert <commit>
```

If an agent does not answer, the Executor diagnoses delivery instead of waiting
forever:

```text
$ ./scripts/check-lingtai-mailbox.sh

Roundtable mailbox
outbox_queued: 1
orchestrator: product-reviewer
orchestrator_state: asleep
status: queued_outbox

note: wake or restart once, then record non-response.
```

The point is not more agents. The point is clearer ownership: Lingtai agents
advise, and the current coding terminal executes, verifies, and owns rollback.
