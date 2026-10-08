# Industrial Control Research Platform (ICRP)

ICRP is an independent research platform for governed industrial automation,
machine/process control, OT cybersecurity, simulation, verification, and
evidence-driven validation.

## Research scope

The reference plant is a Thermal Materials Processing Pilot Plant composed of:

- Data acquisition and industrial Ethernet devices
- Normal startup and normal operation
- Steady-state control
- Normal shutdown
- Emergency shutdown research logic
- Cooling Water System
- Process Gas System
- Thermal System
- Material Feed and Discharge System
- Industrial I/O and instrumentation
- PLC/IEC 61131-3 interoperability
- Ignition SCADA/HMI
- Modbus TCP, EtherNet/IP and OPC UA research
- Plant simulation and fault injection
- SFAT and evidence generation

## Non-claims

This repository does NOT, by repository existence or test pass, claim:

- CE conformity
- EU Machinery Regulation conformity
- SIL, PL or Safety Integrity certification
- UL listing/certification
- NFPA compliance
- OSHA compliance
- ISA/IEC 62443 certification
- functional-safety approval
- production readiness

Every claim requires explicit scope, authority, requirement mapping,
implementation evidence, test evidence and adjudication.

## Canonical engineering chain

Authority -> Source -> Requirement -> Interpretation -> Control -> Architecture
-> Component Capability -> Configuration -> Action -> Test -> Evidence
-> Finding -> Decision -> Claim

## Core rules

Architecture Before Implementation.
Normative First.
Evidence First.
Security First.
Least Privilege.
Read-Only by Default.
Fail Closed.
Unknown remains UNKNOWN.
SCRIPT_PASS != CONFORMANCE.
TESTED != CERTIFIED.
