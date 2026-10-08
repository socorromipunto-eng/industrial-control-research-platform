#requires -Version 5.1
[CmdletBinding()]
param([string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path)
& (Join-Path $PSScriptRoot 'Invoke-ICRPGate.ps1') -Root $Root -RunId 'RUN-005' -GateId 'GATE-005'
exit $LASTEXITCODE
