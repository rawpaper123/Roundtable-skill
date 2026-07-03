param(
    [switch]$RequireLingtai
)

$ErrorActionPreference = "Stop"

function Test-Command($Name) {
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

$repo = Get-Location
$hasGit = Test-Command "git"
$hasLingtai = Test-Command "lingtai"
$hasDotLingtai = Test-Path ".lingtai"
$skillPath = Join-Path $repo "skills/codex/roundtable-skill/SKILL.md"
$hasSkill = Test-Path $skillPath

$agents = @()
if ($hasDotLingtai) {
    $agents = Get-ChildItem -Path ".lingtai" -Recurse -Filter ".agent.json" -ErrorAction SilentlyContinue
}

Write-Host "Roundtable readiness"
Write-Host "repo: $repo"
Write-Host "git: $hasGit"
Write-Host "lingtai_cli: $hasLingtai"
Write-Host "dot_lingtai: $hasDotLingtai"
Write-Host "agent_manifests: $($agents.Count)"
Write-Host "codex_skill_present: $hasSkill"

if ($RequireLingtai -and (-not $hasLingtai -or -not $hasDotLingtai -or $agents.Count -lt 1)) {
    Write-Error "Lingtai is required but not ready. Install/configure Lingtai and create at least one agent."
}

if (-not $hasLingtai) {
    Write-Host "note: install Lingtai separately: https://github.com/LingTai-AI/lingtai"
}
