# Example: Agent Roster Growth

Use this when you want to explain why Roundtable starts small and grows only
when the task needs it.

## Same Task

```text
Open Roundtable Skill for this task:
review this production auth change before merge.

Executor owns implementation, validation, Git, and rollback.
Experts advise only. If there is no actionable concern, reply no opinion.
```

## One Agent

Best for proving the loop works.

| Agent | Expert angle | Required? |
| --- | --- | --- |
| agent-a | Adversarial scope reviewer | yes |

Expected value:

```text
Scope reviewer:
Reject the suggested login redesign. It is unrelated to the auth merge gate.
Smallest safe next step: keep the diff to backend auth and smoke checks.
```

What this proves:

- mailbox delivery works,
- the agent can reply,
- no-opinion behavior is acceptable,
- Executor synthesis is visible.

## Three Agents

Best default for serious engineering work.

| Agent | Expert angle | Required? |
| --- | --- | --- |
| agent-a | Runtime/release reliability | yes |
| agent-b | Security/privacy | yes |
| agent-c | Adversarial scope reviewer | no |

Expected value:

```text
Runtime/release reliability:
Must-fix: add a negative auth smoke proving invalid token returns 401.

Security/privacy:
Must-fix: verify failed auth logs do not print token, cookie, or auth header.

Scope reviewer:
Reject login UI cleanup. It is out of scope.
```

Executor synthesis:

```text
Accepted:
- negative auth smoke
- log scan for credential leakage

Rejected:
- login UI cleanup
- analytics refactor

Implementation boundary:
- backend auth guard if needed
- one smoke check
- no package changes
- no UI changes
```

## Five Agents

Use only when product, data, and launch risk all matter.

| Agent | Expert angle | Required? |
| --- | --- | --- |
| agent-a | Runtime/release reliability | yes |
| agent-b | Security/privacy | yes |
| agent-c | Product trust and user impact | yes |
| agent-d | Data integrity | no |
| agent-e | Adversarial scope reviewer | no |

Expected value:

```text
Product trust:
Must-fix: if auth fails, show a user-safe error. Do not expose backend details.

Data integrity:
No opinion from my expert perspective.
```

Executor synthesis stays strict:

```text
Must-fix now:
- invalid token smoke
- credential leak check
- user-safe auth error

Not now:
- login redesign
- analytics refactor
- new auth abstraction
```

## Rule Of Thumb

- one agent: prove the loop,
- three agents: ship serious engineering work,
- five agents: use only when disagreement improves the decision.

More agents are not the point. Better role discipline is the point.
