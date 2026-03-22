# CCOP – Climate Change Operation Platform
## TerraNode V2 Environmental Monitoring Station
### Integrated System Specification

Document ID: CCOP-TN-SPEC-001  
Version: 2.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the hardware, software, and operational specification for the TerraNode environmental monitoring station used within the CCOP monitoring network.

TerraNode is the primary environmental monitoring node within the CCOP system and provides continuous outdoor measurements of meteorological, air-quality, and environmental parameters.

---

# 2 Official Definition

TerraNode is an intelligent outdoor environmental monitoring edge device within the CCOP (Climate Change Operation Platform) designed to continuously collect meteorological, atmospheric, environmental, and system-health data and securely transmit it to the **CCOP Climate Intelligence Platform (CIP)** for analysis and decision-making.

---

# 3 Role in CCOP Monitoring Architecture

The CCOP monitoring system follows a **three-tier architecture**.

| Tier | System | Role |
|-----|------|------|
| Tier 1 | Reference Monitoring Stations | calibration and high-accuracy baseline |
| Tier 2 | TerraNode | distributed environmental monitoring |
| Tier 3 | TerraEdge / TerraAir | dense local sensing |

TerraNode provides regional monitoring coverage and calibration transfer for distributed sensors.

---

# 4 Deployment Scope

TerraNode supports deployment in:

- smart city environmental monitoring
- industrial air-quality monitoring
- climate observation networks
- environmental compliance monitoring
- coastal monitoring
- desert monitoring stations
- research climate networks

---

# 5 Communication Architecture

TerraNode supports multi-layer communication redundancy.

| Priority | Channel |
|---|---|
Primary | Ethernet |
Secondary | Wi-Fi |
Fallback | 5G cellular |

Security:

- WireGuard VPN
- encrypted telemetry
- device authentication

---

# 6 Meteorological Monitoring

**LINOVISION RS485 Modbus 7-in-1 Weather Station**

Measured parameters:

- temperature  
- humidity  
- barometric pressure  
- wind speed  
- wind direction  
- rainfall  
- light intensity  

Interface: **RS485 Modbus**

---

# 7 TerraNode V2 Sensor Suite (Engineering Freeze)

### Core Air-Quality Sensors

| No | Sensor | Parameter | Address |
|---|---|---|---|
1 | CO Sensor | Carbon Monoxide | 0x70 "0" |
2 | H₂S Sensor | Hydrogen Sulfide | 0x70 "1" |
3 | SEN0460 | PM1 / PM2.5 / PM10 | 0x70 "2" |
4 | SEN0472 | Ozone (O₃) | 0x70 "3" |
5 | SEN0465 | Oxygen (O₂) | 0x70 "4" |
6 | SEN0471 | Nitrogen Dioxide | 0x70 "5" |
7 | SEN0636 | UV Index | 0x70 "6" |
8 | SEN0475 | Hydrogen Fluoride | 0x70 "7" |

### Secondary Environmental Sensors

| Sensor | Function | Address |
|---|---|---|
SEN0469 | Ammonia (NH₃) | 0x71 "0" |
SEN0470 | Sulfur Dioxide (SO₂) | 0x71 "1" |
INA226A | System power monitoring | 0x71 "2" |
SEN0232 | Noise monitoring | 0x71 "3" |
INA226B | Solar/battery monitoring | 0x71 "4" |
DS18B20 | Internal enclosure temperature | 0x71 "5" |
GR-BD-GPS | GPS location & time reference | 0x71 "6" |
Reserved | Future expansion | 0x71 "7" |

---

# 8 Monitored Parameters

### Meteorological

- temperature  
- humidity  
- atmospheric pressure  
- wind speed  
- wind direction  
- rainfall  
- light intensity  

### Air Quality

- PM1  
- PM2.5  
- PM10  
- CO  
- O₃  
- NO₂  
- SO₂  
- NH₃  
- HF  
- H₂S  
- O₂  

### Environmental

- UV index  
- noise level  

### System Health

- power consumption  
- solar input  
- battery voltage  
- enclosure temperature  
- GPS time synchronization  

---

# 9 Sampling Schedule

| Parameter | Interval |
|---|---|
Weather station | 10 s |
Air-quality sensors | 30 s |
Noise monitoring | 10 s |
UV sensor | 30 s |
Power monitoring | 60 s |
System health | 60 s |
GPS | 60 s |

Data aggregation: **1-minute averages**

---

# 10 Calibration Workflow

Calibration occurs in three phases.

### Factory Calibration
Sensor baseline calibration by manufacturer.

### Laboratory Calibration
Cross-comparison with reference instrumentation.

### Field Calibration
Correction models derived using:

- co-location stations
- reference monitoring stations
- drift analysis

---

# 11 Sensor Correction Algorithms

Examples:

Linear correction


corrected = a * raw + b


Temperature correction


corrected = raw + k*(T − Tref)


Humidity correction


corrected = raw/(1 + h*RH)


Future versions may incorporate machine-learning models.

---

# 12 Telemetry JSON Format

Example message:

```json
{
 "device_id":"terranode_alkhor_01",
 "timestamp":"2026-03-09T10:15:30Z",
 "gps":{"lat":25.68,"lon":51.50},
 "weather":{"temperature":33.2,"humidity":58},
 "air_quality":{"pm25":9.8,"o3":0.03,"no2":0.011},
 "system":{"power":12.3,"internal_temp":36}
}
13 Backend Data Flow
TerraNode
   ↓
WireGuard VPN
   ↓
Kafka / Pravega
   ↓
Apache Flink
   ↓
Time-Series Database
   ↓
CCOP Climate Intelligence Platform (CIP)
   ↓
Environmental Dashboard
14 Zabbix Infrastructure Monitoring

Zabbix monitors device health.

Metric	Purpose
CPU usage	system load
Memory usage	stability
Network connectivity	communication health
Power voltage	energy monitoring
Enclosure temperature	thermal protection
Sensor update frequency	sensor health

Alerts include:

device offline

sensor failure

overheating

power instability

15 Hardware Architecture

Core platform:

Raspberry Pi CM5

I²C sensor bus

RS485 weather interface

ADC interface

GPS module

power monitoring modules

16 Power Architecture

Power sources:

solar panel

battery system

external DC input

Monitoring:

INA226A system input

INA226B solar/battery branch

Power metrics are transmitted to Zabbix and CIP.

17 Enclosure Airflow Design

The enclosure contains three functional zones.

Zone	Function
Air sampling zone	PM and gas sensors
Electronics zone	controller and communication modules
Power zone	battery and charging system

Sensors operate within a controlled airflow chamber.

18 Integrated Advanced Capabilities

TerraNode architecture includes support for:

VOC sensors

CO₂ atmospheric monitoring

AI-based anomaly detection

satellite communication compatibility

LoRaWAN redundancy

automated calibration modules

19 Network-Wide Sensor Correction Architecture

The CCOP network uses layered calibration.

Layer	Function
Reference stations	calibration baseline
Anchor TerraNodes	calibration transfer
Operational TerraNodes	field monitoring
Backend correction engine	network correction
20 Operations & Maintenance

Recommended maintenance schedule:

Task	Interval
Filter inspection	3 months
Sensor inspection	6 months
Calibration verification	12 months
Full system validation	12 months
21 Data Governance

Data governance ensures measurement traceability.

Key rules:

raw data preserved permanently

corrected data versioned

calibration history recorded

audit logs maintained

22 Reliability Engineering

Major risk categories:

hardware failure

power interruption

communication loss

environmental hazards

data integrity risk

Mitigation strategies include redundancy, monitoring, and preventive maintenance.

23 Final TerraNode V2 Recommendation

TerraNode V2 provides:

multi-pollutant gas monitoring

particulate pollution monitoring

meteorological monitoring

environmental monitoring

secure telemetry transmission

Zabbix infrastructure monitoring

modular sensor expansion

This architecture provides a robust and scalable environmental monitoring node for the CCOP Climate Change Operation Platform.

Revision History
Version	Description
1.0	Initial TerraNode specification
2.0	Integrated CCOP architecture, CIP backend, and sensor engineering freeze



