# Why Roundtable?

Roundtable is for work where one more prompt is not enough.

It is not a replacement for your coding terminal. It is a Lingtai-backed expert
panel around it: experts advise, the Executor decides, implements, verifies,
and owns rollback.

## Quick Comparison

| Approach | What works | What breaks on serious work |
| --- | --- | --- |
| Better prompt | Fast and cheap | One model still plays planner, reviewer, executor, and release owner at once |
| Single-agent review | Catches obvious issues | Review advice can expand scope, invent concerns, or skip rollback |
| Checklist | Good for repeated gates | Cannot adapt to the current task or disagree with a weak plan |
| Roundtable | Dynamic expert angles, no-opinion rule, bounded waits, one Executor | Requires Lingtai setup and at least one real agent |

## Concrete Example

For a release gate, a better prompt may say "looks fine" after reading the diff.
A single reviewer may ask for unrelated analytics. A checklist may miss that the
hosted service was never verified.

Roundtable asks focused experts, rejects scope creep, and leaves one Executor
responsible for the actual checks:

```text
release reliability -> verify hosted health
security/privacy -> no secrets in logs
adversarial scope -> reject unrelated analytics
Executor -> run checks, ship or rollback
```

## The Core Difference

Roundtable makes the coordination contract explicit:

```text
user goal -> Lingtai experts -> Executor synthesis -> implementation -> verification -> rollback
```

The important part is not "more agents." The important part is role discipline:

- experts stay in their assigned angle,
- experts may say no opinion,
- silence is treated as a runtime issue,
- the Executor rejects scope creep,
- every serious change ends with validation and rollback.

## When To Use It

Use Roundtable for:

- release gates
- production debugging
- auth, database, privacy, or security changes
- architecture slices
- public launch readiness
- workflows where user trust matters

Skip it for:

- typo fixes
- one-line copy edits
- mechanical formatting
- small deterministic changes

## Why It Can Earn A Star

Most agent tools sell "more automation." Roundtable sells a smaller promise:
better coordination around the coding terminal you already use.

That makes it easy to try, easy to explain, and easy to remove.
