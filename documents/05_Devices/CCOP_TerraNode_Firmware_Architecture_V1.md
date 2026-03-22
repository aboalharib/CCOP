# CCOP – Climate Change Operation Platform
## TerraNode Firmware Architecture

Document ID: CCOP-TN-FW-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the firmware architecture of the TerraNode environmental monitoring station.

The purpose of this document is to describe the software components responsible for:

- sensor data acquisition
- environmental telemetry generation
- lifecycle monitoring
- communication with the CCOP backend
- system health monitoring

The firmware architecture ensures that TerraNode devices operate reliably within the CCOP environmental monitoring network.

---

# 2 Scope

This firmware architecture applies to the TerraNode monitoring station.

The architecture supports:

- environmental sensor integration
- telemetry generation
- device monitoring
- secure communication
- integration with the CCOP Climate Intelligence Platform (CIP)

---

# 3 Software Platform

TerraNode firmware is designed using Python running on a Linux-based embedded platform.

Primary software environment:

| Component | Description |
|---|---|
Operating system | Linux-based system |
Programming language | Python |
Sensor communication | I²C, RS-485, UART, ADC |
Telemetry format | JSON |
Backend communication | secure network connection |

Python allows rapid development and easy integration of sensor drivers and data processing modules.

---

# 4 Firmware Architecture Overview

The TerraNode firmware is structured as a modular system.


Sensor Drivers
↓
Sensor Manager
↓
Data Normalization Layer
↓
Calibration and Correction Engine
↓
Telemetry Builder
↓
Communication Manager
↓
Backend Transmission


Each layer has a defined responsibility.

---

# 5 Firmware Modules

The TerraNode firmware includes several major modules.

| Module | Function |
|---|---|
Sensor Drivers | hardware communication with sensors |
Sensor Manager | coordinated sensor reading |
Data Normalization | conversion to standard units |
Calibration Engine | correction models |
Telemetry Builder | JSON telemetry generation |
Lifecycle Monitor | sensor lifespan tracking |
Communication Manager | secure data transmission |
Zabbix Integration | system monitoring metrics |

---

# 6 Sensor Driver Layer

The sensor driver layer handles direct communication with hardware devices.

Examples include:

| Sensor | Interface |
|---|---|
Weather station | Modbus RTU via RS-485 |
Gas sensors | I²C |
UV sensor | I²C |
Power monitors | I²C |
Noise sensor | ADC |
GPS module | UART |

Drivers translate hardware signals into software data structures.

---

# 7 Sensor Manager

The sensor manager coordinates sensor reading operations.

Responsibilities include:

- scheduling sensor reads
- handling communication retries
- collecting sensor measurements
- forwarding data to the normalization layer

This component ensures reliable data acquisition.

---

# 8 Data Normalization

Sensor readings must be converted into consistent engineering units.

Examples include:

| Parameter | Unit |
|---|---|
Temperature | °C |
Humidity | %RH |
Pressure | Pa |
Wind Speed | m/s |
Rainfall | mm |

Normalization ensures consistent telemetry formatting.

---

# 9 Calibration and Correction Engine

The calibration engine applies correction models to raw sensor values.

Correction inputs may include:

- temperature compensation
- humidity compensation
- calibration coefficients

Corrected values improve measurement accuracy.

---

# 10 Sensor Lifecycle Monitoring

The lifecycle module tracks the operational lifespan of sensors.

Tracked parameters include:

| Parameter | Description |
|---|---|
install_date | sensor installation date |
lifespan_days | expected lifespan |
days_used | days since installation |
days_remaining | estimated remaining life |
lifecycle_status | operational status |

This information supports predictive maintenance.

---

# 11 Telemetry Builder

The telemetry builder generates JSON telemetry messages.

Example structure:

```json
{
  "device_id": "CCOP-TN-001",
  "timestamp": "2026-03-09T10:15:30Z",
  "environment": {
    "temperature": 33.2,
    "humidity": 58,
    "pressure": 1009
  },
  "air_quality": {
    "pm25": 9.8,
    "o3": 0.03,
    "no2": 0.011
  },
  "system": {
    "power_input": 12.3,
    "internal_temperature": 36
  }
}

This message format aligns with the CCOP telemetry data model.

12 Communication Manager

The communication manager handles data transmission to the backend.

Supported communication methods include:

Ethernet

Wi-Fi

5G cellular

Secure communication is established through VPN connections.

The manager handles:

connection management

retry logic

transmission scheduling

13 Zabbix Monitoring Integration

TerraNode integrates with the Zabbix monitoring system.

Metrics transmitted include:

Metric	Purpose
CPU usage	system health
memory usage	resource monitoring
device uptime	availability monitoring
sensor lifecycle metrics	predictive maintenance

Zabbix alerts enable proactive maintenance.

14 Error Handling

The firmware includes error handling mechanisms.

These include:

sensor communication retry

connection failure recovery

telemetry queue buffering

logging of system events

Error handling ensures continuous operation.

15 Software Logging

The firmware maintains logs for diagnostics.

Logged events include:

sensor read errors

communication failures

lifecycle warnings

system startup and shutdown events

Logs assist troubleshooting.

16 Firmware Update Strategy

The TerraNode firmware should support software updates.

Update strategies may include:

remote update through secure network

manual update during maintenance

Updates allow software improvements without hardware replacement.

17 Relationship to Other Documents

This document supports:

CCOP_TerraNode_System_Specification_V3.md

CCOP_TerraNode_Electrical_Architecture_and_Wiring_Package_V1.md

CCOP_Data_Model_and_Telemetry_Specification_V2_5.md

CCOP_Verification_and_Validation_Plan_V2_7.md

18 Revision History
Version	Description
1.0	Initial TerraNode firmware architecture


