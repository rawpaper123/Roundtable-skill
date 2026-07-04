# Roundtable Protocol

## Mode Selection

Roundtable should scale with the task. Do not run the full research workflow
for every request.

- **Default mode:** coding, product, business, writing, and daily decisions.
  Use the smallest useful expert set and ask only for task-relevant output.
- **Research mode:** literature reviews, contested claims, market or policy
  research, and questions where different evidence traditions may conflict.
  Use the research workflow below.
- **Decision mode:** personal or business choices. Ask for tradeoffs,
  hidden cost, and one practical next step. Do not request a full contradiction
  map unless evidence conflict is the main problem.

## Default Loop

1. Executor inspects the task and repo enough to know real scope.
2. Executor designs a small expert set with real complementarity.
3. Executor assigns each agent a dynamic expert angle.
4. Executor sends one concise request per agent.
5. Agents reply with concerns or no-opinion.
6. Executor waits a bounded amount of time.
7. Executor records non-responsive agents and attempts one safe repair.
8. Executor synthesizes accepted advice, rejected advice, and next step.
9. Executor implements the smallest safe change or writes the final answer.
10. Executor verifies and reports validation plus rollback/recovery when relevant.

## Expert Angle Design

The quality of Roundtable depends more on expert-angle design than on the
number of agents. Use fewer roles when possible, but make each role earn its
seat.

Good expert sets should include:

- **one ground-truth voice**: user, operator, practitioner, maintainer, customer,
  or someone closest to the real environment;
- **one evidence voice**: tests, research, logs, financial model, source
  quality, or domain evidence;
- **one adversarial voice**: skeptic, security reviewer, risk reviewer,
  contradiction hunter, or scope-control reviewer;
- **one delivery voice when action is required**: release owner, operator,
  implementation maintainer, legal/compliance, or rollback owner;
- **one optional synthesis voice** only when the task is ambiguous.

Do not create five roles because five sounds impressive. Create roles because
each one can reveal something the others probably miss.

![Roundtable Skill agent roster](../assets/roundtable-agent-roster.png)

### Example Angle Sets

Development:

- release reliability: what breaks after merge or deploy,
- security/privacy: what leaks, escalates, or violates trust,
- data integrity: what corrupts state or creates irreversible changes,
- adversarial scope: what advice should be rejected as out of scope.

Business plan:

- customer reality: why a real buyer would care or ignore it,
- operator: what is painful to run every week,
- finance: unit economics, cash timing, hidden cost,
- go-to-market: channel, conversion, and distribution bottleneck,
- legal/risk: contracts, claims, compliance, reputation.

Daily decision:

- practical friend: what you can actually live with,
- budget/time reviewer: what the decision costs in money and energy,
- risk reviewer: what can go wrong and how reversible it is,
- contrarian: what assumption sounds true but may be false.

Writing or public narrative:

- target reader: whether the message lands,
- accuracy reviewer: claims, evidence, and overstatement,
- skeptic: what sounds like marketing fluff,
- channel reviewer: what fits the platform,
- editor: what to cut.

## Research Mode

Use this only for research-style tasks where multi-perspective evidence review
is the value of the task.

### Step 1: Multi-Perspective Scan

Assign 3-5 expert roles that fit the question. Common research roles:

- practitioner: what field experience sees that papers often miss,
- scholar: what peer-reviewed evidence actually supports,
- skeptic: strongest counterargument and ignored evidence,
- economist: incentives, funding, market structure, or who benefits,
- historian: useful analogies and past failure patterns.

Each role should provide:

1. two-sentence core position,
2. strongest evidence,
3. the one thing only this role would notice.

### Step 2: Contradiction Map

Executor maps:

1. direct conflicts between roles,
2. strongest and weakest evidence,
3. the one question that would resolve the biggest conflict,
4. claims all roles agree on,
5. topics no role mentioned.

### Step 3: Synthesis Brief

Executor produces:

1. one concise executive summary paragraph,
2. five findings ranked by reliability,
3. one hidden connection visible only across roles,
4. one practical action recommendation,
5. one frontier question that could change the conclusion.

### Step 4: Peer Review

Ask the expert roles to review the synthesis:

1. confidence score for each key finding,
2. weakest claim and what would verify it,
3. overrepresented perspective,
4. missing sixth perspective if any,
5. what a strict reviewer would ask to change.

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
