# 问题排查

[English](TROUBLESHOOTING.md) | 中文

当 Roundtable 启动不了、Agent 不回复、或者检查结果是 `docs_only` 时，从这里开始。

## 1. 先看当前模式

从目标项目根目录运行：

```powershell
C:\path\to\Roundtable-skill\scripts\check-roundtable.ps1 -RequireLingtai
```

或者：

```bash
/path/to/Roundtable-skill/scripts/check-roundtable.sh --require-lingtai
```

真实可运行的结果应该类似：

```text
lingtai_cli: True
dot_lingtai: True
agent_manifests: 1
mode: operational_candidate
```

如果是 `docs_only`，这个仓库只能提供文档、模板和提示词。不要声称已经完成真实多 Agent 运行。

## 2. 找不到 Lingtai CLI

现象：

```text
lingtai_cli: False
```

处理：

- 从 <https://github.com/LingTai-AI/lingtai> 安装 Lingtai；
- 重新打开终端；
- 确认 `lingtai` 或 `lingtai-tui` 在 `PATH` 里；
- 重新运行 readiness 检查。

不要用编造专家回复来绕过这个问题。

## 3. 没有 `.lingtai/`

现象：

```text
dot_lingtai: False
mode: docs_only
```

处理：

- 在目标项目里配置 Lingtai；
- 创建或连接至少一个真实 Agent；
- 从目标项目根目录重新运行检查。

不要提交 `.lingtai/`。

## 4. OAuth 打开了，但登录没完成

处理：

- 在浏览器里完成授权；
- 看到 callback 成功后关闭页面；
- 重新运行 Lingtai 状态或 readiness 命令；
- 如果仍失败，只重启 Lingtai 登录/session 流程。

不要把 OAuth token、cookie、access key 或 auth JSON 粘贴到 prompt、issue、日志或 commit 里。

## 5. Agent 没有回复

从目标项目根目录运行 mailbox 诊断：

```powershell
C:\path\to\Roundtable-skill\scripts\check-lingtai-mailbox.ps1
```

或者：

```bash
/path/to/Roundtable-skill/scripts/check-lingtai-mailbox.sh
```

然后：

1. 记录沉默 Agent 和它被分配的专家角度；
2. 检查进程、heartbeat 和 mailbox 投递；
3. 如果安全，唤醒或重启 orchestrator 一次；
4. 如果仍然不回复，记录问题并继续推进。

不要无限等待。

## 6. 专家没有意见

这是有效结果。专家可以回复：

```text
No opinion from my expert perspective.
```

或者中文：

```text
从我这个专家角度看，没有其他修改意见。
```

不要为了“看起来热闹”而硬编建议。

## 7. Docs workflow 失败

常见原因：

- 本地 Markdown 链接断了；
- 有 merge marker；
- 有 UTF-8 replacement character；
- 提交了 `.lingtai/`、`.recipe/`、`.env`、`*.pem`、`*.key` 或 `*.log`；
- 缺少必需文档。

本地运行：

```powershell
git diff --check
.\scripts\check-roundtable.ps1
```

或者：

```bash
git diff --check
./scripts/check-roundtable.sh
```

## 8. Windows 里中文显示乱码

PowerShell 有时会把 UTF-8 中文或 emoji 显示成乱码，但文件本身仍然是正确的。先看 GitHub 页面和文档校验结果，不要因为终端显示问题重写文本。

## 仍然卡住？

公开问题可以去 [Welcome discussion](https://github.com/rawpaper123/Roundtable-skill/discussions/1)。

如果是首次配置 blocker，可以开一个 [`Setup help` issue](https://github.com/rawpaper123/Roundtable-skill/issues/new?template=setup_help.md)，并提供：

- 操作系统；
- 使用的执行终端；
- `check-roundtable` 摘要；
- 是否存在 `.lingtai/`；
- 找到多少个 Agent manifest；
- 你预期发生什么；
- 实际发生什么。

不要提交 secrets、token、cookie、mailbox 正文或私有运行态数据。
