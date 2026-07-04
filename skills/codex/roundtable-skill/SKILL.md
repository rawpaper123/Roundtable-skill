---
name: roundtable-skill
description: Use when the user asks to run Roundtable Skill, roundtable, expert group, Lingtai expert panel, loop engineering, planner quorum, multi-agent review, or an executor plus Lingtai collaboration loop. Coordinates multiple agents as temporary task-specific experts, maps disagreement, synthesizes a bounded plan or brief, then lets the current Executor own the final decision, verification, and rollback.
---

# Roundtable Skill

Use this skill only when the user explicitly asks for Roundtable Skill,
roundtable, expert group mode, Lingtai agents, loop engineering, or a
planner/reviewer quorum.

Roundtable means a working roundtable: multiple Lingtai agents take temporary
expert roles for the current task, review the plan and evidence from different
angles, surface disagreement, and then step out of those roles when the task
ends.

## Core Contract

- The current terminal or agentic workspace is the Executor.
- The Executor can be Codex, Claude Code, Kimi Work, Cursor, Windsurf, or another agentic terminal.
- The Executor is final arbiter, implementer or writer, verifier, and rollback owner.
- For code tasks, the Executor also owns Git state, PRs, deploys, and code rollback.
- Roundtable agents are advisors: they plan, critique, and review from assigned expert angles.
- Expert roles are assigned per task. Do not treat agent names as permanent domains.
- Agent advice cannot override user constraints, security rules, no-secrets rules, no-fake-success rules, scope, or rollback requirements.
- If an expert has no actionable concern, they must still reply with a no-opinion response. They must not invent changes.

Valid no-opinion replies:

```text
No opinion from my expert perspective.
From my assigned expert angle, I have no additional concerns.
```

## Minimal Loop

1. Inspect the task, evidence, files, or source material enough to know the real scope.
2. Design a small expert set with real complementarity. Prefer 2-4 useful angles over 5 generic ones.
3. Assign each agent a task-specific expert angle.
4. Send one concise request per agent:
   - goal
   - constraints
   - current evidence
   - requested expert angle
   - required output
   - no-opinion rule
5. Wait bounded time only:
   - 2 checks per milestone
   - 10-30 seconds between checks
   - no infinite waiting
6. For non-responsive agents:
   - record them
   - check mail delivery
   - check heartbeat/process if available
   - wake or restart once if safe and allowed
   - continue if still unavailable
7. Synthesize:
   - must-fix
   - nice-to-have
   - wrong/scope-expanding advice to reject
   - direct disagreements
   - strongest and weakest evidence
   - smallest executable next step
8. Executor executes the smallest safe change or writes the final brief.
9. Verify with the smallest meaningful checks or evidence review.
10. Report:
   - agents used and expert angles
   - who replied / who did not
   - what was accepted / rejected
   - validation
   - Git/PR/deploy state when relevant
   - rollback or recovery path when relevant

## Expert Angle Design

Quality comes from the role mix, not the agent count. Pick angles that reveal
different failure modes:

- ground-truth voice: user, operator, practitioner, maintainer, customer;
- evidence voice: tests, research, logs, financial model, source quality;
- adversarial voice: skeptic, security, risk, contradiction, scope control;
- delivery voice: release owner, implementation owner, legal/compliance, rollback owner;
- optional synthesis voice for ambiguous tasks only.

Do not copy the research workflow into every task. Use it only when the task is
research-heavy or evidence-conflict-heavy.

For normal development, business, daily, or writing tasks, ask each expert for:

1. the one thing their angle sees that others may miss,
2. must-fix issues if any,
3. what to reject as out of scope or weak evidence,
4. the smallest useful next step.

For research tasks, use the research mode from `docs/ROUNDTABLE_PROTOCOL.md`:
multi-perspective scan, contradiction map, synthesis brief, and peer review.

## Lingtai

For Roundtable execution, use Lingtai:

<https://github.com/LingTai-AI/lingtai>

Do not install third-party tools silently. If Lingtai is missing, report that
Roundtable is not operational yet and point the user to Lingtai setup.

## Request Template

```md
# Roundtable Request: <goal>

## Goal
<concrete outcome>

## Current Evidence
- Repo/path:
- Branch/status:
- Relevant files/checks:

## Your Expert Angle
<dynamic role for this cycle>

## Constraints
- <forbidden changes>
- No secrets.
- No fake success.
- Executor remains final implementer and arbiter.

## Required Output
Reply with:
1. Sufficient yes/no
2. Must-fix issues, if any
3. Smallest safe next step
4. Validation required
5. Rollback risk

If you have no actionable concern, reply:
`No opinion from my expert perspective.`
```

## Example Expert Sets

Development:

- release reliability
- security/privacy
- adversarial scope review
- data integrity

Research:

- practitioner
- scholar
- skeptic
- economist
- historian

Daily decision:

- practical friend
- budget reviewer
- risk reviewer
- time planner
- contrarian

Business plan:

- customer voice
- operator
- finance reviewer
- go-to-market reviewer
- legal/risk reviewer

## Safety

- Never print or request secrets, tokens, private keys, cookies, DB URLs, or access keys.
- Never commit `.lingtai/`, `.recipe/`, runtime data, logs, or generated private mail.
- Do not create missing agents unless the user asks.
- Do not let a planner turn a small fix into a new product phase.
- If a planner suggests a larger system, record it as follow-up unless it is required for the current acceptance criteria.

## Completion Standard

The loop is complete when:

- user acceptance criteria are met,
- required checks pass or blockers are explicit,
- no in-scope must-fix Roundtable feedback remains,
- non-responsive agents are listed,
- evidence, validation, and rollback or recovery state are clear.
