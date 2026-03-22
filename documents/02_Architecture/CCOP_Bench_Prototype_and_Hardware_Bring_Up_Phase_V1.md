# CCOP – Climate Change Operation Platform
## Bench Prototype and Hardware Bring-Up Phase

Document ID: CCOP-IMPL-HW-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the bench prototype and hardware bring-up phase for the CCOP system.

The purpose of this phase is to validate real hardware operation in a controlled bench environment after firmware, backend, and simulation phases are stable.

---

# 2 Scope

This phase applies to:

- TerraNode bench prototype
- TerraEdge bench prototype
- TerraAir bench prototype
- firmware-to-hardware integration
- telemetry transmission from real devices
- initial Zabbix operational monitoring

---

# 3 Objectives

The bench prototype phase shall produce:

- one working TerraNode bench unit
- one working TerraEdge bench unit
- one working TerraAir bench unit
- successful telemetry from real hardware to CIP
- successful operational monitoring through Zabbix

---

# 4 Bring-Up Order

The approved bring-up order is:

1. TerraNode bench prototype
2. TerraEdge bench prototype
3. TerraAir bench prototype

TerraNode is first because it includes the most complete subsystem set.

---

# 5 TerraNode Bring-Up Scope

TerraNode bench validation shall include:

- weather station communication
- PM sensor reading
- selected gas sensor reading
- GPS integration
- power telemetry
- JSON telemetry generation
- transmission to CIP
- Zabbix health reporting

---

# 6 TerraEdge Bring-Up Scope

TerraEdge bench validation shall include:

- PM sensor reading
- selected gas sensor reading
- GPS integration if enabled
- power telemetry
- JSON telemetry generation
- transmission to CIP
- Zabbix health reporting

---

# 7 TerraAir Bring-Up Scope

TerraAir bench validation shall include:

- PM sensor reading
- compact environmental sensing
- Wi-Fi telemetry transmission
- JSON telemetry generation
- backend reception

---

# 8 Success Criteria

This phase is complete when:

- all three bench devices generate valid telemetry
- telemetry is accepted by CIP
- device health metrics are visible through Zabbix
- real hardware behavior matches simulation expectations

---

# 9 Relationship to Other Documents

This document supports:

- CCOP_TerraNode_System_Specification_V3
- CCOP_TerraEdge_System_Specification_V2
- CCOP_TerraAir_System_Specification_V1
- CCOP_Verification_and_Validation_Plan_V2_8
- CCOP_System_Architecture_Baseline_V1

---

# 10 Revision History

| Version | Description |
|---|---|
| 1.0 | Initial bench prototype and hardware bring-up phase |


