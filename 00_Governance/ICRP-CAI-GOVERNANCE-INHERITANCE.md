# ICRP CAI Governance Inheritance Policy

Document ID: ICRP-GOV-CAI-001  
Status: Draft - Mandatory Internal Governance Baseline  
Project: Industrial Control Research Platform (ICRP)  
Authority Type: Internal Engineering Governance and Assurance Policy  
External Certification Claim: NONE  
Regulatory Compliance Claim: NONE  

## 1. Purpose

This document establishes the mandatory governance inheritance relationship between the Industrial Control Research Platform (ICRP) and selected governance, assurance, safety, telemetry, AI, evidence, and contamination-control principles derived from CAI-EXPERT-LAB.

The purpose of this inheritance is to ensure that ICRP engineering activities remain deterministic, traceable, safety-aware, evidence-producing, human-authorized where required, and resistant to undocumented semantic or operational drift.

This document does not transform ICRP into CAI-EXPERT-LAB and does not redefine either project.

ICRP remains an independent industrial-control research and engineering platform.

CAI-EXPERT-LAB remains an independent cybersecurity artificial intelligence governance framework.

## 2. Authority Boundary

This policy is an internal ICRP governance requirement.

It does not replace, supersede, reinterpret, or grant authority over:

- applicable law;
- regulations;
- directives;
- harmonized or consensus standards;
- regulatory guidance;
- certification bodies;
- notified bodies;
- laboratories;
- authorities having jurisdiction;
- manufacturer obligations;
- operator obligations.

External legal, regulatory, and normative authority remains with the applicable official source.

Internal CAI-derived governance rules constrain how ICRP engineering work is performed.

Therefore:

LAW != STANDARD  
STANDARD != GUIDANCE  
GUIDANCE != CERTIFICATION  
INTERNAL POLICY != REGULATORY AUTHORITY  
ALIGNMENT != CONFORMANCE  
CONFORMANCE != CERTIFICATION  

## 3. Scope

This policy applies to all ICRP lifecycle activities including:

- project governance;
- normative baseline management;
- requirements;
- architecture;
- threat and hazard analysis;
- industrial control logic;
- PLC programming;
- IEC 61131-3 logic;
- Ladder Diagram;
- Structured Text;
- Function Block Diagram;
- Sequential Function Chart;
- firmware;
- BSP/HAL/drivers;
- embedded control;
- RTOS-based components;
- industrial communications;
- EtherNet/IP;
- Modbus TCP;
- OPC UA;
- CAN;
- RS-485;
- industrial I/O;
- analog and digital instrumentation;
- RTD and thermocouple processing;
- HMI;
- SCADA;
- Ignition;
- faceplates;
- alarm management;
- process sequencing;
- interlocks;
- permissives;
- watchdogs;
- safe states;
- shutdown logic;
- emergency shutdown research logic;
- process-water systems;
- cooling-water systems;
- process-gas systems;
- material handling;
- material feed;
- material discharge;
- thermal-process control;
- process simulation;
- fault injection;
- FAT;
- SFAT;
- host-based testing;
- evidence generation;
- edge computing;
- AI accelerators;
- AI inference;
- Azure integration;
- cloud telemetry;
- secure adapters;
- device identity;
- secure update;
- configuration management;
- handover;
- as-built documentation.

## 4. Mandatory Governance Principles

The following principles are mandatory throughout ICRP:

SAFETY > AUTOMATION

HUMAN AUTHORITY > AI INFERENCE

VALIDATION BEFORE TRUST

EVIDENCE BY DEFAULT

FAIL CLOSED

LEAST PRIVILEGE

EXPLICIT AUTHORIZATION BEFORE HIGH-IMPACT MUTATION

NO SILENT STANDARD SUBSTITUTION

NO UNAUTHORIZED PLC CHANGE

NO UNAUTHORIZED FIRMWARE CHANGE

NO AI DIRECT PHYSICAL AUTHORITY

NO IMPLICIT SAFETY OVERRIDE

NO HIDDEN AUTOMATION

NO UNDOCUMENTED STATE TRANSITION

NO UNTRACEABLE CHANGE

NO SILENT SEMANTIC DRIFT

NO UNREVIEWED AI-GENERATED GOVERNANCE CHANGE

NO COMPLIANCE OR CERTIFICATION CLAIM WITHOUT EVIDENCE

## 5. Decision Integrity

Every material ICRP decision must be traceable to sufficient context.

A decision must not be treated as valid merely because it was valid at an earlier time.

Where operationally relevant, decision validity shall be re-evaluated when:

- system state changes;
- process conditions change;
- telemetry becomes stale;
- telemetry quality decreases;
- authority changes;
- configuration changes;
- firmware changes;
- standards change;
- applicable law changes;
- environmental conditions change;
- safety conditions change;
- required evidence becomes unavailable.

Unknown state shall not be promoted to fact.

UNKNOWN != FACT

## 6. Telemetry Trust Boundary

All telemetry shall be considered untrusted until validated.

Telemetry validation shall include, where applicable:

- source identity;
- provenance;
- timestamp integrity;
- schema validity;
- signal quality;
- confidence metadata;
- integrity indicators;
- context completeness;
- sequence or ordering validity;
- trust domain.

Invalid telemetry shall be rejected or quarantined.

Low-confidence telemetry may support observation and analysis but shall not independently authorize disruptive physical or cyber actions.

Raw telemetry shall not bypass validation gates.

Telemetry processing shall not directly initiate safety-critical control actions.

## 7. Separation of Planes

ICRP shall maintain explicit separation between:

### 7.1 Process and Data Plane

Includes:

- sensors;
- industrial I/O;
- telemetry;
- signals;
- logs;
- metrics;
- measurements;
- process state.

### 7.2 Control Plane

Includes:

- control logic;
- state machines;
- sequences;
- interlocks;
- permissives;
- PID logic;
- command arbitration;
- deterministic execution.

### 7.3 Safety and Authority Plane

Includes:

- safety gates;
- shutdown authority;
- emergency-stop boundaries;
- human authorization;
- fail-safe behavior;
- safety-related constraints.

### 7.4 Management and Governance Plane

Includes:

- policy;
- change control;
- normative baseline;
- approvals;
- evidence;
- audit;
- lifecycle governance.

### 7.5 AI and Analytics Plane

Includes:

- anomaly detection;
- signal correlation;
- predictive analytics;
- confidence scoring;
- diagnostics;
- recommendations;
- decision support.

AI and analytics shall not silently cross into deterministic physical-control authority.

## 8. State-Driven Execution

ICRP operational logic shall use explicit state definitions where stateful execution exists.

Each governed state shall define, as applicable:

- entry conditions;
- allowed actions;
- prohibited actions;
- telemetry requirements;
- safety constraints;
- authority requirements;
- exit conditions;
- timeout behavior;
- degraded behavior;
- failure behavior;
- evidence requirements.

Implicit state transitions are prohibited.

Invalid state transitions shall be blocked and recorded.

## 9. OT and ICS Safety Governance

OT/ICS safety constraints are mandatory and non-bypassable within the research architecture.

No automation, AI component, cloud component, adapter, HMI, or analytics system may silently override safety constraints.

The following require explicit human authorization when applicable:

- PLC modification;
- firmware modification;
- safety-related configuration change;
- Level 0-2 containment or isolation;
- production-impacting network segmentation;
- restoration of industrial firmware or images;
- high-impact persistent configuration changes;
- AI-recommended actions exceeding approved risk thresholds.

ICRP shall not implement an architecture in which AI is the sole authority for:

- emergency shutdown;
- safety trip;
- permissive bypass;
- interlock bypass;
- safe-state release;
- hazardous process enablement;
- irreversible physical action.

## 10. AI Authority Boundary

AI within ICRP may:

- observe;
- correlate;
- classify;
- detect anomalies;
- estimate confidence;
- prioritize;
- explain;
- forecast;
- diagnose;
- recommend.

AI shall not independently:

- authorize safety-critical action;
- trigger irreversible physical action;
- modify PLC logic;
- promote firmware;
- change safety configuration;
- bypass interlocks;
- bypass permissives;
- alter state-machine authority;
- change normative baselines;
- assert regulatory conformity;
- assert certification.

AI output is advisory unless an explicitly governed deterministic mechanism and required human authority approve execution.

## 11. Physical Control Authority

Physical control shall remain deterministic.

Control authority shall reside in appropriate deterministic components such as:

- PLC logic;
- embedded control logic;
- deterministic state machines;
- safety-rated systems where applicable;
- verified control engines;
- explicitly authorized operator actions.

Cloud connectivity shall not be required for local safe-state enforcement.

Loss of Azure, WAN, Internet, cloud analytics, or remote AI capability shall not eliminate required local safety behavior.

## 12. Adapter and Integration Governance

External integration shall occur through explicit adapter boundaries.

Adapters may include:

- Azure services;
- Ignition;
- PLC interfaces;
- OPC UA gateways;
- Modbus gateways;
- EtherNet/IP integrations;
- edge gateways;
- AI accelerators;
- identity providers;
- PKI services;
- telemetry pipelines;
- evidence stores.

Each adapter shall define:

- supported actions;
- required inputs;
- expected outputs;
- target scope;
- authentication method;
- authorization scope;
- least-privilege requirements;
- timeout behavior;
- error behavior;
- evidence produced;
- version;
- rollback or recovery expectations.

Adapters shall not:

- embed hidden policy bypasses;
- retain persistent authority without justification;
- silently expand scope;
- bypass safety gates;
- bypass human approval requirements;
- execute partial uncontrolled mutations.

## 13. Credentials and Secrets

Integration components shall use least privilege.

Where technically feasible:

- credentials shall be short-lived;
- secrets shall be rotated;
- managed identity shall be preferred over embedded secrets;
- secrets shall not appear in logs;
- secrets shall not appear in evidence artifacts;
- replay resistance shall be implemented;
- impersonation resistance shall be implemented;
- unauthorized invocation shall be blocked.

## 14. Failure Behavior

Failures shall default to safe and governed behavior.

A failed operation shall not silently result in undefined state.

Where applicable:

- preserve the last valid state;
- halt unsafe transitions;
- generate evidence;
- classify the failure;
- trigger escalation;
- require authorization before retry where risk warrants;
- avoid automatic destructive rollback.

Partial mutation plus failure shall be preserved and adjudicated before retry, reset, cleanup, or rollback when the partial state is material.

## 15. Evidence Requirements

Material actions shall generate reconstructable evidence.

Evidence records shall include, where applicable:

- ACTION_ID;
- REQUEST_ID;
- actor identity;
- component identity;
- device identity;
- firmware or build identity;
- policy identity;
- policy hash;
- normative source identity;
- pre-state;
- pre-state hash;
- decision;
- authorization;
- execution result;
- post-state;
- post-state hash;
- validation result;
- evidence hash;
- timestamp;
- signature or attestation when justified.

Absence of required evidence shall prevent promotion of the affected result.

## 16. Contamination Prevention

ICRP treats semantic and governance contamination as an engineering risk.

The following are prohibited:

- silent standards substitution;
- undocumented standard-version changes;
- undocumented semantic changes;
- invented compliance claims;
- invented certification claims;
- selective omission that changes engineering meaning;
- AI-generated normative interpretation without review;
- undocumented architecture-boundary changes;
- undocumented authority expansion;
- untraceable implementation changes.

AI-generated engineering or governance content shall be treated as untrusted input until reviewed.

## 17. Standards Evolution

Publication of a new regulation, directive, standard, amendment, revision, draft, interpretation, or authoritative guidance shall trigger review.

It shall not automatically change the ICRP baseline.

For every material update, determine:

- source authenticity;
- publication date;
- effective date;
- status;
- jurisdiction;
- applicability;
- transition rules;
- replacement or coexistence relationship;
- architecture impact;
- implementation impact;
- test impact;
- evidence impact;
- certification or conformity impact.

NEWER != AUTOMATICALLY APPLICABLE

DRAFT != CURRENT BASELINE

CHANGE_WATCH_SOURCE != CHANGE_DETECTED

VERSION_METADATA != VERSION_CHANGED

## 18. Dual Review Requirement

Material governance, architecture, firmware, control, safety, security, and AI changes shall undergo both:

### 18.1 Technical Review

Evaluate:

- correctness;
- deterministic behavior;
- architecture consistency;
- safety impact;
- cybersecurity impact;
- interoperability;
- testability;
- implementation consequences.

### 18.2 Governance Review

Evaluate:

- authority;
- scope;
- normative consistency;
- claims;
- traceability;
- evidence;
- contamination risk;
- approval validity.

Failure of either review results in:

FAIL

or:

HOLD

Promotion requires both reviews to pass.

## 19. Mandatory Promotion Reviews

Before promotion of significant architecture, firmware, control logic, cryptographic configuration, AI integration, or security-sensitive implementation, perform:

1. Human Readability Review
2. Devil's Advocate Review
3. Technical Destruction Review
4. Certification and Compliance Claim Review
5. Evidence Completeness Review

Permitted outcomes:

PASS

FAIL

HOLD

## 20. Industrial Control Research Scope

This policy applies directly to the ICRP industrial reference architecture including research into:

- data acquisition;
- normal operation;
- normal shutdown;
- emergency shutdown;
- water systems;
- cooling-water control;
- process-gas control;
- material handling;
- material feed;
- material discharge;
- thermal-process control;
- sequence control;
- PLC programming;
- embedded firmware;
- HMI/SCADA;
- industrial communication;
- alarm management;
- simulation;
- fault injection;
- FAT;
- SFAT.

Each subsystem shall ultimately be traceable through:

NORMATIVE SOURCE
    ->
REQUIREMENT
    ->
PCN / FUNCTION
    ->
I/O
    ->
CONTROL LOGIC
    ->
FIRMWARE / PLC
    ->
HMI / SCADA
    ->
SIMULATION
    ->
TEST
    ->
FAULT INJECTION
    ->
EVIDENCE
    ->
REVIEW
    ->
PROMOTION

## 21. Edge AI Governance

Future AI accelerator or AI-chip integration shall preserve this policy.

The AI subsystem shall remain outside the sole deterministic safety-authority path.

AI may support:

- anomaly detection;
- predictive maintenance;
- signal correlation;
- diagnostics;
- confidence scoring;
- process optimization recommendations;
- operator decision support.

AI shall not become the only mechanism capable of asserting safe state.

## 22. Azure Governance

Future Azure integration shall preserve local deterministic control and local safe-state capability.

Azure may provide:

- telemetry transport;
- device identity;
- secure messaging;
- monitoring;
- analytics;
- data storage;
- fleet management;
- configuration distribution;
- secure-update support;
- evidence replication.

Azure shall not become a hidden dependency for immediate local safety execution.

Cloud failure shall have a defined and tested degraded-state behavior.

## 23. Claims Boundary

ICRP may demonstrate:

- supported functionality;
- implemented functionality;
- tested behavior;
- validation evidence;
- standards alignment;
- research conformance where explicitly justified.

ICRP shall not self-declare:

- regulatory certification;
- notified-body approval;
- SIL certification;
- PL certification;
- CE conformity;
- UL listing;
- ATEX certification;
- third-party accreditation.

Such claims require the exact external processes and authorities applicable to the real implementation.

## 24. Relationship to CAI-EXPERT-LAB

ICRP inherits selected CAI-EXPERT-LAB governance principles as internal engineering controls.

This inheritance does not:

- merge repositories;
- transfer product identity;
- redefine CAI Core;
- redefine ICRP;
- import CAI branding as ICRP product identity;
- grant certification;
- establish regulatory authority.

CAI-EXPERT-LAB remains a separate framework.

ICRP remains a separate engineering research platform.

## 25. Enforcement

Violation of a mandatory principle in this policy requires:

- affected artifact identification;
- propagation halt where material;
- documented review;
- impact assessment;
- corrective action;
- updated evidence;
- revalidation before promotion.

Unresolved material violations result in HOLD.

## 26. Status

Status: Draft - Mandatory Internal Governance Baseline

This document becomes authoritative for ICRP only after:

- technical review;
- governance review;
- evidence completeness review;
- approved commit;
- promotion through the governed repository process.

Until promotion, it remains a controlled draft.

End of Document
