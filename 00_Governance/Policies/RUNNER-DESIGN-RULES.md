# ICRP Governed Runner Design Rules

## Core execution rule

One explicitly authorized mutation boundary at a time.

A runner may narrow human authority. It may never broaden it.

## Mandatory runner preflight

Before mutation, prove as applicable:

- repository root
- branch
- HEAD
- clean/expected index state
- clean/expected worktree state
- exact untracked state
- Git identity when a commit may occur
- exact allowed paths
- exact input hashes
- tool identity/version
- PowerShell 5.1 parser compatibility
- native command wrapper functionality
- expected output destination
- rollback/recovery boundary

## Native command rule

For PowerShell 5.1:

- use `System.Diagnostics.Process` when stdout/stderr/exit status matter;
- drain stdout and stderr safely;
- do not treat stderr text alone as failure;
- do not use automatic-variable names such as `$Args` as governed formal
  parameter surfaces;
- prove native argument propagation with a read-only command before mutation.

## Mutation rule

The following are separate mutation classes unless a gate explicitly and
justifiably binds them:

- worktree file creation/modification
- index mutation (`git add`)
- commit
- remote-ref mutation (`git push`)
- pull request creation
- merge
- tag/release
- branch deletion
- normative-source acquisition
- generated evidence written inside the repository

## Partial failure rule

If a runner may already have mutated state:

1. stop;
2. inspect actual resulting state;
3. preserve it;
4. adjudicate;
5. do not automatically retry or roll back.

## Evidence semantics

`EXIT_CODE != RESULTING_STATE`
`SCRIPT_PASS != ENGINEERING_VALIDITY`
`TESTED != CONFORMANT`
`CONFORMANT != CERTIFIED`
`UNKNOWN != FACT`

## Required final output

Every mutation runner shall print:

- authorized boundary
- mutation performed YES/NO
- exact resulting identity/hash/ref where applicable
- validation result
- evidence location, if separately authorized
- PASS / FAIL / HOLD / CONTROLLED_STOP
- exact next governed boundary
## Porcelain status parsing rule

Git `--porcelain` output is a machine interface and SHALL be interpreted
literally.

Required behavior:

- use fixed-position parsing or literal prefix comparison;
- for untracked v1 entries, compare against the literal prefix `?? `;
- do not use PowerShell wildcard expressions such as `-like '??*'` to identify
  Git status tokens;
- treat parser defects separately from repository-state defects;
- if the index was already mutated before a parser defect, preserve and
  adjudicate the resulting index before any retry.

`PORCELAIN_TOKEN != WILDCARD_PATTERN`
`PARSER_FAILURE != REPOSITORY_FAILURE`
