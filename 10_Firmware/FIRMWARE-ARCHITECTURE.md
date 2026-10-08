# Industrial Control Firmware Architecture

## Platform layer
BSP
-> HAL
-> Drivers

## Infrastructure layer
IO_Manager
Network_Manager
Protocol_Stack
Diagnostics
Event_Recorder
Evidence_Interface
Boot_Update

## Control layer
Control_Engine
Sequence_Engine
Interlock_Engine
Alarm_Engine
Safety_Supervisor

## Process application layer
Cooling_Water_System
Process_Gas_System
Thermal_System
Material_Feed_System
Material_Discharge_System
Normal_Operation
Normal_Shutdown
Emergency_Shutdown_Research_Logic

## Boundary rules
- Safety_Supervisor is an architectural research component; its existence does
  not imply a certified safety controller.
- Deterministic control and non-deterministic services shall be separated by
  explicit timing/resource boundaries.
- Network loss must not silently defeat local safe behavior.
- Watchdog/reset/brownout/recovery behavior requires explicit requirements.
- Secure boot/update, debug/JTAG state, rollback protection and provenance are
  architecture requirements before production-like promotion.
