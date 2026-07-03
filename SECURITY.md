# Security Policy

Roundtable Skill is a workflow skill, docs, templates, and install helpers.

It does not bundle Lingtai, run a hosted service, collect telemetry, store
credentials, or require users to paste secrets into this repository.

## Reporting

Open a GitHub issue for public security concerns that do not include secrets or
private runtime data.

Do not paste:

- API keys
- OAuth tokens
- private keys
- cookies
- database URLs
- mailbox contents
- `.lingtai/` runtime files
- `codex-auth.json`
- user data
- private project paths

If a report requires private material, open a minimal issue asking for a secure
contact path first.

## What Should Never Be Committed

- `.lingtai/`
- `.recipe/`
- mailbox files
- agent logs
- OAuth tokens
- auth JSON files
- `.env`
- private keys
- runtime data

## Install Script Boundary

The Codex install scripts copy the Roundtable skill files into the local Codex
skills directory. They do not install Lingtai, create agents, request secrets,
or configure model/provider credentials.

Lingtai setup is explicit and external:

- Lingtai repo: <https://github.com/LingTai-AI/lingtai>
- Setup guide: [docs/LINGTAI_SETUP.md](docs/LINGTAI_SETUP.md)

## Security-Sensitive Areas

- accidental secret leakage in examples or docs
- unsafe install instructions
- committing runtime agent state
- misleading claims about automatic multi-agent execution without Lingtai
- scripts that write outside the intended local skill directory

## Maintainer Checklist

Before publishing a release:

- run the Docs GitHub Action,
- run `scripts/check-roundtable.*`,
- inspect tracked files,
- confirm no `.lingtai/`, `.recipe/`, mailbox, auth, env, key, or log files are tracked,
- confirm examples use placeholders only,
- confirm README wording does not claim Roundtable works without Lingtai.
