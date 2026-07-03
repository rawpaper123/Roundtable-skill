# Example: Executor-Neutral Prompts

## Codex

```text
Open Roundtable Skill for this task: <goal>
Executor is Codex. Use Lingtai agents as the Roundtable runtime.
If Lingtai is not configured, stop and run setup first.
```

## Claude Code

```text
Use the Roundtable protocol for this task: <goal>
Executor is Claude Code. Lingtai agents advise; Claude Code executes.
If Lingtai is not configured, stop and run setup first.
```

## Kimi Work

```text
Run a Roundtable expert review for this task: <goal>
Executor is Kimi Work. Lingtai agents advise; Kimi Work executes and verifies.
If Lingtai is not configured, stop and run setup first.
```

## Cursor / Windsurf

```text
Use Roundtable Skill as the planning and review loop for: <goal>
Executor is this IDE agent. Lingtai agents advise; this IDE agent executes.
If Lingtai is not configured, stop and run setup first.
```
