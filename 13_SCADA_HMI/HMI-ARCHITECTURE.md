# Ignition SCADA/HMI Research Architecture

## Views
- Plant Overview
- Thermal System
- Cooling Water
- Process Gas
- Material Feed
- Material Discharge
- Sequence Status
- Interlock/Permissive Matrix
- Alarm Summary
- Trends
- Device Diagnostics
- Maintenance
- SFAT / Simulation view

## Reusable faceplates
- Motor
- Pump
- Valve
- VFD
- Analog Instrument
- Temperature
- Pressure
- Flow
- Level
- PID Loop
- Interlock
- Sequence

## Design rules
- Alarm != event != status.
- Color alone shall not be the only carrier of critical state.
- Command authority shall be explicit.
- Bad/uncertain/stale quality shall be visible.
- Simulation shall be visibly distinguishable.
- HMI must never be assumed to be the sole safety layer.
- Tag write permissions follow least privilege.
- Every operator command requiring auditability is timestamped and attributed.
