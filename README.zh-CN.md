# Roundtable Skill 🪑

中文 | [English](README.md)

把专家组带进你的 coding terminal。

![Roundtable Skill terminal preview](assets/roundtable-terminal-demo.svg)

**第一次使用？从 [QUICKSTART.md](QUICKSTART.md) 开始。**

[Install](#作为-codex-skill-安装) · [Quickstart](QUICKSTART.md) ·
[Demo](examples/sanitized-roundtable-run.md) ·
[Why Roundtable?](docs/WHY_ROUNDTABLE.md) ·
[Executor setup](docs/EXECUTOR_SETUP.md) · [Roadmap](docs/ROADMAP.md) ·
[Release notes](CHANGELOG.md) · [Contributing](CONTRIBUTING.md)

Roundtable Skill 是一个 executor-neutral 的工程协作工作流。它把你正在使用的
coding terminal 变成一个有纪律的 **planner + reviewer + executor loop**：
先让专家组从不同角度指出问题，再由当前 coding terminal 汇总、取舍、实现、
验证和准备回滚。

当前正在被用户使用的 coding terminal 是 **Executor**。它可以是 Codex、
Claude Code、Kimi Work、Cursor、Windsurf，或者其他 agentic coding
terminal。Executor 负责最终实现、验证、Git、PR、部署和回滚；Roundtable
agents 负责从不同专家角度给出计划、质疑和复核意见。

Roundtable Skill 建立在 [Lingtai](https://github.com/LingTai-AI/lingtai)
agent runtime 之上。本 repo 不内置 Lingtai。没有配置 Lingtai 时，这个 repo
只能作为协议/模板参考，不能算一个可运行的多 agent Roundtable。

## 为什么值得用？

很多 AI coding 失败，不是代码语法失败，而是协作流程失败：

- planner 把任务越扩越大；
- reviewer 为了显得有用，硬造修改意见；
- executor 没有验证生产现实就说完成；
- 某个 agent 沉默后，整个流程卡死；
- 没有人真正负责 rollback。

Roundtable Skill 用一个很小的协议解决这些问题：

- 🧭 **动态专家角色**：每次任务重新分配专家方向，不把 agent 永久绑定到某个身份。
- 🧑‍⚖️ **Executor 最终仲裁**：专家只建议，真正执行和合并由当前 coding terminal 负责。
- ✅ **无意见规则**：没有真实意见就回复“无意见”，不要硬造建议。
- ⏱️ **有边界等待**：不无限等 agent。
- 🛠️ **沉默 agent 及时修复**：检查投递/心跳，安全唤醒一次，仍失败就记录并继续。
- 🔒 **默认保护 secrets**：runtime、mailbox、token 不进 repo。
- 🔁 **带 rollback 意识交付**：重要任务必须说明验证和回滚。

## 为什么不用普通 prompt？

普通 prompt 往往让一个模型同时做 planner、critic、executor、release manager。
小任务还可以，任务一复杂就容易失控。

Roundtable 把流程拆清楚：

```text
用户目标 -> 专家组意见 -> Executor 汇总取舍 -> 实现 -> 验证 -> 可回滚报告
```

它简单，是因为协议很小，最终执行仍然留在你正在用的 coding terminal。
它有效，是因为 Lingtai 提供 agent network，而 Roundtable 让每个参与者都有明确角色和退出条件。

## 30 秒看懂它怎么跑

这个 loop 应该一眼就能看懂：

```text
用户目标 -> Lingtai 专家组 -> Executor 汇总取舍 -> 最小安全 diff -> 验证 -> 可回滚报告
```

```text
安全/隐私专家：合并前补一个负向 auth smoke。
发布可靠性专家：No opinion from my expert perspective.
范围控制专家：拒绝登录 UI 重设计，这超出当前范围。

Executor:
采纳：负向 auth smoke
拒绝：登录 UI 重设计
验证：测试通过，diff 范围干净，rollback 已准备
```

如果 agent 沉默，Roundtable 会先诊断投递，而不是无限等待：

```text
$ ./scripts/check-lingtai-mailbox.sh
status: queued_outbox
orchestrator_state: asleep
```

完整脱敏示例：

- [examples/terminal-transcript.md](examples/terminal-transcript.md)
- [examples/sanitized-roundtable-run.md](examples/sanitized-roundtable-run.md)

## 它解决什么问题

- 给可用 agents 动态分配专家方向。
- 让专家输出简短、可执行的 planner / reviewer 意见。
- 要求“没有意见”也必须回复，避免硬造建议。
- 对未响应 agent 做有边界的等待和一次最小修复尝试。
- 保持 Executor 是最终执行者和仲裁者。
- 明确保护 scope、secrets、Git hygiene 和 rollback。

## 作为 Codex Skill 安装

从 GitHub 直接安装：

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-codex-skill.ps1"
```

或：

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-codex-skill.sh"
```

如果你已经 clone 了本 repo，也可以运行本地脚本：

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

## 最适合先用在哪些场景？

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
请单独安装和配置：

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
  generic-product-goal.md
  release-gate-goal.md
```

## 核心规则

如果专家从自己的专家角度没有可执行意见，也必须回复：

```text
No opinion from my expert perspective.
```

沉默会被视为 runtime 问题：记录它，做一次有边界的安全修复，然后如果仍然不可用，就继续任务并在报告中说明。

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
