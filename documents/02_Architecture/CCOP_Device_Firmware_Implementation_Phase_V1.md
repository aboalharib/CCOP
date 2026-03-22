# CCOP – Climate Change Operation Platform
## Device Firmware Implementation Phase

Document ID: CCOP-IMPL-FW-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the device firmware implementation phase for the CCOP system.

The purpose of this phase is to establish the firmware structure required for TerraNode, TerraEdge, and TerraAir devices before backend and hardware deployment.

---

# 2 Scope

This phase applies to:

- TerraNode firmware
- TerraEdge firmware
- TerraAir firmware
- shared telemetry modules
- shared lifecycle modules
- shared logging and configuration modules

---

# 3 Objectives

The firmware implementation phase shall produce:

- a reusable firmware repository structure
- shared telemetry schema support
- sensor lifecycle calculation modules
- device-specific application entry points
- basic local telemetry generation

---

# 4 Repository Target

The firmware phase shall produce a repository aligned with the documented device architecture.

Target repository:

```text
ccop-firmware
├── shared
├── terranode
├── terraedge
└── terraair
5 Implementation Order

The firmware phase shall be implemented in the following order:

shared telemetry modules

shared lifecycle modules

TerraNode minimal firmware path

TerraEdge derived firmware path

TerraAir simplified firmware path

6 Minimum Functional Output

The firmware phase is considered successful when device code can:

read or simulate sensor values

normalize values

build valid JSON telemetry

include lifecycle status

print or save telemetry locally

7 TerraNode Firmware Scope

TerraNode firmware shall support:

weather station interface

PM sensing

gas sensing

GPS support

power monitoring

lifecycle telemetry

Zabbix monitoring hooks

8 TerraEdge Firmware Scope

TerraEdge firmware shall support the same core air-quality sensing architecture as TerraNode, without the meteorological subsystem.

TerraEdge shall reuse as much TerraNode firmware structure as possible.

9 TerraAir Firmware Scope

TerraAir firmware shall support:

compact sensor integration

Wi-Fi communication

JSON telemetry generation

simplified system health monitoring

10 Success Criteria

This phase is complete when:

TerraNode firmware produces valid telemetry

TerraEdge firmware produces valid telemetry

TerraAir firmware produces valid telemetry

telemetry payloads align with the CCOP data model

lifecycle fields are present in supported devices

11 Relationship to Other Documents

This document supports:

CCOP_TerraNode_Firmware_Architecture_V1

CCOP_TerraEdge_Firmware_Architecture_V1

CCOP_TerraAir_Firmware_Architecture_V1

CCOP_Data_Model_and_Telemetry_Specification_V2_6

12 Revision History
Version	Description
1.0	Initial device firmware implementation phase


