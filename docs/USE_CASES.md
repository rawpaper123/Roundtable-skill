# Use Cases

Roundtable is for work where one point of view is too cheap.

It still requires Lingtai. Without Lingtai configured, these prompts are
templates only.

## 1. Development: Release Gate

```text
Open Roundtable for this release gate.

Goal:
decide whether this auth PR is safe to merge.

Expert roles:
- release reliability reviewer: what breaks after deploy
- security/privacy reviewer: what leaks or violates trust
- adversarial scope reviewer: what should be rejected as out of scope

Required output:
- merge blockers
- verification gaps
- rollback risk
- no unrelated redesign ideas
```

## 2. Development: Production Bug

```text
Open Roundtable for this production bug.

Goal:
identify the smallest root-cause fix and avoid fake recovery.

Expert roles:
- runtime reliability reviewer: what is actually failing in production
- data integrity reviewer: what state may be stale, missing, or corrupted
- user trust reviewer: what fake recovery or vague errors would damage trust

Required output:
- likely root cause
- smallest fix
- validation command
- rollback path
```

## 3. Research: Multi-Perspective Brief

```text
Open Roundtable for this research question.

Goal:
avoid a single-perspective summary.

Expert roles:
- practitioner: what field experience sees that papers often miss
- scholar: what peer-reviewed evidence really says
- skeptic: the strongest counterargument
- economist: who benefits from the current narrative
- historian: which past patterns look similar

Step 1:
Each role gives:
- two-sentence position
- strongest evidence
- the one thing only this role would notice

Step 2:
Build a contradiction map:
- direct conflicts
- strongest and weakest evidence
- one question that would resolve the biggest conflict
- claims all roles agree on
- topics no role mentioned

Step 3:
Produce:
- one CEO-level summary paragraph
- five ranked findings
- one hidden connection across roles
- one action recommendation
- one frontier question

Step 4:
Ask the roles to peer-review the brief:
- confidence score for each finding
- weakest claim
- overrepresented perspective
- missing sixth perspective
- what a strict reviewer would ask to change
```

## 4. Daily Decision

```text
Open Roundtable for this personal decision.

Goal:
choose the option I can actually live with next month.

Expert roles:
- practical friend: what I can actually live with
- budget/time reviewer: what this costs in money, attention, and schedule
- risk reviewer: what is reversible and what is not
- contrarian: what assumption sounds true but may be false

Required output:
- best option
- option that sounds good but will likely fail
- hidden cost
- one thing to decide today
- one thing to postpone
```

## 5. Business Plan

```text
Open Roundtable for this business plan.

Goal:
find the assumptions that would break this plan before I spend money on it.

Expert roles:
- customer reality: why a buyer would care or ignore it
- operator: what will be painful to run every week
- finance reviewer: unit economics, cash timing, hidden cost
- go-to-market reviewer: channel and conversion bottleneck
- legal/risk reviewer: claims, compliance, reputation

Required output:
- strongest reason this can work
- strongest reason it can fail
- missing data
- cheapest validation step
- decision: proceed, revise, or stop
```

## 6. Product Strategy

```text
Open Roundtable for this product decision.

Goal:
decide whether this feature should be built now.

Expert roles:
- target user advocate: whether this solves a real user problem
- product strategy reviewer: whether it fits the current direction
- engineering cost reviewer: what it costs to build and maintain
- trust/safety reviewer: how it can harm user trust
- launch sequencing reviewer: what should happen before or after it

Required output:
- user value
- risk to trust
- implementation cost
- launch blocker
- smallest useful version
```

## 7. Writing Or Public Narrative

```text
Open Roundtable for this public announcement.

Goal:
make the message clear, credible, and not overclaimed.

Expert roles:
- target reader: whether the message lands
- technical accuracy reviewer: what is overstated or unsupported
- skepticism reviewer: what sounds inflated
- distribution/channel reviewer: what fits this platform
- editor: what to cut

Required output:
- what is clear
- what sounds inflated
- what proof is missing
- what to cut
- final suggested copy
```

## Bad Fits

Do not open Roundtable for:

- typo fixes
- one-line copy edits
- mechanical formatting
- tasks with one obvious check and no real rollback or decision risk
- tasks where Lingtai is not configured but you need real expert replies
