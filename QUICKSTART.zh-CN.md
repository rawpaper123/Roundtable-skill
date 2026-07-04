# 一键启动

[English](QUICKSTART.md) | 中文

目标：拿到 Roundtable 包，确认你的执行终端路径，检查 Lingtai 是否可用，并完成第一次真实圆桌运行。

## 0. 60 秒适配判断

安装前先问自己三件事：

1. 这个任务是否足够重要，值得让不同专家视角先审一遍？
2. 你是否已经配置好 Lingtai，或者愿意先配置它再声称“真实圆桌已运行”？
3. 是否有一个执行者负责最终判断、验证、提交和回滚？

如果答案是否定的，不要硬开 Roundtable。你可以先把这里当成提示词和流程参考；等任务真的涉及发布、安全、数据、架构、用户信任或重要决策时再启用。

## 1. 一键获取 Roundtable

先运行通用安装命令。检测到 Codex 时，会安装原生 Codex Skill；其他 coding agent 会拿到执行终端中立的协议提示词和 Lingtai 检查路径。

PowerShell:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-roundtable.ps1"
```

Bash:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-roundtable.sh"
```

如果你已经 clone 了这个仓库，也可以直接运行本地脚本：

```powershell
.\scripts\install-roundtable.ps1
```

```bash
./scripts/install-roundtable.sh
```

Roundtable 不假装所有 coding agent 都有同一种原生 Skill 格式。它提供的是：

- Codex 原生 Skill 安装路径；
- 其他执行终端可用的通用协议提示词；
- 所有执行者都共用的 Lingtai readiness 检查。

相关说明：

- [安装路径对照](docs/INSTALL_MATRIX.zh-CN.md)
- [执行者设置](docs/EXECUTOR_SETUP.md)
- [通用执行者提示词](templates/executor/roundtable-executor-prompt.md)
- [非 Codex 终端示例](examples/executor-neutral-terminals.md)

## 2. 在目标项目里检查 Lingtai

从你真正要使用 Roundtable 的项目根目录运行检查，不要只在 Roundtable-skill 仓库里检查。

PowerShell:

```powershell
cd C:\path\to\your-project
C:\path\to\Roundtable-skill\scripts\check-roundtable.ps1 -RequireLingtai
```

Bash:

```bash
cd /path/to/your-project
/path/to/Roundtable-skill/scripts/check-roundtable.sh --require-lingtai
```

理想结果：

```text
lingtai_cli: True
dot_lingtai: True
agent_manifests: 1
mode: operational_candidate
```

`agent_manifests` 可以大于 1。只有一个 Agent 也可以先开始。

如果结果是 `docs_only`：

- 不要伪造专家回复；
- 先看 [Lingtai 设置](docs/LINGTAI_SETUP.zh-CN.md)；
- 在目标项目里配置 Lingtai 和至少一个 Agent；
- 再重新运行 readiness 检查。

如果消息排队、Agent 沉默，按 [问题排查](docs/TROUBLESHOOTING.zh-CN.md) 处理。

## 3. 给执行者发出任务

把下面这类请求发给你当前使用的 coding agent 或执行终端：

```text
为这个任务开启 Roundtable：
合并前审查这个小改动是否可以发布。

执行者就是我现在使用的 coding terminal。
Lingtai agents 只提供建议；执行者负责最终实现、验证、Git 和回滚。

请按任务临时分配专家角度：
- 用户/信任视角：哪里会让用户感觉不对
- 证据视角：哪些检查能证明它安全
- 反对者视角：哪些建议应该被拒绝为过度设计

如果某个专家没有修改意见，必须明确回复“从我的专家角度看没有其他意见”。
```

一次合格的运行应该包含：专家回复、执行者综合、采纳/拒绝原因、验证结果和回滚方式。

## 4. 第一次运行应长什么样

成功的第一次 Roundtable 通常会报告：

- 请求了哪些 Lingtai Agent；
- 每个 Agent 被分配了什么临时专家角度；
- 哪些 Agent 回复了，哪些没有回复；
- 是否对沉默 Agent 做了一次安全修复；
- 执行者采纳了什么、拒绝了什么；
- 跑了哪些验证；
- 如果涉及代码，如何回滚。

如果缺少这些信息，先看 [首次运行检查](docs/FIRST_RUN_CHECKLIST.zh-CN.md)。
