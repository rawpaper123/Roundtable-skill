param(
  [ValidateSet("auto", "codex", "generic")]
  [string]$Executor = "auto"
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir "..")

Write-Host "Roundtable Skill setup"
Write-Host "Repo: $RepoRoot"

$codexAvailable = $null -ne (Get-Command codex -ErrorAction SilentlyContinue)
$installCodex = $Executor -eq "codex" -or ($Executor -eq "auto" -and $codexAvailable)

if ($installCodex) {
  Write-Host "Detected Codex path. Installing native Codex skill..."
  & (Join-Path $ScriptDir "install-codex-skill.ps1")
  Write-Host "Codex skill install: complete"
} else {
  Write-Host "Native Codex install: skipped"
}

Write-Host ""
Write-Host "Next:"
Write-Host "1. Configure Lingtai in your target project."
Write-Host "2. Run the readiness check from that project:"
Write-Host "   $RepoRoot\scripts\check-roundtable.ps1 -RequireLingtai"
Write-Host "3. If your Executor is not Codex, paste this protocol prompt into it:"
Write-Host "   $RepoRoot\templates\executor\roundtable-executor-prompt.md"
Write-Host ""
Write-Host "Do not claim a real Roundtable run until Lingtai agents are reachable."
