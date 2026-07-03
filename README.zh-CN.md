# Roundtable Skill 🪑

中文 | [English](README.md)

[![GitHub stars](https://img.shields.io/github/stars/rawpaper123/Roundtable-skill?style=social)](https://github.com/rawpaper123/Roundtable-skill/stargazers)
[![Docs](https://github.com/rawpaper123/Roundtable-skill/actions/workflows/docs.yml/badge.svg)](https://github.com/rawpaper123/Roundtable-skill/actions/workflows/docs.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-black.svg)](LICENSE)
[![Lingtai required](https://img.shields.io/badge/Lingtai-required-black.svg)](https://github.com/LingTai-AI/lingtai)
[![Executor neutral](https://img.shields.io/badge/executor-neutral-black.svg)](docs/EXECUTOR_SETUP.md)
[![Codex skill](https://img.shields.io/badge/Codex-skill-black.svg)](skills/codex/roundtable-skill/SKILL.md)

把 Lingtai 驱动的专家复核带进你的 coding terminal，同时让一个
Executor 对 scope、验证、Git、发布和 rollback 负责。

**10 秒看懂：** 当一个高风险改动需要独立专家意见、scope 控制、真实验证和可回滚报告时，
用 Roundtable；但 repo 所有权仍然留在当前 coding terminal 手里。

![Roundtable Skill terminal preview](assets/roundtable-terminal-demo.svg)

**第一次使用？从 [QUICKSTART.md](QUICKSTART.md) 开始。**

[Install](#作为-codex-skill-安装) · [Quickstart](QUICKSTART.md) ·
[Demo script](docs/DEMO_SCRIPT.md) · [Demo](examples/sanitized-roundtable-run.md) ·
[Why Roundtable?](docs/WHY_ROUNDTABLE.md) · [Comparison](docs/COMPARISON.md) ·
[Showcase](docs/SHOWCASE.md) · [Adoption](docs/ADOPTION.md) ·
[Use cases](docs/USE_CASES.md) · [Executor setup](docs/EXECUTOR_SETUP.md) ·
[Agent roster](docs/AGENT_ROSTER_GUIDE.md) · [Roadmap](docs/ROADMAP.md) ·
[Troubleshooting](docs/TROUBLESHOOTING.md) · [FAQ](docs/FAQ.md) ·
[Security](SECURITY.md) · [Launch copy](docs/LAUNCH_COPY.md) · [Launch checklist](docs/GITHUB_LAUNCH_CHECKLIST.md) ·
[Post-launch](docs/POST_LAUNCH_ITERATION.md) · [Release notes](CHANGELOG.md) ·
[Contributing](CONTRIBUTING.md)

Roundtable Skill 是一个 executor-neutral 的工程协作工作流。你的当前
coding terminal 是 **Executor**，可以是 Codex、Claude Code、Kimi Work、
Cursor、Windsurf，或其他 agentic coding terminal。Lingtai agents 只负责
按任务给出专家意见；Executor 负责最终取舍、实现、验证、PR、部署和回滚。

Roundtable 建立在 [Lingtai](https://github.com/LingTai-AI/lingtai) agent
runtime 之上。本 repo 不内置 Lingtai。没有配置 Lingtai 时，这个 repo 只是
协议、模板和安装辅助，不是可运行的多 agent Roundtable。

## 为什么值得用？

很多 AI coding 失败，不是语法失败，而是协作失败：

- planner 把任务越扩越大；
- reviewer 为了显得有用，硬造修改意见；
- executor 没有验证生产现实就说完成；
- 某个 agent 沉默后，整个流程卡死；
- 没有人真正负责 rollback。

Roundtable 用一个小协议解决这些问题：

- 🧭 **动态专家角色**：每次任务重新分配专家方向，不把 agent 永久绑定到某个身份。
- 🧑‍⚖️ **Executor 最终仲裁**：专家只建议，真正执行和合并由当前 coding terminal 负责。
- ✅ **无意见规则**：没有真实意见就回复“无意见”，不硬造建议。
- ⏱️ **有边界等待**：不无限等 agent。
- 🛠️ **沉默 agent 及时修复**：检查投递/心跳，安全唤醒一次，仍失败就记录并继续。
- 🔒 **默认保护 secrets**：runtime、mailbox、token 不进 repo。
- 🔁 **带 rollback 意识交付**：重要任务必须说明验证和回滚。

## 和普通 prompt 有什么区别？

普通 prompt 往往让一个模型同时做 planner、critic、executor、release
manager。小任务还能撑住，任务一复杂就容易失控。

Roundtable 把流程拆清楚：

```text
用户目标 -> Lingtai 专家组 -> Executor 汇总取舍 -> 最小安全 diff -> 验证 -> 可回滚报告
```

它有效，是因为 Lingtai 提供 agent network，而 Roundtable 让每个参与者都有
明确角色、退出条件和责任边界。

## 30 秒看懂

```text
安全/隐私专家：合并前补一个负向 auth smoke。
发布可靠性专家：No opinion from my expert perspective.
范围控制专家：拒绝登录 UI 重设计，这超出当前 release gate。

Executor:
accepted: 负向 auth smoke
rejected: 登录 UI 重设计
verified: tests pass, diff scoped, rollback ready
```

如果 agent 沉默，Roundtable 会先诊断投递，而不是无限等待：

```text
$ ./scripts/check-lingtai-mailbox.sh
status: queued_outbox
orchestrator_state: asleep
```

完整示例：

- [examples/terminal-transcript.md](examples/terminal-transcript.md)
- [examples/sanitized-roundtable-run.md](examples/sanitized-roundtable-run.md)
- [examples/agent-roster-growth.md](examples/agent-roster-growth.md)
- [examples/executor-adapter-codex.md](examples/executor-adapter-codex.md)
- [examples/executor-adapter-claude-code.md](examples/executor-adapter-claude-code.md)

## 作为 Codex Skill 安装

从 GitHub 直接安装：

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-codex-skill.ps1"
```

或：

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-codex-skill.sh"
```

如果已经 clone 本 repo，也可以运行本地脚本：

```powershell
.\scripts\install-codex-skill.ps1
```

或：

```bash
./scripts/install-codex-skill.sh
```

这个脚本只安装 Codex skill 文件。Lingtai 仍然是必需 runtime，需要单独安装和配置。

然后这样触发：

```text
开启 Roundtable Skill 去完成这件事：<你的目标>
```

或：

```text
Use Roundtable Skill. Assign dynamic expert angles. If an expert has no concern, they must reply no opinion.
```

## 适合先用在哪些场景？

当任务重要到不适合只靠一个 agent 自说自话时，就适合开启 Roundtable：

- release gate
- 生产问题排查
- 数据库 / auth 改动
- 架构切片
- public launch readiness
- 安全 / 隐私复核
- 影响用户信任的产品流程

## Lingtai 设置

Roundtable Skill 需要 Lingtai 才能真正运行专家组。本 repo 不内置 Lingtai。

- Lingtai GitHub: <https://github.com/LingTai-AI/lingtai>
- 设置说明: [docs/LINGTAI_SETUP.md](docs/LINGTAI_SETUP.md)

检查本地是否具备 Roundtable 运行条件：

```powershell
.\scripts\check-roundtable.ps1
```

或：

```bash
./scripts/check-roundtable.sh
```

## 目录结构

```text
docs/
  SHOWCASE.md
  DEMO_SCRIPT.md
  COMPARISON.md
  ADOPTION.md
  USE_CASES.md
  AGENT_ROSTER_GUIDE.md
  TROUBLESHOOTING.md
  FAQ.md
  MAINTAINER_RELEASE.md
  PUBLIC_RELEASE_CHECKLIST.md
  GITHUB_LAUNCH_CHECKLIST.md
  LAUNCH_COPY.md
  POST_LAUNCH_ITERATION.md
  EXECUTOR_SETUP.md
  EXECUTOR_CONTRACT.md
  LINGTAI_SETUP.md
  ROUNDTABLE_PROTOCOL.md
  WHY_ROUNDTABLE.md
  ROADMAP.md
CHANGELOG.md
CONTRIBUTING.md
QUICKSTART.md
assets/
  roundtable-terminal-demo.svg
skills/
  codex/roundtable-skill/SKILL.md
templates/
  executor/roundtable-executor-prompt.md
  lingtai/agent-roster.example.md
  lingtai/request-template.md
  lingtai/roundtable-agent-template.md
scripts/
  install-codex-skill.ps1
  install-codex-skill.sh
  check-roundtable.ps1
  check-roundtable.sh
  check-lingtai-mailbox.ps1
  check-lingtai-mailbox.sh
examples/
  terminal-transcript.md
  sanitized-roundtable-run.md
  agent-roster-growth.md
  executor-adapter-codex.md
  executor-adapter-claude-code.md
  generic-product-goal.md
  release-gate-goal.md
```

## 核心规则

如果专家从自己的专家角度没有可执行意见，也必须回复：

```text
No opinion from my expert perspective.
```

沉默会被视为 runtime 问题：记录它，做一次有边界的安全修复，然后如果仍然不可用，
就继续任务并在报告中说明。

## 安全边界

不要提交：

- `.lingtai/`
- mailbox 文件
- OAuth token
- `codex-auth.json`
- private key
- log
- 项目 secrets
- runtime data

## License

MIT
