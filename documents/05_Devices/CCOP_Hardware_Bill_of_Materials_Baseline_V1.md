# CCOP – Climate Change Operation Platform
## Hardware Bill of Materials (BOM) Baseline

Document ID: CCOP-BOM-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the baseline hardware Bill of Materials (BOM) for the CCOP monitoring devices.

The purpose of this BOM is to identify the major hardware components required for the manufacture, assembly, deployment, and maintenance of CCOP monitoring stations.

This baseline currently applies to:

- TerraNode
- TerraEdge

TerraAir may be added in a future revision.

---

# 2 Scope

This BOM baseline supports:

- procurement planning
- hardware standardization
- supplier coordination
- manufacturing preparation
- maintenance spare planning
- configuration management

---

# 3 BOM Baseline Principles

The CCOP hardware BOM baseline shall:

- identify major hardware assemblies
- provide one baseline component list per device type
- support controlled engineering revisions
- support replacement and maintenance planning

This document is a **baseline engineering BOM**, not a final commercial purchasing list.

Exact vendor, pricing, and sourcing details may be maintained separately in procurement records.

---

# 4 Device Coverage

| Device | Coverage Status |
|---|---|
| TerraNode | Included |
| TerraEdge | Included |
| TerraAir | Future revision |

---

# 5 TerraNode Hardware BOM Baseline

## 5.1 Core Processing and Control

| Item | Component | Qty | Notes |
|---|---|---:|---|
TN-001 | Raspberry Pi CM5 | 1 | main processing platform |
TN-002 | Industrial storage media | 1 | system storage |
TN-003 | I²C multiplexer 0x70 | 1 | sensor expansion |
TN-004 | I²C multiplexer 0x71 | 1 | sensor expansion |
TN-005 | RS485 interface module | 1 | weather station communication |
TN-006 | GPS module (GR-BD-GPS) | 1 | position and time reference |

---

## 5.2 Meteorological Sensors

| Item | Component | Qty | Notes |
|---|---|---:|---|
TN-010 | LINOVISION RS485 Modbus 7-in-1 Weather Station | 1 | temperature, humidity, pressure, wind, rainfall, light |

---

## 5.3 Air Quality and Environmental Sensors

| Item | Component | Qty | Notes |
|---|---|---:|---|
TN-020 | CO sensor module | 1 | carbon monoxide |
TN-021 | H₂S sensor module | 1 | hydrogen sulfide |
TN-022 | SEN0460 | 1 | PM1 / PM2.5 / PM10 |
TN-023 | SEN0472 | 1 | ozone |
TN-024 | SEN0465 | 1 | oxygen |
TN-025 | SEN0471 | 1 | nitrogen dioxide |
TN-026 | SEN0636 | 1 | UV index |
TN-027 | SEN0475 | 1 | hydrogen fluoride |
TN-028 | SEN0469 | 1 | ammonia |
TN-029 | SEN0470 | 1 | sulfur dioxide |
TN-030 | SEN0232 | 1 | noise monitoring |
TN-031 | DS18B20 | 1 | enclosure temperature |

---

## 5.4 Power Monitoring and Electrical

| Item | Component | Qty | Notes |
|---|---|---:|---|
TN-040 | INA226A | 1 | system input monitoring |
TN-041 | INA226B | 1 | solar / battery branch monitoring |
TN-042 | Power regulation module | 1 | internal power control |
TN-043 | DC input interface | 1 | external DC supply |
TN-044 | Battery system | 1 | backup power |
TN-045 | Solar charge controller | 1 | solar charging |
TN-046 | Solar panel | 1 | field power source |

---

## 5.5 Communications

| Item | Component | Qty | Notes |
|---|---|---:|---|
TN-050 | Ethernet interface | 1 | primary communications |
TN-051 | Wi-Fi interface | 1 | secondary communications |
TN-052 | 5G modem | 1 | fallback communications |
TN-053 | WireGuard VPN software profile | 1 | secure communications configuration |

---

## 5.6 Mechanical and Enclosure

| Item | Component | Qty | Notes |
|---|---|---:|---|
TN-060 | Main enclosure body | 1 | weather-resistant enclosure |
TN-061 | Airflow chamber assembly | 1 | PM and gas airflow path |
TN-062 | Rain hood / protected intake | 1 | weather protection |
TN-063 | Insect mesh / filter assembly | 1 | airflow protection |
TN-064 | Internal mounting plate | 1 | hardware mounting |
TN-065 | Pole mounting bracket set | 1 | field installation |
TN-066 | Cable gland set | 1 | sealed cable entry |

---

# 6 TerraEdge Hardware BOM Baseline

## 6.1 Core Processing and Control

| Item | Component | Qty | Notes |
|---|---|---:|---|
TE-001 | Embedded processing unit | 1 | main control platform |
TE-002 | Industrial storage media | 1 | system storage |
TE-003 | I²C multiplexer | 1 | sensor expansion |
TE-004 | GPS module (optional) | 1 | location/time reference if required |

---

## 6.2 Air Quality and Environmental Sensors

| Item | Component | Qty | Notes |
|---|---|---:|---|
TE-010 | CO sensor module | 1 | carbon monoxide |
TE-011 | H₂S sensor module | 1 | hydrogen sulfide |
TE-012 | SEN0460 | 1 | PM1 / PM2.5 / PM10 |
TE-013 | O₃ sensor module | 1 | ozone |
TE-014 | NO₂ sensor module | 1 | nitrogen dioxide |
TE-015 | SO₂ sensor module | 1 | sulfur dioxide |
TE-016 | NH₃ sensor module | 1 | ammonia |
TE-017 | HF sensor module | 1 | hydrogen fluoride |
TE-018 | SEN0636 | 1 | UV index |
TE-019 | SEN0232 | 1 | noise monitoring |
TE-020 | DS18B20 | 1 | enclosure temperature |

---

## 6.3 Power and Communications

| Item | Component | Qty | Notes |
|---|---|---:|---|
TE-030 | Power regulation module | 1 | internal power control |
TE-031 | Battery / backup power | 1 | local backup |
TE-032 | Ethernet interface | 1 | primary communications |
TE-033 | Wi-Fi interface | 1 | secondary communications |
TE-034 | 5G modem | 1 | fallback communications |
TE-035 | WireGuard VPN software profile | 1 | secure communications configuration |

---

## 6.4 Mechanical and Enclosure

| Item | Component | Qty | Notes |
|---|---|---:|---|
TE-040 | Main enclosure body | 1 | field enclosure |
TE-041 | Protected sensor airflow intake | 1 | PM and gas intake |
TE-042 | Insect mesh / filter assembly | 1 | airflow protection |
TE-043 | Internal mounting plate | 1 | hardware mounting |
TE-044 | Pole / wall mounting bracket set | 1 | installation |
TE-045 | Cable gland set | 1 | sealed cable entry |

---

# 7 Spare Parts Baseline

To support maintenance and reduce downtime, the following spare categories should be maintained.

| Spare Category | Examples |
|---|---|
Electrochemical sensors | CO, H₂S, NH₃, NO₂, SO₂, HF, O₃ |
Particulate sensors | PM sensor modules |
Power modules | INA226 modules, regulators |
Communications | modem modules, cables |
Mechanical parts | filters, airflow covers, brackets |

---

# 8 Configuration Control

All BOM items are configuration-controlled.

Any change to:

- component model
- quantity
- device baseline
- hardware revision

must be approved through the CCOP configuration management process.

---

# 9 Procurement Notes

This BOM baseline does not yet define:

- supplier pricing
- preferred vendor list
- lead times
- purchasing terms

These should be maintained in procurement documentation outside the engineering baseline.

---

# 10 Relationship to Other Documents

This BOM baseline supports:

- CCOP_TerraNode_System_Specification_V3.md
- CCOP_TerraEdge_System_Specification_V2.md
- CCOP_Maintenance_and_Asset_Lifecycle_Management_Plan_V1.md
- CCOP_Quality_Assurance_and_Configuration_Management_Plan_V1.md
- CCOP_Operational_Deployment_Plan_V1.md

---

# 11 Revision History

| Version | Description |
|---|---|
| 1.0 | Initial CCOP hardware BOM baseline for TerraNode and TerraEdge |



