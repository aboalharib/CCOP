# CCOP – Climate Change Operation Platform
## TerraAir System Specification

Document ID: CCOP-TA-SPEC-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the system specification for the TerraAir environmental monitoring device.

TerraAir is a compact air-quality monitoring device designed for portable deployment and localized environmental monitoring.

The device complements TerraNode and TerraEdge within the CCOP environmental monitoring architecture.

---

# 2 Role within CCOP Architecture

The TerraAir device operates in the **third tier of the CCOP monitoring pyramid**.

| Tier | Device | Role |
|---|---|---|
Tier 1 | Reference Stations | calibration baseline |
Tier 2 | TerraNode | regional monitoring |
Tier 3 | TerraEdge / TerraAir | localized monitoring |

TerraAir is intended for high-density monitoring environments where fixed installations are not required.

---

# 3 Design Inspiration

The TerraAir architecture follows the design pattern used by compact air-quality monitoring devices such as the **AirGradient Open Air platform**.

These devices are characterized by:

- compact form factor
- integrated particulate monitoring
- environmental sensing
- Wi-Fi telemetry connectivity

TerraAir adapts this architecture to operate within the CCOP monitoring ecosystem.

---

# 4 System Overview

TerraAir is a compact environmental monitoring device capable of measuring air-quality indicators and transmitting telemetry to the CCOP backend platform.

Typical deployment environments include:

- buildings
- indoor environments
- small outdoor monitoring sites
- temporary environmental measurement locations

---

# 5 Core Sensor Suite

The TerraAir sensor configuration focuses on core environmental indicators.

| Sensor | Parameter |
|---|---|
Particulate sensor | PM1 / PM2.5 / PM10 |
Environmental sensor | temperature |
Environmental sensor | humidity |
Environmental sensor | pressure |
Gas sensor | VOC index |
Gas sensor | CO₂ concentration |

This sensor suite provides key indicators for environmental monitoring.

---

# 6 Processing Platform

The TerraAir device uses a lightweight embedded controller.

Typical controller characteristics include:

| Component | Description |
|---|---|
Microcontroller | ESP32 or equivalent |
Connectivity | Wi-Fi |
Firmware language | C++ or Python |
Telemetry format | JSON |

The controller manages sensor reading, telemetry generation, and network communication.

---

# 7 Communication Architecture

TerraAir communicates with the CCOP backend using Wi-Fi.

Communication flow:


TerraAir
↓
Wi-Fi Network
↓
Secure Gateway
↓
Telemetry Ingestion
↓
CCOP Climate Intelligence Platform


Telemetry messages are transmitted using secure network connections.

---

# 8 Telemetry Structure

Environmental data is transmitted in JSON format.

Example telemetry message:

```json
{
  "device_id": "CCOP-TA-001",
  "timestamp": "2026-03-09T10:15:30Z",
  "environment": {
    "temperature": 28.3,
    "humidity": 55,
    "pressure": 1012
  },
  "air_quality": {
    "pm25": 12.1,
    "pm10": 18.3,
    "co2": 620,
    "voc_index": 42
  }
}

The telemetry schema aligns with the CCOP data model.

9 Firmware Architecture

TerraAir firmware includes the following modules.

Module	Function
Sensor Drivers	hardware communication
Sensor Manager	coordinated sensor reading
Data Normalization	engineering unit conversion
Telemetry Builder	JSON message generation
Communication Manager	network transmission

The firmware structure is similar to TerraNode but simplified.

10 Power System

TerraAir devices are typically powered by:

Power Source	Use Case
USB power	indoor monitoring
Battery	portable monitoring
External adapter	building installation

Low power consumption enables portable operation.

11 Mechanical Design

TerraAir uses a compact enclosure designed for:

indoor monitoring

portable operation

tabletop or wall mounting

Airflow openings allow ambient air exposure to sensors.

12 Integration with CCOP Platform

TerraAir devices integrate with the CCOP Climate Intelligence Platform.

Capabilities include:

environmental telemetry ingestion

device monitoring

data visualization

environmental reporting

TerraAir measurements appear alongside TerraNode and TerraEdge measurements in CCOP dashboards.

13 Operational Use Cases

Typical TerraAir deployments include:

indoor air-quality monitoring

smart building environmental monitoring

temporary environmental investigations

high-density sensor deployments

These use cases complement the TerraNode monitoring network.

14 Relationship to Other Documents

This document supports:

CCOP_Data_Model_and_Telemetry_Specification

CCOP_Operational_Deployment_Plan

CCOP_Environmental_Monitoring_Pyramid_Diagram

CCOP_Backend_Software_Architecture

15 Revision History
Version	Description
1.0	Initial TerraAir system specification


