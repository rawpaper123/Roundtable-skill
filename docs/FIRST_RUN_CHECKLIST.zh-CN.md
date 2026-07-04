# 首次运行检查

[English](FIRST_RUN_CHECKLIST.md) | 中文

完成 [一键启动](../QUICKSTART.zh-CN.md) 后，用这份清单判断 Roundtable 到底是已经可运行、仍是 docs-only，还是被某个环节卡住。

## 1. 选对目标项目

从你希望专家组审查的项目根目录运行检查。不要只在 Roundtable-skill 仓库里检查，除非它就是你的目标项目。

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

## 2. 可运行状态

看到下面这种结果，才算可以开始真实 Roundtable：

```text
lingtai_cli: True
dot_lingtai: True
agent_manifests: 1
mode: operational_candidate
```

`agent_manifests` 可以大于 1。只有一个 Agent 也可以先跑通流程。

## 3. Docs-only 状态

如果检查结果是 `mode: docs_only`，不要伪造专家回复。

你仍然可以参考：

- [ROUNDTABLE_PROTOCOL.md](ROUNDTABLE_PROTOCOL.md)
- [EXECUTOR_SETUP.md](EXECUTOR_SETUP.md)
- [roundtable-executor-prompt.md](../templates/executor/roundtable-executor-prompt.md)

但真实专家组需要 Lingtai、目标项目里的 `.lingtai/`，以及至少一个 Agent。

## 4. 第一次适合做什么任务

先选低风险但真实的任务：

```text
为这个小 PR 开启 Roundtable。

临时专家角度：
- 发布可靠性
- 安全与隐私
- 反对者/范围控制

如果某个专家没有修改意见，必须明确回复没有意见。
```

第一次不要拿生产部署、数据库迁移、密钥操作或数据删除来试。

## 5. 成功输出应该包含什么

一次好的首次运行应该包含：

- 请求了哪些 Agent；
- 每个 Agent 的临时专家角度；
- 哪些回复了，哪些没有回复；
- 对沉默 Agent 是否做了一次安全修复；
- 执行者综合；
- 采纳了哪些建议；
- 拒绝了哪些越界建议；
- 验证命令和结果；
- Git 状态；
- 回滚方式。

## 6. 什么时候应该停下来修

出现下面任意情况，不要声称 Roundtable 已经可用：

- 找不到 Lingtai CLI；
- 目标项目没有 `.lingtai/`；
- 没有 Agent manifest；
- 所有 Agent 在一次有边界修复后仍然沉默；
- 执行者编造了 Agent 回复；
- 最终报告没有验证；
- 涉及代码但没有回滚说明。

下一步看 [问题排查](TROUBLESHOOTING.zh-CN.md)。
