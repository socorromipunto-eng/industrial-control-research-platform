#requires -Version 5.1
[CmdletBinding()]
param([string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path)
& (Join-Path $PSScriptRoot 'Invoke-ICRPGate.ps1') -Root $Root -RunId 'RUN-003' -GateId 'GATE-003'
exit $LASTEXITCODE
