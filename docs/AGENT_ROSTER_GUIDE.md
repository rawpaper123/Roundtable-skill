# Agent Roster Guide

Roundtable needs at least one real Lingtai agent. More agents help only when
they cover different expert angles.

Do not create permanent personas like "the security agent" or "the product
agent." Assign expert angles per task.

## Start With One Agent

One agent is enough for a first run:

| Agent | Expert angle for this task | Required? |
| --- | --- | --- |
| your-agent | Adversarial scope reviewer | yes |

Good first request:

```text
Open Roundtable Skill for this task: review this PR before merge.

Use one Lingtai agent as adversarial scope reviewer.
If there is no actionable concern, reply no opinion.
Executor owns implementation, checks, Git, and rollback.
```

This proves mailbox delivery, reply handling, no-opinion behavior, and Executor
synthesis without pretending you already have a large panel.

## Grow To Three Agents

Three agents is the useful default for serious engineering work:

| Agent | Expert angle for this task | Required? |
| --- | --- | --- |
| agent-a | Runtime/release reliability | yes |
| agent-b | Security/privacy | yes |
| agent-c | Adversarial scope reviewer | no |

Use this for:

- auth changes,
- database changes,
- production deploys,
- release gates,
- public user-facing trust flows.

## Use Five Only When The Task Needs It

Five agents is for product + architecture decisions where disagreement is
useful:

| Agent | Expert angle for this task | Required? |
| --- | --- | --- |
| agent-a | Runtime/release reliability | yes |
| agent-b | Product trust and user impact | yes |
| agent-c | Security/privacy | yes |
| agent-d | Data integrity | no |
| agent-e | Adversarial scope reviewer | no |

Do not use five agents for typo fixes, one-line copy, or deterministic docs
chores.

## Required Agent Behavior

Every agent gets the same constraints:

- stay inside the user goal,
- do not request secrets,
- do not expand scope,
- do not invent issues,
- reply with no-opinion when there is no actionable concern.

Valid no-opinion reply:

```text
No opinion from my expert perspective.
```

## Non-Responsive Agents

Do not wait forever.

If an agent does not reply:

1. record the agent and assigned angle,
2. check mailbox delivery,
3. check liveness/heartbeat if available,
4. wake or restart once if safe,
5. continue if still unavailable,
6. report the remaining issue.

## Copy-Paste Roster

```md
| Agent | Expert angle for this task | Required? |
| --- | --- | --- |
| <agent-a> | Runtime/release reliability | yes |
| <agent-b> | Security/privacy | yes |
| <agent-c> | Adversarial scope reviewer | no |
```

## Related Templates

- [agent-roster-growth.md](../examples/agent-roster-growth.md)
- [agent-roster.example.md](../templates/lingtai/agent-roster.example.md)
- [roundtable-agent-template.md](../templates/lingtai/roundtable-agent-template.md)
- [request-template.md](../templates/lingtai/request-template.md)
