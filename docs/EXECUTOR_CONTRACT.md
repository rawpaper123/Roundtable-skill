# Executor Contract

The Executor is the coding terminal currently being used by the human.

Examples:

- Codex
- Claude Code
- Kimi Work
- Cursor
- Windsurf
- another agentic terminal

## Executor Responsibilities

The Executor owns:

- final scope interpretation
- user constraint enforcement
- implementation
- tests and verification
- Git state
- pull request creation
- merge/deploy steps when requested
- rollback plan
- final report

Roundtable agents are advisors. They do not directly control the repo unless
the user explicitly delegates execution to them.

## Non-Negotiables

The Executor must not let Roundtable advice override:

- explicit user constraints
- secret-handling rules
- production safety
- no-fake-success requirements
- API contracts
- data integrity
- rollback requirements

## Recommended Final Arbiter Rule

If experts disagree, the Executor chooses the smallest safe path that satisfies
the user goal and validation criteria. The final report should mention rejected
must-fix advice and why it was rejected.
