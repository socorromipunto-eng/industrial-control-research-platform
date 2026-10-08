#requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][ValidatePattern('^GATE-\d{3}$')][string]$GateId,
    [Parameter(Mandatory=$true)][ValidatePattern('^RUN-\d{3}$')][string]$RunId,
    [Parameter()][string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
)
Set-StrictMode -Version Latest
$ErrorActionPreference='Stop'

function H([string]$s){ (Get-FileHash -LiteralPath $s -Algorithm SHA256).Hash.ToUpperInvariant() }

$utc=[DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ')
$gatePath=Join-Path $Root ("00_Governance\Gates\"+$GateId+".md")
if(-not(Test-Path -LiteralPath $gatePath)){ throw "BLOCKED: gate definition missing: $gatePath" }

$git=Get-Command git -ErrorAction SilentlyContinue
if(-not $git){ throw 'BLOCKED: git not found' }

Push-Location $Root
try {
    $inside=(& git rev-parse --is-inside-work-tree 2>$null)
    if($LASTEXITCODE -ne 0 -or $inside -ne 'true'){ throw 'BLOCKED: not a Git work tree' }
    $branch=(& git branch --show-current).Trim()
    $head=(& git rev-parse HEAD).Trim()
    $status=@(& git status --porcelain=v1)

    $out=Join-Path $Root ("18_Evidence\Runs\"+$RunId+"\"+$utc)
    New-Item -ItemType Directory -Path $out -Force | Out-Null

    $record=[ordered]@{
        run_id=$RunId
        gate_id=$GateId
        timestamp_utc=$utc
        branch=$branch
        head=$head
        gate_sha256=(H $gatePath)
        working_tree_clean=($status.Count -eq 0)
        script_pass=$true
        epistemic_adjudication='PENDING_HUMAN_ADJUDICATION'
        verdict='HOLD'
        note='Generic runner proves execution integrity only. Gate-specific logic must be implemented and authorized before PASS.'
    }
    $record | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath (Join-Path $out 'run-result.json') -Encoding UTF8
    & git status --porcelain=v1 | Set-Content -LiteralPath (Join-Path $out 'git-status.txt') -Encoding UTF8
    & git log -1 --format=fuller | Set-Content -LiteralPath (Join-Path $out 'git-head.txt') -Encoding UTF8

    Write-Host "RUN COMPLETE: $RunId / $GateId"
    Write-Host "VERDICT: HOLD"
    Write-Host "Reason: gate-specific proof and human adjudication are still required."
}
finally { Pop-Location }
