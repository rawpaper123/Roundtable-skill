# Troubleshooting

Use this when Roundtable does not start, agents do not reply, or a setup check
reports `docs_only`.

## 1. Check The Current Mode

From the target project root:

```powershell
C:\path\to\Roundtable-skill\scripts\check-roundtable.ps1 -RequireLingtai
```

or:

```bash
/path/to/Roundtable-skill/scripts/check-roundtable.sh --require-lingtai
```

Expected for a real Roundtable run:

```text
lingtai_cli: True
dot_lingtai: True
agent_manifests: 1
mode: operational_candidate
```

If the mode is `docs_only`, the repo can provide docs and templates only. Do not
claim real multi-agent execution.

## 2. Lingtai CLI Not Found

Symptom:

```text
lingtai_cli: False
```

Fix:

- install Lingtai from <https://github.com/LingTai-AI/lingtai>,
- reopen the terminal,
- verify `lingtai` or `lingtai-tui` is on `PATH`,
- rerun the readiness check.

Do not work around this by faking agent replies.

## 3. No `.lingtai/` Directory

Symptom:

```text
dot_lingtai: False
mode: docs_only
```

Fix:

- configure Lingtai in the target project,
- create or connect at least one real agent,
- rerun the readiness check from that target project root.

Do not commit `.lingtai/`.

## 4. OAuth Opens But Login Does Not Finish

Fix:

- complete the browser authorization,
- close the callback tab after success,
- rerun the Lingtai status or readiness command,
- if it still fails, restart only the Lingtai login/session flow.

Do not paste OAuth tokens, cookies, access keys, or auth JSON into prompts,
issues, logs, or commits.

## 5. Agent Does Not Reply

Run the mailbox diagnostic from the target project root:

```powershell
C:\path\to\Roundtable-skill\scripts\check-lingtai-mailbox.ps1
```

or:

```bash
/path/to/Roundtable-skill/scripts/check-lingtai-mailbox.sh
```

Then:

1. record the silent agent and assigned expert angle,
2. check process, heartbeat, and mailbox delivery,
3. wake or restart the orchestrator once if safe,
4. continue if the agent still does not answer.

Do not wait forever.

## 6. Expert Has No Advice

This is valid. The expert should reply:

```text
No opinion from my expert perspective.
```

Do not invent advice just to fill the panel.

## 7. Docs Workflow Fails

Common causes:

- broken local markdown link,
- merge marker,
- replacement character,
- committed `.lingtai/`, `.recipe/`, `.env`, `*.pem`, `*.key`, or `*.log`,
- missing required doc.

Run locally:

```powershell
git diff --check
.\scripts\check-roundtable.ps1
```

or:

```bash
git diff --check
./scripts/check-roundtable.sh
```

## 8. Windows Shows Garbled Chinese

PowerShell may render UTF-8 Chinese or emoji incorrectly even when the file is
valid. Trust the UTF-8 docs validation and GitHub rendering before rewriting
text.

## Still Stuck?

Open an issue with:

- operating system,
- Executor terminal,
- `check-roundtable` summary,
- whether `.lingtai/` exists,
- how many agent manifests were found,
- what you expected,
- what happened.

Do not include secrets, tokens, cookies, mailbox contents, or private runtime
data.
