#requires -Version 5.1
[CmdletBinding()]
param([string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path)
& (Join-Path $PSScriptRoot 'Invoke-ICRPGate.ps1') -Root $Root -RunId 'RUN-001' -GateId 'GATE-001'
exit $LASTEXITCODE
