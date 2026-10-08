# Control Logic Architecture

Research languages/representations:
- Ladder Diagram
- Structured Text
- Function Block Diagram
- Sequential Function Chart where justified

Reference environment:
- Rockwell ControlLogix / Studio 5000 interoperability research
- Existing-codebase transition discipline
- Tag/naming/documentation convention preservation
- Change impact and regression evidence

Rules:
- Process logic derives from approved PCN/requirements.
- Interlocks and permissives have stable IDs.
- State transitions are explicit.
- Manual mode does not silently bypass safety constraints.
- Force/bypass states are governed and auditable.
- Simulation tags are unmistakably separated from physical I/O.
