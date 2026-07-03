# Example: Sanitized Roundtable Run

This is a short, sanitized transcript showing what a Roundtable loop feels like.
It is not tied to a private project.

## User Goal

```text
Open Roundtable Skill for this task:
make the onboarding flow safer before launch.
```

## Executor Starts The Roundtable

```text
Executor: I will ask Lingtai agents for three expert angles:
- product trust
- security/privacy
- adversarial scope review

If an expert has no actionable concern, they must say no opinion.
```

## Expert Replies

```text
Product trust expert:
Must-fix: the empty state says "try again later" but does not explain whether
the user's data was saved. Add one sentence that confirms saved progress.

Smallest safe next step: update the empty state copy only.

Validation: trigger the empty state and confirm the copy is visible.
```

```text
Security/privacy expert:
No opinion from my expert perspective.
```

```text
Adversarial reviewer:
Nice-to-have: add analytics later. Not required for this launch gate.

Smallest safe next step: do not expand scope.
```

## Executor Synthesis

```text
Accepted:
- update the empty state copy

Rejected:
- analytics, because it is not required for the launch gate

Implementation:
- one copy change
- one UI check
- no database, dependency, or API changes
```

## Final Report

```text
Changed:
- safer onboarding empty-state copy

Verified:
- empty state renders
- git diff only touches the intended UI file

Rollback:
- revert the copy commit
```

## What This Shows

- Experts advise; the Executor decides.
- No-opinion replies are valid.
- Scope-expanding advice is recorded, not blindly implemented.
- The loop ends with validation and rollback.
