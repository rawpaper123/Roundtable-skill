# Changelog

## Unreleased

README language navigation polish.

- Changed the top Chinese link in the English README to jump to an in-page
  Chinese overview instead of sending users directly to the `README.zh-CN.md`
  blob page.
- Kept the full Chinese README and Chinese setup docs linked from that overview.
- Replaced public README tech-stack lists with a clearer explanation of how
  Roundtable actually runs.
- Replaced long homepage install commands with a one-line start prompt that can
  be handed to any coding agent.

## v0.1.14

Ancient-style visual refresh and use-case rewrite.

- Replaced the modern character assets with ancient-style Roundtable visuals.
- Added English and Chinese expert-roster images so README screenshots use the
  right language for the selected README.
- Split the eight expert heads into transparent role icons for scenario tables.
- Reworked README use cases from prompt blocks into visual scenario logic:
  Executor chooses the expert panel; users do not hand-pick roles.
- Used the transparent expert heads inside the scenario table to make common
  lead and supporting perspectives easier to scan.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.13

README hero copy polish.

- Updated the English README hero to use a memorable product positioning line:
  "Your AI expert roundtable."
- Updated the Chinese README hero to match the same structure with a native
  positioning line and short explanatory sentence.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.12

Chinese docs and role roster polish.

- Added a Roundtable agent roster image to explain temporary, task-specific
  expert role assignment.
- Added a transparent Roundtable avatar image for the centered README header.
- Linked the roster from README, Chinese README, and the protocol docs.
- Added Chinese versions of Quickstart, Lingtai setup, install matrix,
  first-run checklist, and troubleshooting so the Chinese README no longer
  routes first-time users into English-only setup pages.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.11

Roundtable positioning rewrite.

- Reframed README and Chinese README around the roundtable metaphor,
  temporary task-specific expert roles, and one accountable Executor.
- Added universal setup wrappers so the first Quickstart path is Executor
  neutral: Codex can install a native skill, while other coding agents get the
  protocol prompt and readiness path.
- Added CI and maintainer smoke coverage for the universal installer wrapper.
- Added visual README assets that explain the expert roundtable, role
  collision, and blind-spot mapping concepts.
- Upgraded the Roundtable protocol with expert-angle design rules so normal
  tasks stay lightweight but still use useful, complementary perspectives.
- Added a dedicated research mode for multi-perspective scan, contradiction
  mapping, synthesis brief, and peer review without making that heavy workflow
  mandatory for every task.
- Expanded examples beyond development into research, daily decisions,
  business plans, product strategy, and public writing.
- Updated the Codex skill contract so Roundtable can produce a bounded
  implementation plan, research brief, decision memo, or public narrative.
- Updated launch copy and GitHub launch checklist to match the broader
  multi-perspective workflow positioning.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.10

Installer smoke release-process polish.

- Added temporary `CODEX_HOME` Codex installer smoke checks to the maintainer
  release runbook.
- Added installer smoke coverage to the GitHub launch checklist.
- Verified both PowerShell and bash install paths without touching the real
  local Codex setup.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.9

First-run fit-check polish.

- Added a 60-second fit check at the top of Quickstart so users decide whether
  Roundtable is appropriate before installing or running anything.
- Updated README and Chinese README first-screen copy to point new users to
  the Quickstart fit check.
- Updated the GitHub launch checklist to cover the fit-check entry point.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.8

Launch conversion polish.

- Added README guidance for when to use Roundtable and when to skip it.
- Added matching Chinese README guidance for the same use/skip decision.
- Added Product Hunt / directory submission copy to the launch copy pack.
- Updated the GitHub launch checklist to cover first-screen use/skip clarity
  and directory submission fields.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.7

First-run support polish.

- Made Quickstart explicitly executor-neutral instead of implying Codex is the
  only supported Executor.
- Added the `docs_only` recovery path to Quickstart so users know to configure
  Lingtai and at least one agent before claiming a real Roundtable run.
- Added a setup help issue template for install, readiness, and first-run
  blockers without asking users to paste secrets or private runtime data.
- Created and linked a welcome/setup discussion for public setup questions and
  first Roundtable run reports.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.6

Public community readiness polish.

- Linked executor-neutral terminal examples from the main onboarding paths.
- Grouped README and Chinese README first-screen links by user intent so new
  users have a clearer path from quickstart to safe operation.
- Added a Code of Conduct and included it in docs validation.
- Enabled GitHub Discussions for community questions and setup help.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.5

Install matrix polish.

- Added an install matrix for Codex, Claude Code, Cursor, Windsurf, Kimi Work,
  and other coding terminals.
- Linked the install matrix from README, Chinese README, Quickstart, Executor
  setup, and GitHub launch checklist.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.4

README demo cast polish.

- Added a new terminal-style SVG demo cast for the README first screen.
- Swapped the README and Chinese README preview image to the new demo cast.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

## v0.1.3

First-run adoption polish.

- Added a first-run checklist for deciding whether Roundtable is operational,
  docs-only, or blocked.
- Linked the first-run checklist from README, Chinese README, Quickstart, and
  the GitHub launch checklist.
- Made Quickstart start with the Executor choice instead of reading like a
  Codex-only path.

Roundtable Skill still requires Lingtai as the agent runtime. This repository
does not bundle Lingtai or claim real multi-agent execution without Lingtai
configured.

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
