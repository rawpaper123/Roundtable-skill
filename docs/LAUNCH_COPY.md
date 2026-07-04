# Launch Copy

Use these snippets when sharing Roundtable Skill on GitHub, X, LinkedIn,
Hacker News, newsletters, or developer communities.

Roundtable Skill requires Lingtai. Do not imply that this repository runs a
real expert panel without Lingtai configured.

## One-Line Tagline

English:

```text
Roundtable Skill wraps your coding terminal with a Lingtai expert panel, while your terminal stays accountable for scope, checks, Git, and rollback.
```

Chinese:

```text
Roundtable Skill 把 Lingtai 专家组接到你的 coding terminal 旁边，但执行、验证、Git 和 rollback 仍由当前终端负责。
```

## GitHub Short Description

```text
Lingtai-powered multi-agent expert review loop for coding terminals: scoped plans, bounded waits, checks, rollback
```

## Three Short Launch Angles

Use one of these when you need a sharper first post.

### Scope Control

```text
I built Roundtable Skill for agentic coding tasks where scope creep is the real bug.

Lingtai agents advise from task-specific expert angles.
Your coding terminal stays the Executor and owns the final diff, checks, Git, and rollback.

https://github.com/rawpaper123/Roundtable-skill
```

### Fake Green Checks

```text
Most AI coding failures I care about are not syntax failures.

They are fake-green failures: no real checks, unclear owner, no rollback.

Roundtable Skill wraps a Lingtai expert panel around your coding terminal, while the terminal stays accountable for shipping.

https://github.com/rawpaper123/Roundtable-skill
```

### Silent Agents

```text
What should happen when one agent goes silent?

Roundtable Skill gives coding terminals a small protocol: bounded waits, one repair attempt, no-opinion replies, Executor-owned verification, rollback-ready report.

Built on Lingtai.

https://github.com/rawpaper123/Roundtable-skill
```

## X / Short Post

English:

```text
I released Roundtable Skill.

It adds a Lingtai expert panel around your coding terminal.

Experts advise. Your terminal stays the Executor: scope, implementation, checks, Git, deploy, rollback.

Built for risky coding changes where one model reviewing itself is not enough.

https://github.com/rawpaper123/Roundtable-skill
```

Chinese:

```text
我发布了 Roundtable Skill。

它把 Lingtai 专家组接到你的 coding terminal 旁边。

专家负责建议；当前终端仍是 Executor，负责 scope、实现、验证、Git、发布和 rollback。

适合那些不能只靠一个模型自问自答的高风险代码任务。

https://github.com/rawpaper123/Roundtable-skill
```

## LinkedIn / Longer Post

English:

```text
Agentic coding often fails for coordination reasons, not syntax reasons:

- scope expands silently
- the reviewer invents concerns
- the executor claims success without real checks
- one silent agent blocks the whole loop
- rollback is nobody's job

Roundtable Skill is a small protocol for fixing that.

It uses Lingtai as the expert-agent runtime and keeps your current coding terminal as the Executor. Experts advise from task-specific angles; the Executor owns the final plan, implementation, verification, Git, deploy, and rollback.

The repo includes:
- Codex skill package
- executor-neutral templates
- Codex and Claude Code adapter examples
- Lingtai setup guide
- troubleshooting guide
- release and launch checklists
- sanitized demo transcripts

It is intentionally boring: scoped plans, bounded waits, no-opinion replies, no fake success, and rollback-ready reports.

GitHub:
https://github.com/rawpaper123/Roundtable-skill
```

Chinese:

```text
很多 agentic coding 失败，不是因为语法，而是因为协作：

- scope 越做越大
- reviewer 为了显得有用而硬造意见
- executor 没有真实验证就说完成
- 一个 agent 沉默后整个流程卡住
- 没有人真正负责 rollback

Roundtable Skill 是一个很小的协议，用来解决这些问题。

它用 Lingtai 作为专家 agent runtime，同时让你当前的 coding terminal 继续担任 Executor。专家只按任务角度给建议；最终计划、实现、验证、Git、发布和 rollback 仍由 Executor 负责。

repo 里包括：
- Codex skill package
- executor-neutral 模板
- Codex / Claude Code adapter 示例
- Lingtai 设置指南
- troubleshooting guide
- release / launch checklist
- 脱敏 demo transcript

它刻意保持克制：明确 scope、有边界等待、允许专家说“没有意见”、不假装成功、每次交付都带 rollback。

GitHub:
https://github.com/rawpaper123/Roundtable-skill
```

## Hacker News / Forum Post

Title options:

```text
Show HN: Roundtable Skill - a Lingtai expert-panel workflow for coding terminals
Show HN: I built a Roundtable workflow for agentic coding reviews
Roundtable Skill: scoped multi-agent review around your coding terminal
```

Body:

```text
I built Roundtable Skill, a workflow skill for running a bounded expert-panel loop around a coding terminal.

It is built on Lingtai for the expert-agent runtime. The coding terminal stays the Executor and owns implementation, checks, Git state, deploy, and rollback.

The problem it tries to solve is not "more agents". It is coordination:
- who owns scope?
- who decides when advice is wrong?
- what happens when an agent is silent?
- how do you avoid fake green checks?
- who owns rollback?

The protocol is intentionally small:
- assign task-specific expert angles
- ask for concise advice
- allow "no opinion" replies
- wait with bounds
- repair silent agents once
- let the Executor synthesize and ship
- end with verification and rollback

The repo includes a Codex skill, executor templates, Lingtai setup docs, adapter examples, troubleshooting docs, and sanitized transcripts.

Feedback especially welcome from people building with Codex, Claude Code, Cursor, Windsurf, Kimi Work, or other coding terminals.

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
Lingtai expert panels for coding terminals, with scope, checks, and rollback kept in one Executor.
```

Short description:

```text
Roundtable Skill gives agentic coding work a small operating protocol: task-specific Lingtai experts advise, your coding terminal remains the Executor, silent agents get bounded repair, and every serious change ends with validation plus rollback.
```

Maker comment:

```text
I built Roundtable Skill after seeing the same failure pattern in agentic coding: not bad syntax, but bad coordination.

The planner expands scope, the reviewer invents work, one agent goes silent, tests are assumed instead of checked, and nobody owns rollback.

Roundtable keeps the loop small:
- Lingtai provides the expert agents.
- Your current coding terminal stays the Executor.
- Expert roles are assigned per task.
- "No opinion" is an allowed expert response.
- Non-responsive agents get one bounded repair attempt.
- The Executor owns the final diff, checks, Git, deploy, and rollback.

It is intentionally not a hosted platform and it does not bundle Lingtai. It is a reusable skill/protocol for people already using agentic coding terminals and wanting a safer expert-review loop.
```

Best audience tags:

```text
developer tools, AI agents, coding agents, workflow automation, productivity
```

## Developer Community Reply

Use this when someone asks why this needs a protocol instead of one bigger
prompt:

```text
The point is not "more agents".

Roundtable is about ownership boundaries: experts advise, one Executor decides, checks, ships, and owns rollback. The protocol also handles boring failure modes that big prompts usually ignore: scope creep, silent agents, fake-green checks, and no-opinion reviewers inventing work.
```

## Do Not Say

- "Works without Lingtai."
- "Autonomous agents ship your code."
- "No human or Executor judgment needed."
- "Guaranteed correct plans."
- "Replaces tests or reviews."

## Strong CTA

```text
Start with QUICKSTART.md, run the 60-second demo script, then try it on one risky PR before using it on production changes.
```
