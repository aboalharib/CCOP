nano 05_Devices/CCOP_TerraEdge_Electrical_Architecture_and_Wiring_Package_V1.md# CCOP – Climate Change Operation Platform
## TerraEdge Electrical Architecture and Wiring Package

Document ID: CCOP-TE-ELEC-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the electrical architecture and wiring design intent for the TerraEdge environmental monitoring device.

The purpose of this document is to provide a system-level electrical design reference for:

- prototype assembly
- manufacturing preparation
- firmware integration
- maintenance and troubleshooting

This document describes the electrical integration of sensors, power systems, and communication interfaces within the TerraEdge device.

---

# 2 Scope

This electrical architecture applies to the TerraEdge monitoring device deployed within the CCOP environmental monitoring network.

The architecture supports:

- environmental sensor integration
- telemetry generation
- lifecycle monitoring
- backend communication
- system health monitoring

---

# 3 Design Inheritance

The TerraEdge electrical architecture is derived from the TerraNode electrical architecture.

Key differences include:

| Subsystem | TerraNode | TerraEdge |
|---|---|---|
Weather Station | Included | Not included |
RS-485 Interface | Used for weather station | Not required |
Meteorological Sensors | Present | Not present |

All other electrical subsystems remain identical to the TerraNode architecture.

This design allows reuse of firmware, sensor interfaces, and telemetry architecture.

---

# 4 Electrical Architecture Overview


Solar Panel
│
Charge Controller
│
Battery
│
External DC Input
│
DC Power Distribution Bus
│
┌───────────────────────────────┐
│ Raspberry Pi CM5 │
│ Main Controller │
└──────────────┬────────────────┘
│
├──────── I²C Main Bus
│ ├── Multiplexer 0x70
│ └── Multiplexer 0x71
│
├──────── UART → GPS Module
│
├──────── USB → 5G Modem
│
├──────── ADC → Noise Sensor
│
└──────── Ethernet / WiFi


The TerraEdge architecture removes the RS-485 weather station subsystem.

---

# 5 Power Architecture

## 5.1 Power Sources

| Source | Function |
|---|---|
Solar Panel | field power generation |
Battery | energy storage |
External DC Input | service or fixed-site power |

---

## 5.2 Power Distribution

Power is distributed to the following subsystems:

- Raspberry Pi CM5
- sensor buses
- GPS module
- modem
- ADC subsystem
- communication interfaces

---

## 5.3 Power Monitoring

Two INA226 devices provide power monitoring.

| Device | Function | Address |
|---|---|---|
INA226A | system input monitoring | 0x71 "2" |
INA226B | solar / battery monitoring | 0x71 "4" |

Power metrics are transmitted to the CCOP backend and Zabbix monitoring system.

---

# 6 Interface Buses

## 6.1 I²C Sensor Bus

The I²C bus provides the primary interface for environmental sensors.

Two multiplexer domains are used:

| Multiplexer | Purpose |
|---|---|
0x70 | core pollutant sensors |
0x71 | environmental sensors and system monitoring |

---

## 6.2 ADC Interface

The ADC subsystem supports analog sensor measurements.

| Sensor | Interface |
|---|---|
Noise sensor | ADC input |

Additional analog sensors may be added in future revisions.

---

## 6.3 UART Interface

| Device | Interface | Purpose |
|---|---|---|
GPS Module | UART | position and time synchronization |

---

## 6.4 USB Interface

| Device | Interface | Purpose |
|---|---|---|
5G modem | USB | fallback network communication |

---

## 6.5 Network Interfaces

| Interface | Function |
|---|---|
Ethernet | primary communication |
Wi-Fi | secondary communication |
5G cellular | fallback communication |

All network communication uses secure VPN tunnels.

---

# 7 I²C Sensor Mapping

## Multiplexer 0x70

| Channel | Sensor | Function |
|---|---|---|
0x70 "0" | CO sensor | carbon monoxide |
0x70 "1" | H₂S sensor | hydrogen sulfide |
0x70 "2" | SEN0460 | PM1 / PM2.5 / PM10 |
0x70 "3" | SEN0472 | ozone |
0x70 "4" | SEN0465 | oxygen |
0x70 "5" | SEN0471 | nitrogen dioxide |
0x70 "6" | SEN0636 | UV index |
0x70 "7" | SEN0475 | hydrogen fluoride |

---

## Multiplexer 0x71

| Channel | Sensor | Function |
|---|---|---|
0x71 "0" | SEN0469 | ammonia |
0x71 "1" | SEN0470 | sulfur dioxide |
0x71 "2" | INA226A | system power monitoring |
0x71 "3" | reserved / ADC reference | noise sensor integration |
0x71 "4" | INA226B | solar / battery monitoring |
0x71 "5" | DS18B20 | enclosure temperature |
0x71 "6" | GR-BD-GPS | GPS integration reference |
0x71 "7" | reserved | future expansion |

---

# 8 Connector and Pin Mapping Intent

This section defines the intended signal structure rather than final PCB pin numbers.

---

## I²C Bus

| Signal | Function |
|---|---|
SDA | I²C data |
SCL | I²C clock |
3.3V | sensor power |
GND | ground |

---

## UART GPS

| Signal | Function |
|---|---|
TX | GPS transmit |
RX | GPS receive |
VCC | module power |
GND | ground |

---

## ADC Sensor

| Signal | Function |
|---|---|
AIN | analog measurement input |
VCC | sensor power |
GND | ground |

---

## USB Modem

| Signal | Function |
|---|---|
USB data | modem communication |
USB power | modem supply |

---

# 9 Wiring Integration Rules

The TerraEdge wiring design must follow these guidelines:

- sensor wiring must not obstruct airflow chamber
- power cables must be isolated from sensor signal wiring
- USB modem cabling must be strain-relieved
- internal wiring must be secured to prevent vibration damage
- all external cable entry points must use sealed cable glands

---

# 10 Electrical Separation

Subsystem separation rules:

| Subsystem | Requirement |
|---|---|
Power system | isolated from airflow chamber |
Electronics | separated from sensor airflow path |
Analog sensors | shielded from high-current wiring |

These rules minimize measurement noise.

---

# 11 Manufacturing and Integration Use

This electrical architecture supports:

- prototype assembly
- manufacturing planning
- firmware interface development
- maintenance troubleshooting

This document must be used together with:

- TerraEdge Mechanical Engineering Package
- TerraEdge System Specification
- CCOP Hardware BOM Baseline

---

# 12 Assumptions and Future Engineering Items

Items to be finalized in future revisions:

- CM5 carrier board pin assignment
- final ADC component selection
- connector types and part numbers
- fuse and surge protection design
- cable harness lengths

These items will be finalized during prototype development.

---

# 13 Related Documents

This document supports:

- CCOP_TerraEdge_System_Specification_V2.md
- CCOP_TerraNode_Electrical_Architecture_and_Wiring_Package_V1.md
- CCOP_Data_Model_and_Telemetry_Specification.md
- CCOP_Verification_and_Validation_Plan.md

---

# 14 Revision History

| Version | Description |
|---|---|
| 1.0 | Initial TerraEdge electrical architecture and wiring package |


