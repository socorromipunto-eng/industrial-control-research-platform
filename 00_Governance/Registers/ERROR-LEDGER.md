# ICRP Anti-Regression Error Ledger

Purpose: preserve runner/workflow defects as executable governance knowledge.
A runner defect is not automatically a project defect.

## ICRP-E001 - Git identity preflight occurred too late

Trigger/context:
RUN-000 bootstrap created the repository and staged the M0 baseline before the
first commit attempted to resolve Git author identity.

Observed symptom:
`git commit` stopped with `Author identity unknown`.

Root cause:
RUN-000 did not verify repository-local or global `user.name` and `user.email`
before entering the repository/index mutation sequence.

Classification:
Runner preflight / mutation-order defect.

Mutation status:
Repository initialization and staging had already occurred. Commit had not
occurred. The partial state was preserved and adjudicated instead of rerun.

Safe handling:
Inspect branch/index/worktree state, establish an explicitly authorized local
identity, then separately authorize the initial commit.

Prohibited automatic recovery:
Do not rerun bootstrap, reset, restore, clean, unstage, or delete the partial
state merely because commit identity is missing.

Corrected design rule:
Any runner that may reach a Git commit SHALL resolve and validate the intended
Git identity before the first mutation whose continuation depends on that
identity.

`MISSING_IDENTITY != PROJECT_FAILURE`
`PARTIAL_MUTATION + ERROR = PRESERVE_STATE + ADJUDICATE`
`IDENTITY_PREFLIGHT -> BEFORE_COMMIT_DEPENDENT_MUTATIONS`

## ICRP-E002 - Native Git argument propagation defect in commit runner v1.0.1

Trigger/context:
The first corrected initial-commit runner attempted read-only branch discovery.

Observed symptom:
`git.exe` printed top-level usage and the runner stopped with
`BLOCKED: branch returned exit code 1`.

Root cause:
The native invocation layer used a fragile PowerShell 5.1 argument-passing
design, including the automatic-variable name `$Args` as a runner parameter
surface and `Start-Process -ArgumentList` composition that was not mechanically
proven before repository queries.

Classification:
Runner native-command invocation defect. No ICRP repository defect was shown.

Mutation status:
No commit occurred. The runner stopped before its authorized mutation.

Safe handling:
Preserve repository state. Correct the native invocation layer and prove the
wrapper itself with a read-only Git probe before any mutation.

Prohibited automatic recovery:
Do not reset, restore, clean, restage, or retry a commit without a fresh
preflight.

Corrected design rule:
PowerShell 5.1 governed runners SHALL avoid automatic-variable names for formal
parameters and SHALL mechanically prove native argument propagation before a
mutation boundary.

`NATIVE_WRAPPER_PASS -> BEFORE_MUTATION`
`RUNNER_INVOCATION_FAILURE != REPOSITORY_FAILURE`

## ICRP-E003 - Evidence creation must not broaden a commit-only boundary

Trigger/context:
Commit-runner v1.0.1 contained logic that would create evidence files inside the
repository before executing the authorized root commit.

Observed defect:
The design would have introduced a separate worktree mutation during a boundary
declared as `ONE LOCAL ROOT COMMIT ONLY`.

Classification:
Latent runner authorization-scope defect discovered before execution reached the
affected phase.

Mutation status:
No evidence-file mutation occurred from that runner because execution stopped
earlier.

Safe handling:
Remove repository evidence creation from the commit-only boundary. Capture
durable evidence in a separately authorized mutation after commit adjudication.

Corrected design rule:
A runner SHALL NOT manufacture additional mutation authority by declaring
convenient side effects. Evidence creation inside a repository is itself a
worktree mutation and requires authorization.

`COMMIT_ONLY_AUTHORIZATION != WORKTREE_FILE_CREATION_AUTHORIZATION`
`RUNNER_SCOPE <= HUMAN_AUTHORIZATION`
`EVIDENCE_MUTATION = MUTATION`
## ICRP-E004 - PowerShell wildcard misclassified staged status as untracked

Trigger/context:
RUN-000A-S1 successfully staged the exact three adjudicated governance files.
Its post-stage validation then attempted to detect untracked entries using:

`Where-Object { $_ -like '??*' }`

Observed symptom:
The runner reported `CONTROLLED_STOP: unexpected untracked files remain` even
though `git status --porcelain=v1 -uall` showed only staged `A  ...` entries.

Root cause:
In PowerShell wildcard matching, `?` means "any single character". Therefore
the pattern `??*` matched staged status lines such as `A  path` and did not
mean the literal Git porcelain prefix `?? `.

Classification:
Runner postcondition / status-parser defect.

Mutation status:
The authorized index mutation had already completed successfully. Exactly three
governance files were staged. The staged state was preserved and independently
adjudicated read-only before any continuation.

Safe handling:
Use literal prefix comparison for Git porcelain status, for example:

`$Line.StartsWith('?? ')`

or another parser that treats porcelain status bytes literally.

Prohibited automatic recovery:
Do not repeat `git add`, reset, restore, clean, or otherwise alter an already
adjudicated index merely because the postcondition parser is defective.

Corrected design rule:
Git porcelain status SHALL be parsed as a fixed-format machine interface.
PowerShell wildcard operators SHALL NOT be used when literal status characters
such as `?`, `*`, `[`, or `]` are semantically significant.

`POSTCONDITION_DEFECT != MUTATION_FAILURE`
`INDEX_MUTATED + VALIDATED = PRESERVE_INDEX`
`PORCELAIN_STATUS -> LITERAL_PARSE`

## ICRP-E005 - PowerShell automatic-variable collision broke native Git argument propagation

Status: CONFIRMED

Class: RUNNER_NATIVE_ARGUMENT_WRAPPER_DEFECT

Observed during:
`ICRP-RUN-000D-R1-GITHUB-REMOTE-CAPABILITY-PROBE-v1.0.0.ps1`

Observed behavior:
The runner intended to execute:

`git.exe -C C:\ICRP branch --show-current`

but Git instead emitted general help and returned exit code 1.

Root cause:
The helper function declared `$Args` as a formal parameter. `$Args` is an
automatic PowerShell variable. Reusing that name caused the intended native
argument array to be lost/mis-propagated.

Repository impact:
NONE.

Evidence:
The corrected read-only runner
`ICRP-RUN-000D-R1-R1-GITHUB-REMOTE-CAPABILITY-PROBE-v1.0.0.ps1`
proved:

- branch `main`;
- HEAD `cb8840038b67fdef1ee207cce1982a88ad0f7cd5`;
- clean repository;
- zero configured remotes;
- `git.exe -C C:\ICRP branch --show-current` executed correctly;
- GitHub CLI available and authenticated;
- no mutation performed.

Safe handling:
Do not repeat the defective runner. Preserve repository state. Correct the
wrapper. Re-run only the read-only probe. Record the defect durably before the
next mutation boundary.

Rules:
`NATIVE_WRAPPER_FAILURE != REPOSITORY_FAILURE`

`AUTOMATIC_VARIABLE_COLLISION = RUNNER_DEFECT`

`READ_ONLY_FAILURE + PRESERVED_STATE = ADJUDICATE_BEFORE_RETRY`

## ICRP-E006 - Empty GitHub repository misclassified as non-empty

Status: CONFIRMED

Class: REMOTE_POSTCONDITION_ADJUDICATION_DEFECT

Observed during:
`ICRP-RUN-000D-GH1-CREATE-EMPTY-PUBLIC-GITHUB-REPOSITORY-v1.0.0.ps1`

Authorized remote mutation:
Create public repository
`socorromipunto-eng/industrial-control-research-platform`
without README, license, gitignore, branch creation, origin configuration, or
push.

Mutation result:
SUCCESS.

Post-check failure:
The runner received:

`"defaultBranchRef":{"name":""}`

and treated object presence as proof that a real default branch existed.

Independent adjudication proved the repository is empty:

- repository visibility: public;
- repository size: 0;
- branch enumeration: zero branches;
- commit enumeration: GitHub API 409 `Git Repository is empty.`;
- no local remote configured;
- no push performed.

Root cause:
The runner conflated default-branch metadata/object presence with existence of a
live Git ref.

Safe handling:
Preserve the created repository. Do not rerun creation. Record the defect and
continue only after local governance returns to a clean committed state.

Rules:

`DEFAULT_BRANCH_METADATA != BRANCH_EXISTENCE`

`EMPTY_BRANCH_NAME != LIVE_REF`

`REMOTE_MUTATION_SUCCEEDED + POSTCHECK_DEFECT = PRESERVE_REMOTE_AND_ADJUDICATE`

## ICRP-E007 - Empty JSON ruleset array miscounted as one item

Status: CONFIRMED

Class: POWERSHELL_JSON_COLLECTION_NORMALIZATION_DEFECT

Observed during:
`ICRP-RUN-000D-RV1-REMOTE-PUBLICATION-VERIFICATION-AND-MAIN-PROTECTION-PREP-v1.0.0.ps1`

Observed evidence:

- GitHub rulesets endpoint exit code: 0
- raw response: `[]`
- runner output: `RULESET COUNT=1`

Root cause:
In Windows PowerShell 5.1, `ConvertFrom-Json` on an empty JSON array can yield
`$null`. The runner then used `@($rulesetsR.Stdout | ConvertFrom-Json)`.
Wrapping `$null` in an array produces a one-element collection, causing
`.Count` to return 1.

Actual repository state:
ZERO repository rulesets.

Related confirmed state:

- branch protection on `main`: ABSENT
- repository visibility: PUBLIC
- default branch: main
- local/remote main SHA identity:
  `28417ad11b294638942a152a36e524733176647c`
- local repository clean: YES
- mutation during inspection: NO

Safe handling:
Normalize nullable JSON collections explicitly before counting and preserve raw
API output as adjudication evidence.

Rules:

`EMPTY_JSON_ARRAY = ZERO_ITEMS`

`NULL_DESERIALIZATION != ONE_REAL_ITEM`

`PARSER_COUNT != SOURCE_STATE_UNLESS_NORMALIZED`

## ICRP-E008 - Empty collection helper collapsed to null

Status: CONFIRMED

Class: POWERSHELL_PIPELINE_COLLECTION_PRESERVATION_DEFECT

Observed during:
`ICRP-RUN-000D-BP1-APPLY-MAIN-BRANCH-PROTECTION-POLICY-v1.0.0.ps1`

Prestate evidence:

- local HEAD:
  `c972761c979f5f918460f959ca17281daa66e8de`
- remote main SHA:
  `c972761c979f5f918460f959ca17281daa66e8de`
- local repository clean: YES
- branch protection prestate: ABSENT
- raw GitHub rulesets response: `[]`

Failure:
The helper intended to normalize `$null` to `@()`. Because PowerShell function
output is pipeline-enumerated, the empty array emitted zero objects. Assignment
therefore yielded `$null`, and `$rulesets.Count` failed under `Set-StrictMode`.

Mutation impact:
NONE.

The runner failed in precondition section 03. The authorized branch-protection
mutation in section 04 was never reached.

Actual repository state:

- branch protection: ABSENT
- repository rulesets: 0
- local/remote SHA identity: PASS
- remote mutation: NO

Safe handling:
Record ICRP-E008, then stage/commit/push that record before generating a
corrected branch-protection runner.

Rules:

`EMPTY_COLLECTION_OUTPUT = ZERO_PIPELINE_OBJECTS`

`ZERO_PIPELINE_OBJECTS -> NULL_ASSIGNMENT_POSSIBLE`

`MUTATION_NOT_REACHED = REMOTE_STATE_PRESERVED`

## ICRP-E009 - RUN-000 evidence identity mismatch

Status: CONFIRMED

Class: EVIDENCE_INTEGRITY_IDENTITY_DEFECT

Observed during:
ICRP-RUN-GOV-GATE000-EVIDENCE-ADJUDICATION-v1.0.0.ps1

Affected artifact:
18_Evidence/Runs/RUN-000/20261008T124000Z/environment.json

Confirmed facts:

- The artifact is stored under RUN-000 evidence.
- The embedded run_id is RUN-014.
- The embedded gate_id is GATE-014.
- The artifact SHA-256 observed during adjudication was:
  0E2C722FDA398AC2B0CD419C43B25400D443C4DC8517ABA3E54FE3D3761519B3.
- The RUN-000 root commit was independently validated as:
  07c4485442af45f2d213a92adaa1dbcc59f6f055.
- The root commit parent count was 0.
- The root commit path count was 124.
- The RUN-000 checkpoint assertions passed.
- The RUN-000 created-file inventory contained the GATE-000 entry.

Root-cause boundary:

The identity mismatch is confirmed.
The exact mechanism that wrote RUN-014 / GATE-014 into the RUN-000
environment artifact remains UNKNOWN and shall not be guessed.

Impact:

- Repository history corruption: NONE demonstrated.
- Source implementation impact: NONE demonstrated.
- Evidence traceability impact: YES.
- GATE-000 promotion: HOLD pending corrective evidence adjudication.
- GATE-001 progression: BLOCKED until GATE-000 evidence integrity is resolved.

Preservation requirement:

The original environment.json shall not be deleted, overwritten, silently
corrected, or hidden by history rewriting.

Required remediation:

1. Preserve the original artifact and SHA-256.
2. Create a separately authorized corrective evidence artifact.
3. Bind that corrective artifact explicitly to RUN-000 / GATE-000.
4. Reference the original defective artifact and original SHA-256.
5. Update traceability registers in separately authorized boundaries.
6. Re-run GATE-000 evidence adjudication.
7. Perform human adjudication before promotion.

Durable semantics:

EVIDENCE_PATH_IDENTITY != EMBEDDED_IDENTITY

EVIDENCE_INTEGRITY_DEFECT = PRESERVE + ADJUDICATE + CORRECTIVE_RECORD

CORRECTIVE_EVIDENCE != ORIGINAL_EVIDENCE

UNKNOWN_ROOT_CAUSE_DETAIL != GUESSED_CAUSE

GATE000_HOLD -> UNTIL_EVIDENCE_IDENTITY_REMEDIATED