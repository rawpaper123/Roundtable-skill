# Why Roundtable?

Roundtable is for work where one more prompt is not enough.

![Roundtable Skill expert roundtable](../assets/roundtable-hero.png)

It is not a replacement for your coding terminal. It is a Lingtai-backed expert
panel around it: experts advise, the Executor decides, implements, verifies,
and owns rollback.

## Quick Comparison

| Approach | Best for | What works | What breaks on serious work |
| --- | --- | --- | --- |
| Better prompt | Small local edits | Fast, cheap, no setup | One model still plays planner, reviewer, executor, and release owner at once |
| Single-agent review | Quick second opinion | Catches obvious issues | Advice can expand scope, invent concerns, or skip rollback |
| Checklist | Repeated gates | Great for known risks | Cannot adapt to the current task or challenge a weak plan |
| More autonomous agents | Large parallel exploration | Can gather more context | Easy to lose ownership, scope, and rollback |
| Roundtable | Risky engineering decisions | Dynamic expert angles, no-opinion rule, bounded waits, one Executor | Requires Lingtai setup and at least one real agent |

For a fuller buyer's guide, see [COMPARISON.md](COMPARISON.md).

## Decision Rule

Use the lightest thing that is enough:

```text
typo -> edit directly
small bug -> one model plus tests
known release gate -> checklist
risky engineering decision -> Roundtable
```

Roundtable is not a default for every task. It is for the places where a wrong
merge, fake green check, leaked secret, or scope-expanded refactor costs more
than the coordination overhead.

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

![Roundtable Skill role collision](../assets/roundtable-role-collision.png)

Good roles create useful tension. A skeptic, practitioner, evidence reviewer,
and delivery owner should not repeat one another. They should expose different
ways the same plan can fail.

![Roundtable Skill blind spot map](../assets/roundtable-blindspot-map.png)

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
