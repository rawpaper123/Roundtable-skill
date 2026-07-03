# Security Policy

## Reporting

Please open a GitHub issue for public security concerns that do not include
secrets or private runtime data.

Do not paste:

- API keys
- OAuth tokens
- private keys
- mailbox contents
- `.lingtai/` runtime files
- user data
- private project paths

If a report requires private material, first open a minimal issue asking for a
secure contact path.

## Scope

Roundtable Skill is a workflow skill and template set. It does not bundle
Lingtai, store credentials, run hosted services, or require secrets.

Security-sensitive areas:

- accidental secret leakage in examples or docs
- unsafe install instructions
- committing runtime agent state
- misleading claims about automatic multi-agent execution without an agent runtime

## Maintainer Checklist

Before publishing a release:

- run the public release checklist,
- inspect tracked files,
- confirm no `.lingtai/` or mailbox files are tracked,
- confirm no auth files or env files are tracked,
- confirm examples use placeholders only.
