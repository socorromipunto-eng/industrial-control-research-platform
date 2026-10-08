# GATE-011 - HMI SCADA Validation

Status: DRAFT unless explicitly adjudicated.

## Normative uncertainty eliminated
TBD by human authorization before execution.

## Exact boundary
HMI SCADA Validation

## Authorized action
TBD per execution authorization.

## Allowed mutations
HMI validation evidence only

## Required inputs
- current Project Context
- Source of Truth
- current Git branch/HEAD
- relevant requirements/ADRs
- applicable normative records
- explicit authorization

## Required evidence
- input inventory
- SHA-256 where applicable
- command/tool versions
- raw output
- structured result
- validation result
- adjudication

## Verdict
PASS / FAIL / HOLD

## Fail-closed criteria
Any unresolved required input, normative applicability, provenance,
unexpected mutation, missing evidence, or inconsistent result -> HOLD/FAIL.

SCRIPT_PASS != EPISTEMICALLY_VALID.
