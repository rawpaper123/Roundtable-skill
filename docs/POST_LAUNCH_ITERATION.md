# Post-Launch Iteration

Use this after Roundtable Skill is public and people start opening issues,
executor-adapter requests, docs suggestions, or runtime setup questions.

## Triage Buckets

| Bucket | Examples | Default response |
| --- | --- | --- |
| First-run blocker | install script fails, broken link, confusing setup step | Fix quickly |
| Runtime boundary confusion | user thinks Lingtai is bundled, user expects fake agents | Clarify docs |
| Executor adapter request | Cursor, Windsurf, Kimi Work, Claude Code, Codex variant | Add a small adapter doc |
| Lingtai integration issue | OAuth, mailbox, agent liveness | Link troubleshooting; fix docs/scripts only if reusable |
| Feature idea | hosted service, telemetry, agent marketplace | Record, do not build by default |
| Security/private-data issue | token, mailbox, logs, private runtime path | Treat as urgent |

## Weekly Loop

1. Review new issues.
2. Label by bucket.
3. Merge only small fixes that improve first-run success, safety, or clarity.
4. Reject or defer broad rewrites.
5. Update [CHANGELOG.md](../CHANGELOG.md) for user-visible changes.
6. Keep the latest Docs workflow green.

## Good Follow-Up Work

- clearer error messages in readiness scripts,
- better executor-specific prompt examples,
- more sanitized transcripts,
- tighter troubleshooting steps,
- link fixes,
- docs for real Lingtai setup patterns.

## Defer By Default

- bundled Lingtai runtime,
- hosted SaaS service,
- telemetry,
- broad plugin marketplace,
- automatic OAuth/token handling,
- agent auto-creation,
- private project templates.

These may be valid later, but they change the product boundary. Do not add them
as a quick response to one issue.

## Review Rule

Every accepted change should preserve:

- Lingtai is required and not bundled,
- agents advise only,
- the Executor owns implementation and rollback,
- no fake multi-agent claims,
- no committed runtime data or secrets.

## Release Criteria

Before tagging a release:

- [GITHUB_LAUNCH_CHECKLIST.md](GITHUB_LAUNCH_CHECKLIST.md) still passes,
- [PUBLIC_RELEASE_CHECKLIST.md](PUBLIC_RELEASE_CHECKLIST.md) still passes,
- latest Docs workflow on `main` is green,
- README first screen still matches the current behavior,
- rollback instructions are present.
