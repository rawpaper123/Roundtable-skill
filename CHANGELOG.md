# Changelog

## v0.1.2

Public adoption polish.

- Added copy/paste launch copy for GitHub, X, LinkedIn, Hacker News, and
  developer communities.
- Linked launch copy from the README, Chinese README, and GitHub launch
  checklist.
- Clarified Quickstart for non-Codex Executors such as Claude Code, Cursor,
  Windsurf, and Kimi Work.
- Added the local PowerShell Codex skill installer command to Quickstart.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.1

Public launch readiness polish.

- Sharper README pitch, badges, and first-screen explanation.
- More launch docs: demo script, comparison guide, troubleshooting guide, GitHub launch checklist, and post-launch iteration runbook.
- Executor adapter examples for Codex and Claude Code.
- Generic executor prompt template for non-Codex coding terminals.
- Expanded contributing guidance, issue templates, and pull request template.
- Docs workflow now validates docs, examples, templates, issue templates, PR template, links, merge markers, and secret-like runtime paths.
- GitHub repository metadata updated for discoverability.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai, create agents automatically, or claim real multi-agent
execution without Lingtai configured.

## v0.1.0

Initial public release.

- Lingtai-based Roundtable protocol for coding terminals.
- Executor-neutral contract for Codex, Claude Code, Cursor, Windsurf, Kimi Work, and similar terminals.
- Codex skill package under `skills/codex/roundtable-skill`.
- PowerShell and bash Codex install scripts.
- Quickstart, Lingtai setup guide, release checklist, security notes, templates, and examples.
- Sanitized end-to-end Roundtable run example.
- README terminal preview SVG.

Roundtable Skill requires Lingtai as the agent runtime. This repository does
not bundle Lingtai or create agents automatically.
