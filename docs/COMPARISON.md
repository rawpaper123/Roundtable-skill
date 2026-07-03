# Comparison

Roundtable is not "more agents for every task." It is a small coordination
protocol for work where one unchecked agent is likely to miss scope, runtime,
security, or rollback risk.

## Short Version

| If your task is... | Use... | Why |
| --- | --- | --- |
| typo, copy, formatting | direct edit | Faster than convening anyone |
| small local bug | one coding agent plus a test | The risk is narrow and verifiable |
| known repeatable release gate | checklist | The risk is already known |
| risky product/backend/security change | Roundtable | Multiple expert angles help before implementation |
| broad research or exploration | autonomous agents first, Roundtable later | Explore widely, then use Roundtable to decide what ships |

## Roundtable vs Other Approaches

| Approach | Strength | Failure mode | Roundtable difference |
| --- | --- | --- | --- |
| Better prompt | Fastest possible start | One model still plans, reviews, implements, and signs off on itself | Separates expert advice from Executor ownership |
| Single-agent review | Cheap second opinion | Reviewer may invent work or miss deployment reality | No-opinion rule and bounded scope |
| Static checklist | Great for repeated gates | Cannot adapt to task-specific unknowns | Dynamic expert angles per task |
| Fully autonomous multi-agent system | Good for broad discovery | Ownership, Git state, and rollback can blur | One Executor remains accountable |
| Manual team review | Strong judgment | Slow, expensive, hard to reproduce | Lightweight repeatable review loop |

## When Roundtable Is Worth It

Use it when a wrong merge could create:

- production downtime,
- data corruption,
- auth or privacy regression,
- leaked secrets,
- fake-success reporting,
- user-trust damage,
- irreversible deployment or migration risk.

The test is simple:

```text
If rollback and verification matter, Roundtable is probably worth it.
If the answer fits in one safe edit, skip Roundtable.
```

## What Makes It Different

Roundtable keeps four boundaries explicit:

- **Lingtai agents advise.** They do not own the repo.
- **Expert roles are dynamic.** The same agent can review security today and
  release risk tomorrow.
- **No-opinion replies are valid.** Experts should not invent concerns.
- **The Executor ships or rejects.** One coding terminal owns scope, checks,
  Git, deployment state, and rollback.

## Why Not Just Use More Agents?

More agents can create more noise.

Roundtable is useful because it gives the agents a narrow job:

```text
expert angle -> concise concern or no opinion -> Executor synthesis -> smallest safe diff
```

That is different from asking agents to independently rewrite the plan,
implement features, or compete for control.

## Decision Rule

Start with the cheapest thing that can honestly handle the risk:

```text
direct edit -> one agent -> checklist -> Roundtable -> larger agent workflow
```

Roundtable sits in the middle: stronger than a single prompt, much simpler than
a fully autonomous agent organization.
