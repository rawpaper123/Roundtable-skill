# Lingtai 设置

[English](LINGTAI_SETUP.md) | 中文

Roundtable Skill 使用 Lingtai 作为多 Agent 的通信和运行时。

这个仓库不内置 Lingtai。Lingtai 仓库在这里：

<https://github.com/LingTai-AI/lingtai>

## 什么状态才算可用

Roundtable 真的可用，需要同时满足：

- 已安装 Lingtai runtime；
- 目标项目里存在 `.lingtai/`；
- 至少有一个真实 Agent；
- Agent 有 mailbox；
- Agent 能收到并回复 Roundtable 请求。

至少需要一个 Agent，不设上限。第一次使用不需要追求复杂阵容，先让一个 Agent 跑通更重要。

## Agent 角色怎么分配

角色按任务临时分配，不要把某个 Agent 永久绑定成某个专家。

常见方向：

- 发布可靠性；
- 产品信任；
- 安全与隐私；
- 数据一致性；
- 前端体验；
- 后端/API 合约；
- 文档和 runbook 清晰度；
- 反对者/范围控制审查。

这个仓库里的名字只是示例。真实使用时，用你本机或项目里的实际 Agent 名称。

## 不要提交这些文件

不要把 Lingtai 运行态提交进仓库：

- `.lingtai/`
- mailbox 内容；
- Agent 日志；
- OAuth token；
- auth JSON；
- 任何密钥。

## Readiness 检查

PowerShell:

```powershell
.\scripts\check-roundtable.ps1
```

Bash:

```bash
./scripts/check-roundtable.sh
```

检查脚本会报告：

- 是否能找到 `lingtai` 或 `lingtai-tui`；
- 当前目录是否有 `.lingtai/`；
- 找到了多少个 Agent manifest；
- 当前状态是 `docs_only` 还是 `operational_candidate`。

它不会自动安装 Lingtai，也不会自动创建 Agent。安装、OAuth 登录、Agent 创建都应该保持显式操作。

如果只想检查 mailbox 是否有投递问题，可以运行：

PowerShell:

```powershell
.\scripts\check-lingtai-mailbox.ps1
```

Bash:

```bash
./scripts/check-lingtai-mailbox.sh
```

## 常见问题

完整排查清单见 [问题排查](TROUBLESHOOTING.zh-CN.md)。

### human outbox 一直排队

如果请求一直停在 `.lingtai/human/mailbox/outbox/<uuid>/`，说明 orchestrator 还没有领取。

从项目根目录检查：

```bash
lingtai-tui list .
```

然后确认：

- orchestrator 进程存在；
- heartbeat 是新的；
- 没有 sleep 或 suspend；
- 消息是发给 orchestrator，而不是某个随机 worker。

只做有边界的修复：安全地唤醒或重启一次 orchestrator。如果仍然没有回复，就记录非响应 Agent，继续推进，不要无限等待。
