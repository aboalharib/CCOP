# CCOP – Climate Change Operation Platform
## Interface Control Document (ICD)

Document ID: CCOP-ICD-002  
Version: 2.6  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the interfaces between components of the Climate Change Operation Platform (CCOP).

The purpose of this Interface Control Document (ICD) is to ensure consistent communication between monitoring devices, backend services, and operational dashboards.

---

# 2 Scope

This document defines interfaces between:

- TerraNode monitoring stations
- TerraEdge monitoring stations
- TerraAir portable monitoring devices
- communication infrastructure
- CCOP Climate Intelligence Platform (CIP)
- geospatial dashboards
- environmental analytics services
- monitoring infrastructure including Zabbix

---

# 3 Referenced Documents

The following documents support this interface definition.

- CCOP System Vision Document  
- CCOP Architecture Description  
- CCOP Hybrid Platform Architecture Pattern  
- CCOP Backend Software Architecture  
- CCOP System Requirements Baseline  
- CCOP Data Model and Telemetry Specification  
- CCOP Sensor Lifecycle Management Architecture  
- CCOP TerraNode System Specification  
- CCOP TerraEdge System Specification  

---

# 4 Interface Overview

The CCOP system uses a distributed telemetry architecture.


Monitoring Devices
(TerraNode / TerraEdge / TerraAir)
↓
Communication Network
↓
CCOP Climate Intelligence Platform (CIP)
↓
Analytics / Dashboards
↓
Environmental Reporting


Devices transmit telemetry to the backend using secure network communication.

---

# 5 Device Identification Interface

Each monitoring device must transmit a unique device identifier.

Device ID format:


CCOP-[TYPE]-[NUMBER]


Examples:


CCOP-TN-001
CCOP-TE-010
CCOP-TA-003


Device codes:

| Code | Device |
|---|---|
TN | TerraNode |
TE | TerraEdge |
TA | TerraAir |

---

# 6 Telemetry Transport Interface

Telemetry messages are transmitted through the CCOP secure network architecture.

Pipeline:


Device
↓
WireGuard VPN
↓
Message Broker (Kafka / Pravega)
↓
Stream Processing (Apache Flink)
↓
Time-Series Storage
↓
CCOP Climate Intelligence Platform


---

# 7 Telemetry Message Format

Telemetry messages use JSON format.

Example telemetry message:

```json
{
  "device_id": "CCOP-TN-001",
  "timestamp": "2026-03-09T10:15:30Z",
  "gps": {
    "lat": 25.68,
    "lon": 51.50
  },
  "weather": {
    "temperature": 33.2,
    "humidity": 58,
    "pressure": 1009
  },
  "air_quality": {
    "pm25": 9.8,
    "pm10": 12.1,
    "o3": 0.03,
    "no2": 0.011,
    "so2": 0.004
  },
  "system": {
    "power": 12.3,
    "internal_temp": 36
  }
}
8 Sensor Lifecycle Telemetry Interface

TerraNode and TerraEdge devices shall transmit sensor lifecycle information as part of system telemetry.

Lifecycle telemetry fields include:

Field	Description
sensor_name	sensor model identifier
parameter	measured gas or parameter
sensor_serial	sensor serial number
install_date	date sensor was installed
lifespan_days	expected sensor lifespan
days_used	days since installation
days_remaining	estimated days before sensor replacement
life_percent	percentage of remaining operational life
lifecycle_status	sensor health status
9 Lifecycle Status Codes

Lifecycle status shall follow the classification below.

Code	Status
0	OK
1	WARNING
2	CRITICAL
3	EXPIRED

These values allow automated monitoring alerts.

10 Example Lifecycle Telemetry

Example lifecycle telemetry message.

{
  "device_id": "CCOP-TN-001",
  "sensor_lifecycle": {
    "parameter": "NH3",
    "sensor_serial": "NH3-2026-0002",
    "install_date": "2026-01-15",
    "lifespan_days": 730,
    "days_used": 120,
    "days_remaining": 610,
    "life_percent": 83.6,
    "lifecycle_status": 0
  }
}
11 Zabbix Monitoring Interface

Lifecycle metrics shall also be transmitted to the Zabbix monitoring system.

Example Zabbix items:

sensor.nh3.days_remaining
sensor.nh3.life_percent
sensor.nh3.status
sensor.no2.days_remaining
sensor.no2.life_percent
sensor.no2.status
sensor.hf.days_remaining
sensor.hf.life_percent
sensor.hf.status

These metrics allow automated alerts for sensor replacement planning.

12 Security Interface

All telemetry communication shall use:

WireGuard VPN encryption

device authentication

encrypted telemetry transport

These mechanisms protect data integrity and system security.

13 Version Control

All interface changes must be version controlled.

Future revisions shall maintain backward compatibility where possible.

14 Revision History
Version	Description
2.5	Previous ICD baseline
2.6	Added sensor lifecycle telemetry interface


