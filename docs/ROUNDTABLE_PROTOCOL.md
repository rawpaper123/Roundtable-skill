# Roundtable Protocol

## Loop

1. Executor inspects the task and repo enough to know real scope.
2. Executor selects configured Lingtai agents.
3. Executor assigns each agent a dynamic expert angle.
4. Executor sends one concise request per agent.
5. Agents reply with concerns or no-opinion.
6. Executor waits a bounded amount of time.
7. Executor records non-responsive agents and attempts one safe repair.
8. Executor synthesizes must-fix, nice-to-have, and rejected advice.
9. Executor implements the smallest safe change.
10. Executor verifies and reports Git/PR/rollback state.

## Bounded Wait

Default:

- two checks per milestone
- 10-30 seconds between checks
- no infinite waiting

If an agent does not respond:

1. record the agent,
2. check mail delivery,
3. check heartbeat/process if available,
4. wake or restart once if safe and allowed,
5. continue if still unavailable,
6. report the remaining issue.

## No-Opinion Rule

Agents must not invent work.

If they have no actionable concern from their assigned angle, they should reply:

```text
No opinion from my expert perspective.
```

or:

```text
From my assigned expert angle, I have no additional concerns.
```

## Advice Classification

Executor classifies replies as:

- must-fix now
- nice-to-have later
- out of scope
- incorrect / rejected
- no opinion

Only must-fix items that are in scope block completion.

## Completion

Roundtable is complete when:

- acceptance criteria are met,
- required checks pass or blockers are explicit,
- no in-scope must-fix remains,
- non-responsive agents are listed,
- Git/PR/rollback state is clear.
