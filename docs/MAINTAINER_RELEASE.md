# Maintainer Release Runbook

Use this before tagging a public Roundtable Skill release.

Roundtable is docs, templates, scripts, and a Codex skill package. It is not a
hosted service and does not bundle Lingtai.

## 1. Start Clean

```bash
git switch main
git pull --ff-only origin main
git status --short
```

`git status --short` must be empty.

## 2. Run Local Checks

PowerShell:

```powershell
.\scripts\check-roundtable.ps1
git diff --check
git ls-files | Select-String -Pattern '(^|/)(\.lingtai|\.recipe)(/|$)|(^|/)(codex-auth\.json|\.env)$|(\.pem|\.key|\.log)$|(^|/)mailbox(/|$)'
```

Bash:

```bash
./scripts/check-roundtable.sh
git diff --check
git ls-files | grep -E '(^|/)(\.lingtai|\.recipe)(/|$)|(^|/)(codex-auth\.json|\.env)$|(\.pem|\.key|\.log)$|(^|/)mailbox(/|$)' || true
```

The sensitive-path scan should not show committed runtime or secret files.

Run the universal installer against a temporary `CODEX_HOME` so the public
install path is smoke-tested without touching your real Codex setup.

PowerShell:

```powershell
$root = Join-Path $env:TEMP ("roundtable-install-smoke-" + [guid]::NewGuid().ToString("N"))
$env:CODEX_HOME = Join-Path $root "codex-home"
.\scripts\install-roundtable.ps1 -Executor codex
Test-Path (Join-Path $env:CODEX_HOME "skills\roundtable-skill\SKILL.md")
Remove-Item Env:\CODEX_HOME
Remove-Item -Recurse -Force $root
```

Bash:

```bash
root="$(mktemp -d)"
CODEX_HOME="$root/codex-home" ./scripts/install-roundtable.sh codex
test -f "$root/codex-home/skills/roundtable-skill/SKILL.md"
rm -rf "$root"
```

## 3. Confirm GitHub Actions

```bash
gh run list --repo rawpaper123/Roundtable-skill --workflow Docs --limit 1
```

The latest run on `main` must be `completed` with `success`.

## 4. Update Release Notes

Update [CHANGELOG.md](../CHANGELOG.md) before tagging.

Keep release notes specific:

- what changed,
- what did not change,
- whether Lingtai setup requirements changed,
- rollback notes if relevant.

## 5. Tag

Only tag after local checks and the Docs workflow pass.

```bash
git tag -a vX.Y.Z -m "vX.Y.Z"
git push origin vX.Y.Z
```

## 6. Create GitHub Release

```bash
gh release create vX.Y.Z --repo rawpaper123/Roundtable-skill --notes-from-tag
```

Do not include secrets, local paths, mailbox contents, or private project names
in release notes.

## 7. Rollback

If a bad release was published:

```bash
gh release delete vX.Y.Z --repo rawpaper123/Roundtable-skill --yes
git push origin :refs/tags/vX.Y.Z
git tag -d vX.Y.Z
```

If private material was pushed, rotate exposed credentials first, then follow
[PUBLIC_RELEASE_CHECKLIST.md](PUBLIC_RELEASE_CHECKLIST.md).
