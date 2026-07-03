# Public Release Checklist

Run this before pushing Roundtable Skill to a public repository.

## Scope

- Repository is independent from private product repos.
- Git history starts from this public package only.
- No `.lingtai/`, mailbox, logs, runtime data, env files, or auth files.
- README has both English and Chinese entry points.
- Lingtai is linked as the required external agent runtime, not bundled.
- Install/setup instructions do not silently install third-party tools.

## Checks

PowerShell:

```powershell
.\scripts\check-roundtable.ps1
git status --short
git ls-files
git grep -n "PRIVATE_REPO\\|PRIVATE_PATH\\|codex-auth\\|access_token\\|DATABASE_URL\\|OPENAI_API_KEY\\|API_KEY\\|SECRET_KEY" -- .
```

Bash:

```bash
./scripts/check-roundtable.sh
git status --short
git ls-files
git grep -n "PRIVATE_REPO\\|PRIVATE_PATH\\|codex-auth\\|access_token\\|DATABASE_URL\\|OPENAI_API_KEY\\|API_KEY\\|SECRET_KEY" -- .
```

The grep commands should find no real secrets or private project references.
They may match public safety documentation that tells users what not to commit.

## Rollback

If private material is pushed:

1. make the repo private or delete it,
2. rotate any exposed credentials,
3. rewrite history only after credentials are rotated,
4. republish from a clean tree.
