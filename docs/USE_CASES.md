# Use Cases

Roundtable is for tasks where expert review is cheaper than a bad merge.

It still requires Lingtai. Without Lingtai configured, these prompts are
templates only.

## 1. Release Gate

```text
Open Roundtable Skill for this release gate.

Goal: decide whether this PR is safe to merge.
Expert angles:
- release reliability
- security/privacy
- adversarial scope review

Only report merge blockers, verification gaps, and rollback risks.
If an expert has no concern, reply no opinion.
```

## 2. Production Bug

```text
Open Roundtable Skill for this production bug.

Goal: identify the smallest root-cause fix and avoid fake recovery.
Expert angles:
- runtime reliability
- data integrity
- user trust

Required output: root cause, smallest fix, validation, rollback.
```

## 3. Database Migration

```text
Open Roundtable Skill for this database migration.

Goal: review migration safety before applying it.
Expert angles:
- schema/data integrity
- deployment/rollback
- application compatibility

Reject unrelated product changes. Do not print secrets or DB URLs.
```

## 4. Auth Or Permission Change

```text
Open Roundtable Skill for this auth change.

Goal: prevent access-control regressions.
Expert angles:
- security/privacy
- negative testing
- release reliability

Require at least one negative smoke check before merge.
```

## 5. Architecture Slice

```text
Open Roundtable Skill for this architecture slice.

Goal: choose the smallest durable design that satisfies the current product need.
Expert angles:
- backend/API contract
- operations/observability
- scope control

Separate must-have now from follow-up ideas.
```

## 6. Public Launch Readiness

```text
Open Roundtable Skill for this launch readiness check.

Goal: decide what blocks public launch.
Expert angles:
- product trust
- security/privacy
- support/runbook clarity

Output only launch blockers, not general polish.
```

## 7. AI Or Agent Behavior Change

```text
Open Roundtable Skill for this AI behavior change.

Goal: keep user-visible behavior real, testable, and rollback-ready.
Expert angles:
- eval coverage
- user trust
- adversarial failure modes

No fake-success paths. Record uncertain behavior as risk.
```

## 8. Docs Or API Contract Review

```text
Open Roundtable Skill for this docs/API review.

Goal: make the documented behavior match the actual implementation.
Expert angles:
- API contract accuracy
- developer onboarding
- scope control

Do not request code changes unless the docs reveal a real blocker.
```

## Bad Fits

Do not open Roundtable for:

- typo fixes
- one-line copy edits
- mechanical formatting
- changes with one obvious check and no real rollback risk
