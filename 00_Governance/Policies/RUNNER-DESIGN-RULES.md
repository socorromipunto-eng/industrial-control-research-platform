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

## Native process argument discipline - ICRP-E005

PowerShell automatic and reserved variables must not be reused as formal
parameters in governed runner helper functions.

ICRP-E005 was observed when a helper declared `$Args` as a formal parameter.
Because `$Args` is an automatic PowerShell variable, native Git arguments were
not propagated as intended and `git.exe` received an invalid/incomplete command
line.

Required rules:

- Do not use `$Args` as a formal parameter or ordinary local variable in
  governed runners.
- Use explicit names such as `$GitArguments`, `$NativeArguments`, or
  `$ProcessArguments`.
- Native command wrappers must expose or validate the effective command line
  during diagnostic/adjudication gates when argument propagation is material.
- A native-wrapper failure is not evidence of repository failure.
- If the failed runner was read-only and repository preservation is proven,
  preserve state and adjudicate before retrying with corrected tooling.

Durable semantics:

NATIVE_WRAPPER_FAILURE != REPOSITORY_FAILURE

AUTOMATIC_VARIABLE_COLLISION = RUNNER_DEFECT

READ_ONLY_FAILURE + PRESERVED_STATE = ADJUDICATE_BEFORE_RETRY

## Empty GitHub repository adjudication - ICRP-E006

A GitHub API or CLI response that contains a `defaultBranchRef` object does not
by itself prove that a branch ref exists.

ICRP-E006 was observed when an empty repository returned a branch metadata
object whose `name` field was an empty string. The runner treated object
presence as proof that the repository was non-empty.

Required rules:

- Distinguish default-branch metadata from an actual branch ref.
- Empty or null branch names do not establish branch existence.
- Repository emptiness should be adjudicated with independent evidence such as:
  repository size, explicit branch enumeration, and commit-list behavior.
- A postcondition parser failure after successful remote creation must preserve
  the remote resource and be adjudicated before any retry or deletion.
- Never repeat a repository-creation runner when creation succeeded but a later
  validation step failed.

Durable semantics:

DEFAULT_BRANCH_METADATA != BRANCH_EXISTENCE

EMPTY_BRANCH_NAME != LIVE_REF

REMOTE_MUTATION_SUCCEEDED + POSTCHECK_DEFECT = PRESERVE_REMOTE_AND_ADJUDICATE

## Empty JSON-array counting discipline - ICRP-E007

PowerShell 5.1 may deserialize an empty JSON array (`[]`) through
`ConvertFrom-Json` as `$null` rather than as a zero-length collection.
Wrapping that value directly with `@(...)` produces a one-element array
containing `$null`, and `.Count` therefore returns 1.

ICRP-E007 was observed during GitHub ruleset inspection:

- raw API payload: `[]`
- runner-reported count: `1`
- actual ruleset count: `0`

Required rules:

- Do not infer collection cardinality from `@($value).Count` when `$value` may
  be `$null` after JSON deserialization.
- Normalize nullable JSON collections explicitly before counting.
- Preserve and inspect the raw JSON payload when collection cardinality is a
  gate condition.
- For an empty JSON array, require count 0.
- A parser/counting defect must not be promoted into a false repository-state
  claim.

Example safe normalization:

`if ($null -eq $value) { $items = @() } else { $items = @($value) }`

Durable semantics:

EMPTY_JSON_ARRAY = ZERO_ITEMS

NULL_DESERIALIZATION != ONE_REAL_ITEM

PARSER_COUNT != SOURCE_STATE_UNLESS_NORMALIZED

## Empty collection return discipline - ICRP-E008

Windows PowerShell 5.1 function output is pipeline output. Returning `@()` from
a helper does not reliably preserve a zero-length collection object for the
caller: the empty collection emits zero pipeline objects, so assignment may
receive `$null`.

ICRP-E008 was observed after ICRP-E007 attempted to normalize a nullable JSON
collection through a helper:

- raw JSON payload: `[]`
- deserialized value: `$null`
- helper branch: `return @()`
- assigned helper result: `$null`
- subsequent `.Count` under `Set-StrictMode`: `PropertyNotFoundStrict`

Required rules:

- Do not use a function that returns `@()` through normal pipeline semantics
  when the caller requires a concrete zero-length collection object.
- Prefer caller-side normalization:
  `[object[]]$items = @()`
  followed by explicit assignment only when the parsed value is non-null.
- If a helper must preserve an empty array as one object, use a mechanism that
  suppresses output enumeration and validate the resulting type/count.
- Under `Set-StrictMode`, validate nullability before property access.
- Collection normalization itself must be covered by a direct self-test when
  it controls a mutation gate.

Durable semantics:

EMPTY_COLLECTION_OUTPUT = ZERO_PIPELINE_OBJECTS

ZERO_PIPELINE_OBJECTS -> NULL_ASSIGNMENT_POSSIBLE

NORMALIZATION_HELPER_PASS != COLLECTION_OBJECT_PRESERVED

MUTATION_NOT_REACHED = REMOTE_STATE_PRESERVED
