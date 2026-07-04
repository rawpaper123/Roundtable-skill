# 安装路径对照

[English](INSTALL_MATRIX.md) | 中文

用这页判断你的 coding terminal 应该走哪条路径。

Roundtable Skill 有两层：

1. **Lingtai**：必须存在的专家 Agent 运行时。
2. **执行者**：你正在使用的 coding terminal，比如 Codex、Claude Code、Cursor、Windsurf、Kimi Work 等。

这个仓库不内置 Lingtai，也不会自动创建 Agent。

## 路径对照

| 执行者 | 推荐路径 | 现在能自动做什么 | 仍需手动完成什么 |
| --- | --- | --- | --- |
| Codex | 运行 `scripts/install-roundtable.*` 或 `scripts/install-codex-skill.*` | 安装 Codex Skill 文件 | Lingtai 安装、OAuth/login、Agent 阵容、专家角度分配 |
| Claude Code | 运行 `scripts/install-roundtable.*`，再使用通用提示词或 Claude adapter | 拉取仓库、给出提示词路径、给出 readiness 路径 | 原生 Claude adapter、Lingtai 设置、粘贴提示词、执行者纪律 |
| Cursor | 运行 `scripts/install-roundtable.*`，再使用通用提示词 | 拉取仓库、给出提示词路径、给出 readiness 路径 | 原生 Cursor adapter、Lingtai 设置、粘贴提示词、执行者纪律 |
| Windsurf | 运行 `scripts/install-roundtable.*`，再使用通用提示词 | 拉取仓库、给出提示词路径、给出 readiness 路径 | 原生 Windsurf adapter、Lingtai 设置、粘贴提示词、执行者纪律 |
| Kimi Work | 运行 `scripts/install-roundtable.*`，再使用通用提示词 | 拉取仓库、给出提示词路径、给出 readiness 路径 | 原生 Kimi Work adapter、Lingtai 设置、粘贴提示词、执行者纪律 |
| 其他 coding terminal | 运行 `scripts/install-roundtable.*`，再使用通用提示词 | 拉取仓库、给出提示词路径、给出 readiness 路径 | 该终端自己的原生 adapter、Lingtai 设置、粘贴提示词、执行者纪律 |

## 通用最快路径

PowerShell:

```powershell
$rt = Join-Path $env:TEMP "Roundtable-skill"; Remove-Item -Recurse -Force $rt -ErrorAction SilentlyContinue; git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git $rt; & "$rt\scripts\install-roundtable.ps1"
```

Bash:

```bash
tmp="$(mktemp -d)" && git clone --depth 1 https://github.com/rawpaper123/Roundtable-skill.git "$tmp/Roundtable-skill" && "$tmp/Roundtable-skill/scripts/install-roundtable.sh"
```

这条命令不会假装所有 coding agent 都共享同一种原生 Skill 格式。它会在可用时安装 Codex Skill；其他执行者则使用通用协议提示词和 readiness 检查路径。

## 非 Codex 路径

把通用执行者提示词复制到你的 coding terminal：

- [roundtable-executor-prompt.md](../templates/executor/roundtable-executor-prompt.md)
- [executor-neutral-terminals.md](../examples/executor-neutral-terminals.md)

然后在目标项目里检查 Lingtai：

```text
mode: operational_candidate
```

如果目标项目仍是 `docs_only`，不要声称已经运行真实专家组。

## 下一步

- 第一次安装：[一键启动](../QUICKSTART.zh-CN.md)
- 运行时设置：[Lingtai 设置](LINGTAI_SETUP.zh-CN.md)
- 执行者合约：[EXECUTOR_SETUP.md](EXECUTOR_SETUP.md)
- 通过/失败判断：[首次运行检查](FIRST_RUN_CHECKLIST.zh-CN.md)
