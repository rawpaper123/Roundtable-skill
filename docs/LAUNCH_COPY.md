# Launch Copy

Use these snippets when sharing Roundtable Skill on GitHub, Product Hunt, X,
LinkedIn, Hacker News, newsletters, or developer communities.

Roundtable Skill requires Lingtai. Do not imply that this repository runs a
real expert panel without Lingtai configured.

## One-Line Tagline

English:

```text
Roundtable Skill turns one-agent work into a Lingtai-powered expert meeting: temporary roles, disagreement maps, one accountable Executor.
```

Chinese:

```text
Roundtable Skill 把单个 AI 任务变成一场 Lingtai 圆桌会议：临时专家、多角度审查、整理分歧，最后由一个执行者负责交付。
```

## GitHub Short Description

```text
Lingtai-powered roundtable workflow for multi-perspective AI review: temporary experts, disagreement maps, accountable execution
```

## Three Short Launch Angles

### Multi-Perspective Review

```text
I built Roundtable Skill for tasks where one AI perspective is not enough.

Lingtai agents take temporary expert roles, review the plan from different angles, surface disagreement, then step out of those roles.

One Executor still owns the final decision.

https://github.com/rawpaper123/Roundtable-skill
```

### Research And Strategy

```text
Roundtable Skill is not just for code review.

Use it for research briefs, business plans, product decisions, and risky implementation work.

The loop is simple: assign temporary expert roles, collect disagreement, synthesize, verify, decide.

https://github.com/rawpaper123/Roundtable-skill
```

### Silent Agents

```text
What should happen when one AI agent goes silent?

Roundtable Skill gives the Executor a small protocol: bounded waits, one repair attempt, no-opinion replies, validation, and a recovery path.

Built on Lingtai.

https://github.com/rawpaper123/Roundtable-skill
```

## X / Short Post

English:

```text
I released Roundtable Skill.

It turns one-agent work into a Lingtai-powered roundtable.

Agents take temporary expert roles, review from different angles, surface disagreement, then hand the decision back to one Executor.

Useful for code, research, strategy, business plans, and other work where one model reviewing itself is not enough.

https://github.com/rawpaper123/Roundtable-skill
```

Chinese:

```text
我发布了 Roundtable Skill。

它把单个 AI 任务变成一场 Lingtai 圆桌会议。

不同 Agent 临时扮演不同专家，从各自角度审查计划、证据和执行进展，再把决定权交回一个执行者。

适合代码审查、研究简报、商业计划、产品决策，以及任何不适合只靠一个模型自问自答的复杂任务。

https://github.com/rawpaper123/Roundtable-skill
```

## LinkedIn / Longer Post

English:

```text
AI-assisted work often fails for coordination reasons.

The planner expands the task.
The reviewer invents work to sound useful.
One agent goes silent.
Evidence is assumed instead of checked.
Nobody owns the final decision.

Roundtable Skill is a small protocol for this.

It uses Lingtai as the expert-agent runtime. Agents take temporary roles for the current task, review from different angles, and surface disagreements. The Executor owns the final decision, validation, and rollback.

You can use the same pattern for:
- code release gates
- research briefs
- product strategy
- business plans
- daily decisions with real tradeoffs

The repo includes:
- Codex skill package
- executor-neutral templates
- Lingtai setup guide
- use-case prompts
- troubleshooting guide
- release and launch checklists
- sanitized demo transcripts

GitHub:
https://github.com/rawpaper123/Roundtable-skill
```

Chinese:

```text
很多 AI 协作失败，不是因为模型不会写，而是因为没有人负责组织讨论。

计划越做越大。
审查者为了显得有用，硬造意见。
某个 Agent 沉默后，流程卡住。
证据没有被真正检查。
最后也没人负责取舍。

Roundtable Skill 做的是一件很朴素的事：把任务放到一张圆桌上。

Lingtai Agent 按当前任务临时扮演不同专家，从不同角度审查计划、证据和执行进展；执行者负责整理分歧、做出取舍，并完成最终交付。

它可以用于：
- 代码发布审查
- 研究简报
- 产品策略
- 商业计划
- 有真实取舍的日常决策

仓库里包含：
- Codex Skill 包
- 执行者模板
- Lingtai 设置指南
- 多场景用例提示词
- 问题排查文档
- 发布检查清单
- 脱敏示例

GitHub:
https://github.com/rawpaper123/Roundtable-skill
```

## Hacker News / Forum Post

Title options:

```text
Show HN: Roundtable Skill - Lingtai-powered multi-perspective AI review
Show HN: I built a Roundtable workflow for temporary AI expert panels
Roundtable Skill: assign AI agents temporary expert roles, then synthesize disagreement
```

Body:

```text
I built Roundtable Skill, a workflow skill for running a bounded expert-panel loop with Lingtai agents.

The idea is simple: instead of asking one model to plan, critique, and decide alone, assign temporary expert roles to available agents. They review the task from different angles, surface conflicts, and hand the decision back to one Executor.

This is useful for code review, but not limited to code. I also use the pattern for research briefs, business plans, product decisions, and other work where one perspective is too narrow.

The protocol covers:
- temporary expert roles
- no-opinion replies
- bounded waits
- one repair attempt for silent agents
- disagreement mapping
- Executor-owned validation and rollback

The repo includes a Codex skill, executor templates, Lingtai setup docs, use-case prompts, troubleshooting docs, and sanitized transcripts.

GitHub:
https://github.com/rawpaper123/Roundtable-skill
```

## Product Hunt / Directory Submission

Name:

```text
Roundtable Skill
```

Tagline:

```text
Lingtai-powered roundtables for multi-perspective AI review.
```

Short description:

```text
Roundtable Skill lets available Lingtai agents take temporary expert roles, review a task from different angles, map disagreement, and hand the final decision back to one accountable Executor.
```

Maker comment:

```text
I built Roundtable Skill because single-agent work can be too smooth.

One model can produce a confident answer while missing the practitioner view, the skeptic view, the money trail, the safety risk, or the historical pattern.

Roundtable keeps the protocol small:
- assign temporary expert roles
- collect each role's strongest view
- map conflicts and missing perspectives
- allow "no opinion" replies
- repair silent agents once
- let one Executor make the final call

It is intentionally not a hosted platform and it does not bundle Lingtai. It is a reusable skill/protocol for people who want a safer multi-agent review loop around real work.
```

Best audience tags:

```text
AI agents, developer tools, productivity, research, workflow automation
```

## Developer Community Reply

Use this when someone asks why this needs a protocol instead of one bigger
prompt:

```text
The point is not "more agents".

Roundtable is about structured disagreement. Each agent gets a temporary role, reviews from that angle, and then steps out of the role. The Executor maps conflicts, rejects bad advice, verifies what matters, and owns the final decision.
```

## Do Not Say

- "Works without Lingtai."
- "Autonomous agents ship your code."
- "No human or Executor judgment needed."
- "Guaranteed correct plans."
- "Replaces tests or reviews."

## Strong CTA

```text
Start with QUICKSTART.md, run the 60-second fit check, then try Roundtable on one real task where a second perspective would change the answer.
```
