$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$Source = Join-Path $RepoRoot "skills\codex\roundtable-skill"
$CodexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME ".codex" }
$Dest = Join-Path $CodexHome "skills\roundtable-skill"

if (-not (Test-Path $Source)) {
    throw "Missing source skill: $Source"
}

New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Dest) | Out-Null

if (Test-Path $Dest) {
    $Backup = "$Dest.bak-$(Get-Date -Format yyyyMMddHHmmss)"
    Move-Item -LiteralPath $Dest -Destination $Backup
    Write-Host "backup: $Backup"
}

Copy-Item -Recurse -LiteralPath $Source -Destination $Dest
Write-Host "installed: $Dest"
Write-Host "note: Lingtai must be installed and configured separately."
Write-Host "next: ask Codex to 'Open Roundtable Skill for this task: <goal>'"
