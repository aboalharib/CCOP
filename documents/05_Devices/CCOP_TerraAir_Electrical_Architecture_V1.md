# CCOP – Climate Change Operation Platform
## TerraAir Electrical Architecture

Document ID: CCOP-TA-ELEC-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the electrical architecture of the TerraAir environmental monitoring device.

TerraAir is a compact air-quality monitoring unit designed for portable or indoor deployment within the CCOP monitoring ecosystem.

---

# 2 Design Principles

The TerraAir electrical design prioritizes:

| Principle | Description |
|---|---|
Low power operation | suitable for portable deployment |
Compact architecture | minimal wiring complexity |
Integrated sensing | multiple sensors on shared buses |
Wi-Fi communication | direct connection to CCOP backend |

---

# 3 Electrical Architecture Overview


USB Power
│
Power Regulation
│
┌───────────────┐
│ ESP32 Control │
└───────┬───────┘
│
├── I2C → Environmental Sensor
│ (Temp / Humidity / Pressure)
│
├── I2C → VOC Sensor
│
├── UART → PM Sensor
│
└── Wi-Fi → CCOP Backend


---

# 4 Power System

TerraAir devices typically use:

| Power Source | Description |
|---|---|
USB power | primary indoor power |
Battery | portable operation |
External adapter | fixed indoor installation |

Voltage regulation ensures stable operation for sensors and controller.

---

# 5 Controller Platform

| Component | Description |
|---|---|
Controller | ESP32 |
Connectivity | Wi-Fi |
Firmware language | C++ / MicroPython |
Telemetry format | JSON |

The ESP32 manages sensor acquisition and telemetry transmission.

---

# 6 Sensor Interfaces

TerraAir supports several sensor interfaces.

| Sensor | Interface |
|---|---|
PM sensor | UART |
Temperature / humidity | I2C |
VOC sensor | I2C |
CO2 sensor | UART or I2C |

---

# 7 Communication Interface

TerraAir communicates with the CCOP platform using Wi-Fi.


TerraAir
↓
Local Wi-Fi Network
↓
Secure Gateway
↓
CCOP Climate Intelligence Platform


---

# 8 Relationship to Other Documents

This document supports:

- CCOP_TerraAir_System_Specification_V1.md
- CCOP_Data_Model_and_Telemetry_Specification
- CCOP_Backend_Software_Architecture

---

# 9 Revision History

| Version | Description |
|---|---|
| 1.0 | Initial TerraAir electrical architecture |


