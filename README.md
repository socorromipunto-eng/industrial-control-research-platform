# Industrial Control Research Platform (ICRP)

Industrial Control Research Platform (ICRP) is an independent, evidence-governed
research platform for industrial automation, deterministic machine/process
control, embedded control systems, OT/ICS cybersecurity, SCADA/HMI,
interoperability, simulation, fault injection, software factory acceptance
testing (SFAT), and assurance-oriented engineering.

ICRP is designed as a public engineering research portfolio and laboratory.
Its purpose is to demonstrate how industrial-control decisions can be traced
from authoritative requirements through architecture, implementation,
validation, evidence, findings, and governed claims.

## What ICRP demonstrates

ICRP is intended to demonstrate engineering capability across a complete
industrial-control lifecycle, including:

- industrial system and control architecture;
- deterministic firmware and embedded-control design;
- IEC 61131-3 control-model interoperability;
- PLC-oriented sequencing, permissives, interlocks, alarms, and safe-state
  research;
- HMI/SCADA architecture and command-authority boundaries;
- EtherNet/IP, Modbus TCP, OPC UA, CAN, and RS-485 research interfaces;
- industrial I/O and instrumentation models;
- plant simulation and fault injection;
- SFAT design and reproducible verification;
- OT/ICS cybersecurity architecture;
- evidence-driven engineering governance;
- normative-source traceability and claim control;
- adversarial validation and independent review gates.

The project is provider-neutral by design. References to commercial platforms,
protocols, or industrial ecosystems are interoperability and research targets,
not architectural ownership boundaries.

## Reference system

The primary reference environment is a Thermal Materials Processing Pilot
Plant. It is a research abstraction used to exercise realistic industrial
control concerns without reproducing a confidential client facility.

Research domains include:

- data acquisition and industrial Ethernet devices;
- startup, steady-state operation, and normal shutdown;
- emergency-shutdown research logic;
- cooling-water control;
- process-gas control;
- thermal-system control;
- material feed and discharge;
- industrial analog and digital I/O;
- 4-20 mA, 0-10 V, RTD, thermocouple, 24 V DI, DO, AO, relay, and driver
  interfaces;
- PLC / IEC 61131-3 interoperability;
- Ignition SCADA/HMI research;
- industrial-protocol interoperability;
- plant simulation;
- abnormal-condition injection;
- SFAT and evidence generation.

## Engineering model

ICRP uses a governed engineering lifecycle:

Memory -> Project Context -> Source of Truth -> Current Normative Baseline ->
Evidence -> Architecture -> Threat/Hazard Model -> Decision -> Authorization ->
Implementation -> Validation -> Adversarial Validation -> Independent Review ->
Promotion -> Continuous Assurance -> Documentation.

The canonical traceability chain is:

Authority -> Source -> Requirement -> Interpretation -> Control -> Architecture
-> Component Capability -> Configuration -> Action -> Test -> Evidence
-> Finding -> Decision -> Claim

## Core engineering rules

- Architecture Before Implementation
- Normative First
- Evidence First
- Security First
- Least Privilege
- Read-Only by Default
- Fail Closed
- UNKNOWN remains UNKNOWN
- DRAFT != FINAL
- STATE != ACTION
- RUNNER PASS != ENGINEERING VALIDITY
- TEST PASS != CONFORMANCE
- CONFORMANCE != CERTIFICATION
- CYBERSECURITY != FUNCTIONAL SAFETY
- FUNCTIONAL SAFETY != CE CONFORMITY
- SIMULATION != PHYSICAL VALIDATION
- VALID != TRUSTED != AUTHORIZED != ACCEPTED

## Current project phase

Current phase:

M0 - Project Constitution & Normative Baseline

Current authorization state:

- implementation authorization: NO;
- hardware-selection authorization: NO;
- physical hazardous-process operation authorization: NO;
- compliance/certification claim authorization: NO.

This means the repository currently emphasizes governance, normative baseline,
architecture preparation, evidence structure, and validation methodology before
implementation is promoted.

## Research architecture direction

The planned architecture separates:

1. Platform
   - BSP / HAL
   - device drivers

2. Infrastructure
   - I/O manager
   - network manager
   - protocol stack
   - diagnostics
   - event recorder
   - evidence interface
   - boot/update services

3. Control
   - control engine
   - sequence engine
   - interlock engine
   - alarm engine
   - safety supervisor research layer

4. Application
   - process-specific modules
   - PCN-oriented research functions
   - HMI/SCADA integration
   - simulation and SFAT adapters

Safety-related architecture in ICRP is research architecture unless and until
an explicitly scoped validation and certification process establishes otherwise.

## Public evidence and governance

ICRP treats engineering evidence as a first-class artifact.

Material actions are intended to be reconstructable through identifiers,
pre-state and post-state evidence, hashes, authorization records, validation
results, findings, and governed decisions.

Repository gates distinguish:

- discovered;
- supported;
- tested;
- conformant;
- validated;
- authorized;
- accepted.

These states are not interchangeable.

## Independence boundary

ICRP is independent research.

The repository must not contain third-party client code, NDA material,
confidential plant configurations, proprietary PCNs, proprietary faceplates, or
other restricted implementation artifacts.

Third-party standards, specifications, software, trademarks, and copyrighted
materials retain their original rights and licensing conditions.

## Non-claims

Repository existence, a successful runner, simulation output, or test pass does
not by itself claim:

- CE conformity;
- EU Machinery Regulation conformity;
- SIL, PL, or Safety Integrity certification;
- UL listing or certification;
- NFPA compliance;
- OSHA compliance;
- ISA/IEC 62443 certification;
- functional-safety approval;
- cybersecurity certification;
- production readiness;
- fitness for hazardous-process operation.

Every material claim requires explicit scope, applicable authority,
requirement mapping, implementation evidence, validation evidence, and governed
adjudication.

## Licensing and authorship

Original ICRP material is licensed under the Apache License, Version 2.0 unless
a file or directory states otherwise.

Primary author and project originator:

Antonio Jose Socorro Marin

GitHub:

socorromipunto-eng

See:

- `LICENSE`
- `NOTICE`
- `AUTHORS.md`
- `CITATION.cff`

for licensing, attribution, citation, and third-party-rights boundaries.
