# CCOP – Climate Change Operation Platform
## Stage Handoff – Firmware, CIP, and Simulation

Document ID: CCOP-HANDOFF-001  
Version: 1.0  
Status: Working Handoff  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Current Stage

The project has completed the documentation baseline and is now entering implementation.

Current implementation order:

1. Device firmware foundation  
2. CIP ingestion and backend core  
3. Simulation and synthetic devices  
4. Zabbix operational monitoring  
5. Bench prototype and hardware bring-up  
6. Pilot deployment preparation  

---

# 2 Current Repositories Planned

## Firmware
`ccop-firmware`

Purpose:
- TerraNode firmware
- TerraEdge firmware
- TerraAir firmware
- shared telemetry and lifecycle modules

## Backend
`ccop-cip-platform`

Purpose:
- telemetry ingestion
- payload validation
- raw telemetry storage
- processed telemetry storage
- latest telemetry API

## Simulation
`ccop-simulation`

Purpose:
- TerraNode simulator
- TerraEdge simulator
- TerraAir simulator
- normal and failure scenarios

## Monitoring
`ccop-monitoring`

Purpose:
- Zabbix server configuration
- device monitoring templates
- lifecycle alerts
- operational health monitoring

---

# 3 Approved Architecture

## Device Classes
- TerraNode = full environmental monitoring station with weather station
- TerraEdge = TerraNode air-quality architecture without meteorological subsystem
- TerraAir = compact portable / indoor monitoring device

## Monitoring Pyramid
- Tier 1 = Reference Monitoring Stations
- Tier 2 = TerraNode
- Tier 3 = TerraEdge / TerraAir

## Backend Separation
- CIP = environmental telemetry and analytics
- Zabbix = infrastructure and device health monitoring

---

# 4 Current Build Status

## Documentation
Documentation baseline completed and expanded with:
- system architecture baseline
- execution plan
- implementation phases
- Kanban task breakdown
- updated requirements
- updated deployment and CONOPS

## Firmware
Current focus:
- create `ccop-firmware`
- build shared telemetry schema
- build lifecycle calculator
- implement minimal TerraNode app
- implement minimal TerraEdge app

## Backend
Next focus after firmware:
- create `ccop-cip-platform`
- ingest JSON telemetry
- validate payloads
- store raw and processed telemetry
- expose latest telemetry API

## Simulation
Next focus after backend:
- create `ccop-simulation`
- simulate TerraNode / TerraEdge / TerraAir payloads
- send simulated data into CIP

---

# 5 Important Rules

- raw telemetry must always be preserved
- telemetry uses JSON
- lifecycle fields remain part of supported device payloads
- Zabbix remains separate from CIP analytics
- hardware does not start before firmware, backend, and simulation are stable

---

# 6 Immediate Next Tasks

1. finalize `ccop-firmware` repository structure
2. test `terranode.main`
3. test `terraedge.main`
4. create `ccop-cip-platform`
5. test telemetry ingestion
6. create `ccop-simulation`

---

# 7 Next Chat Starting Prompt

Use this prompt in the next chat:

Continue the CCOP implementation stage from the handoff document:
CCOP_Stage_Handoff_Firmware_Backend_Simulation_V1.md

Current focus:
1. ccop-firmware
2. ccop-cip-platform
3. ccop-simulation

Keep the approved architecture:
- TerraNode
- TerraEdge
- TerraAir
- CIP
- Zabbix
- monitoring pyramid

Start step by step from the current firmware stage without repeating earlier documentation work.


