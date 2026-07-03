# Quickstart

Goal: clone, install, verify Lingtai, and run your first Roundtable in about 5
minutes.

## 1. Clone

```bash
git clone https://github.com/rawpaper123/Roundtable-skill.git
cd Roundtable-skill
```

## 2. Install The Codex Skill

```powershell
.\scripts\install-codex-skill.ps1
```

or:

```bash
./scripts/install-codex-skill.sh
```

This only installs the Codex skill files. Lingtai is still required.

## 3. Verify Lingtai In Your Target Project

```powershell
cd C:\path\to\your-project
C:\path\to\Roundtable-skill\scripts\check-roundtable.ps1 -RequireLingtai
```

or:

```bash
cd /path/to/your-project
/path/to/Roundtable-skill/scripts/check-roundtable.sh --require-lingtai
```

Expected: `lingtai_cli: true`, `dot_lingtai: true`, and `agent_manifests: 1`
or more.

## 4. Ask Codex

```text
Open Roundtable Skill for this task:
review this one-line change before I ship it.

Assign expert angles:
- product trust
- security/privacy
- adversarial scope review

If an expert has no actionable concern, they must reply no opinion.
```

You should see Lingtai expert replies, Executor synthesis, validation, and
rollback.

中文：这个流程只安装 Codex skill。Roundtable 真正运行仍然需要 Lingtai、`.lingtai/`
和至少一个 agent。
