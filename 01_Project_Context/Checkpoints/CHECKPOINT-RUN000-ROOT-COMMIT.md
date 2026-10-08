# ICRP RUN-000 Root Commit Checkpoint

Project: Industrial Control Research Platform (ICRP)

## Mechanically demonstrated repository state

Branch:
`main`

Root commit:
`07c4485442af45f2d213a92adaa1dbcc59f6f055`

Commit subject:
`chore: establish governed ICRP M0 baseline`

Author:
`AJSM <socorromipunto@gmail.com>`

Root-commit properties:

- parent count: 0
- committed path count: 124
- all committed status: A
- index clean: YES
- tracked worktree clean: YES
- untracked count after commit: 0
- push performed: NO
- remote mutation: NO
- GitHub repository created: NO

## Claim boundary

Compliance claim authorized: NO
Implementation authorized: NO
Hardware selection authorized: NO

A successful repository bootstrap does not establish engineering conformance,
regulatory conformity, functional-safety certification, cybersecurity
certification, or production readiness.

## Runner defects discovered during bootstrap

See:
`00_Governance/Registers/ERROR-LEDGER.md`

Current durable defect IDs:
- ICRP-E001
- ICRP-E002
- ICRP-E003
- ICRP-E004

## Next governed boundaries

1. Stage/commit the exact governance defect-record set.
2. Establish licensing and public authorship:
   Apache-2.0, NOTICE, AUTHORS.md, CITATION.cff.
3. Adjudicate public README/profile metadata.
4. Create GitHub repository only after local governance/licensing baseline is
   clean and committed.
5. Begin RUN-001 / GATE-001 Normative Baseline only after repository/publication
   foundations are governed.

## Durable runner defect update - ICRP-E005

The durable runner-defect set now includes:

- ICRP-E001
- ICRP-E002
- ICRP-E003
- ICRP-E004
- ICRP-E005

ICRP-E005:
PowerShell automatic-variable collision in a native-process wrapper caused Git
argument propagation failure during a read-only GitHub capability probe.

Adjudicated repository state after correction:

- branch: main
- HEAD: cb8840038b67fdef1ee207cce1982a88ad0f7cd5
- repository clean: YES
- local remotes: NONE
- GitHub CLI available: YES
- GitHub CLI authenticated as `socorromipunto-eng`: YES
- repository mutation caused by failed probe: NO
- remote mutation caused by failed probe: NO

## Durable runner defect update - ICRP-E006

The durable runner-defect set now includes:

- ICRP-E001
- ICRP-E002
- ICRP-E003
- ICRP-E004
- ICRP-E005
- ICRP-E006

ICRP-E006:
An empty GitHub repository was misclassified as non-empty because a
`defaultBranchRef` object with an empty `name` was treated as a live branch ref.

Remote adjudication:

- repository: `socorromipunto-eng/industrial-control-research-platform`
- visibility: PUBLIC
- repository size: 0
- branch count: 0
- commit-list result: 409 `Git Repository is empty.`
- repository creation: SUCCESS
- local origin configured: NO
- push performed: NO

Required preservation:
Do not recreate or delete the remote repository. Continue from the existing
empty public repository after ICRP-E006 is durably recorded and committed.

## Durable runner defect update - ICRP-E007

The durable runner-defect set now includes:

- ICRP-E001
- ICRP-E002
- ICRP-E003
- ICRP-E004
- ICRP-E005
- ICRP-E006
- ICRP-E007

ICRP-E007:
An empty JSON ruleset array returned by GitHub was miscounted as one item due
to PowerShell 5.1 nullable JSON collection behavior.

Adjudicated GitHub state before main-protection policy selection:

- repository: `socorromipunto-eng/industrial-control-research-platform`
- visibility: PUBLIC
- default branch: main
- main SHA:
  `28417ad11b294638942a152a36e524733176647c`
- branch protection: ABSENT
- repository ruleset count: 0
- local/remote SHA identity: PASS
- repository mutation during inspection: NO

Required preservation:
Do not apply branch protection or rulesets until ICRP-E007 is durably recorded
and committed.

## Durable runner defect update - ICRP-E008

The durable runner-defect set now includes:

- ICRP-E001
- ICRP-E002
- ICRP-E003
- ICRP-E004
- ICRP-E005
- ICRP-E006
- ICRP-E007
- ICRP-E008

ICRP-E008:
A PowerShell 5.1 helper returned an empty array for nullable JSON collection
normalization, but pipeline output semantics emitted zero objects and the caller
received `$null`. Under `Set-StrictMode`, `.Count` then failed.

Branch-protection attempt adjudication:

- runner hash validated: YES
- parser validated: YES
- local HEAD:
  `c972761c979f5f918460f959ca17281daa66e8de`
- remote main:
  `c972761c979f5f918460f959ca17281daa66e8de`
- raw rulesets payload: `[]`
- protection prestate: ABSENT
- protection mutation section reached: NO
- branch protection changed: NO
- ruleset changed: NO
- push performed: NO

Required preservation:
Do not retry the same branch-protection runner. Record and commit ICRP-E008,
then use corrected caller-side nullable collection normalization.
