param(
    [string]$Path = "."
)

$ErrorActionPreference = "Stop"

function Count-Dirs($Path) {
    if (-not (Test-Path $Path)) { return 0 }
    return @(Get-ChildItem -LiteralPath $Path -Directory -ErrorAction SilentlyContinue).Count
}

function Oldest-Age-Minutes($Path) {
    if (-not (Test-Path $Path)) { return "" }
    $oldest = Get-ChildItem -LiteralPath $Path -Directory -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime |
        Select-Object -First 1
    if ($null -eq $oldest) { return "" }
    return [math]::Round(((Get-Date) - $oldest.LastWriteTime).TotalMinutes, 1)
}

$root = (Resolve-Path $Path).Path
$lingtai = Join-Path $root ".lingtai"

Write-Host "Roundtable mailbox"
Write-Host "repo: $root"

if (-not (Test-Path $lingtai)) {
    Write-Host "dot_lingtai: False"
    Write-Host "status: not_configured"
    Write-Host "note: no .lingtai directory; mailbox delivery cannot run here."
    exit 0
}

$mailbox = Join-Path $lingtai "human/mailbox"
$outbox = Join-Path $mailbox "outbox"
$sent = Join-Path $mailbox "sent"
$inbox = Join-Path $mailbox "inbox"

$outboxCount = Count-Dirs $outbox
$sentCount = Count-Dirs $sent
$inboxCount = Count-Dirs $inbox
$oldestOutboxAge = Oldest-Age-Minutes $outbox

$orchestratorName = ""
$orchestratorDir = $null
$agentFiles = Get-ChildItem -LiteralPath $lingtai -Recurse -Filter ".agent.json" -ErrorAction SilentlyContinue
foreach ($file in $agentFiles) {
    try {
        $agent = Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json
    } catch {
        continue
    }
    if ($null -eq $agent.admin) { continue }
    foreach ($prop in $agent.admin.PSObject.Properties) {
        if ($prop.Value -eq $true) {
            $orchestratorName = if ($agent.agent_name) { $agent.agent_name } else { $file.Directory.Name }
            $orchestratorDir = $file.Directory.FullName
            break
        }
    }
    if ($orchestratorDir) { break }
}

$orchestratorState = ""
$heartbeatAge = ""
if ($orchestratorDir) {
    $statusPath = Join-Path $orchestratorDir ".status.json"
    if (Test-Path $statusPath) {
        try {
            $statusJson = Get-Content -LiteralPath $statusPath -Raw | ConvertFrom-Json
            $orchestratorState = $statusJson.runtime.state
        } catch {}
    }

    $heartbeatPath = Join-Path $orchestratorDir ".agent.heartbeat"
    if (Test-Path $heartbeatPath) {
        try {
            $heartbeat = [double](Get-Content -LiteralPath $heartbeatPath -Raw)
            $now = [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
            $age = $now - $heartbeat
            if ($age -lt 0) { $age = 0 }
            $heartbeatAge = [math]::Round($age, 1)
        } catch {}
    }
}

$status = if (-not (Test-Path $mailbox)) {
    "missing_human_mailbox"
} elseif (-not $orchestratorDir) {
    "missing_orchestrator"
} elseif ($outboxCount -gt 0) {
    "queued_outbox"
} else {
    "clear"
}

Write-Host "dot_lingtai: True"
Write-Host "human_mailbox: $(Test-Path $mailbox)"
Write-Host "outbox_queued: $outboxCount"
Write-Host "oldest_outbox_age_minutes: $oldestOutboxAge"
Write-Host "sent_total: $sentCount"
Write-Host "inbox_total: $inboxCount"
Write-Host "orchestrator: $orchestratorName"
Write-Host "orchestrator_state: $orchestratorState"
Write-Host "orchestrator_heartbeat_age_seconds: $heartbeatAge"
Write-Host "status: $status"

if ($status -eq "queued_outbox") {
    Write-Host "note: queued outbox means the orchestrator has not claimed human mail yet."
    Write-Host "note: check state/heartbeat, wake or restart once, then record non-response."
}
