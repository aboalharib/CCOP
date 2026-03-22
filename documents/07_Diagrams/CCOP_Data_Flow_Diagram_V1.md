# CCOP – Climate Change Operation Platform
## Data Flow Diagram

Document ID: CCOP-DIAGRAM-002  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document presents the CCOP data flow diagram.

The purpose of this diagram is to show how environmental measurements move through the CCOP system from field devices to the backend platform, analytics services, and operator dashboards.

---

# 2 High-Level Data Flow

```text
Environmental Sensors
        ↓
Device Sensor Manager
(TerraNode / TerraEdge / TerraAir)
        ↓
Telemetry Builder
        ↓
Secure Communication
(WireGuard VPN)
        ↓
Message Broker
(Kafka / Pravega)
        ↓
Stream Processing
(Apache Flink)
        ↓
Validation Layer
        ↓
Calibration / Correction Engine
        ↓
Sensor Lifecycle Monitoring
        ↓
Data Governance Layer
        ↓
Time-Series Storage
        ↓
CCOP Climate Intelligence Platform (CIP)
        ↓
Dashboards / Analytics / Reporting
3 Device-Level Data Flow

At the device level, environmental data is collected and packaged before transmission.

Sensors
   ↓
Sensor Drivers
   ↓
Sensor Manager
   ↓
Data Normalization
   ↓
Telemetry JSON Builder
   ↓
Communication Manager
   ↓
VPN Network Layer

This flow applies primarily to TerraNode and TerraEdge.

4 Backend Processing Flow

The backend processes telemetry in several stages.

Telemetry Ingestion
      ↓
Validation
      ↓
Calibration / Correction
      ↓
Lifecycle Monitoring
      ↓
Data Governance
      ↓
Storage
      ↓
Analytics / Reporting

Each stage supports a different engineering function.

5 Validation Layer

The validation layer verifies:

required telemetry fields

timestamp validity

coordinate validity

expected measurement ranges

packet completeness

Invalid data is flagged but preserved for audit and diagnostics.

6 Calibration and Correction Layer

The calibration engine applies correction models to raw sensor values.

Functions include:

reference station comparison

pollutant-specific correction models

corrected value generation

correction model version tracking

Raw data and corrected data are both retained.

7 Sensor Lifecycle Monitoring Layer

The lifecycle monitoring layer applies to TerraNode and TerraEdge.

Functions include:

tracking installation dates

tracking expected sensor lifespan

calculating days used

calculating days remaining

assigning lifecycle status

publishing lifecycle metrics to Zabbix

This layer supports predictive maintenance.

8 Data Governance Layer

The data governance layer ensures that telemetry remains:

traceable

auditable

reproducible

suitable for reporting

Governance activities include:

metadata assignment

validation status tracking

calibration history linkage

quality flagging

9 Storage Layer

The storage layer maintains multiple datasets.

Dataset	Description
Raw Data Store	original measurements from devices
Corrected Data Store	calibrated and processed measurements
Lifecycle Data Store	sensor health and remaining lifespan
Analytics Data Store	derived indicators and reporting outputs

Raw data must never be overwritten.

10 CCOP Climate Intelligence Platform

The CCOP Climate Intelligence Platform (CIP) consumes processed telemetry and provides:

environmental analytics

device health monitoring

lifecycle monitoring dashboards

environmental reporting

geospatial operational awareness

CIP is the central intelligence layer of the CCOP system.

11 Dashboard and Reporting Flow

Processed data is visualized and reported through operational tools.

Processed Telemetry
      ↓
CIP Analytics
      ↓
Geospatial Dashboards
      ↓
Environmental Reports
      ↓
Operator and Analyst Use

These outputs support monitoring, decision-making, and reporting.

12 Zabbix Monitoring Flow

Zabbix operates in parallel with the telemetry data flow.

Device Health Metrics
      ↓
Zabbix Agent / Sender
      ↓
Zabbix Server
      ↓
Alerts / Maintenance Actions

Zabbix monitors:

device uptime

CPU and memory

power system health

enclosure temperature

sensor lifecycle metrics

connectivity status

13 Data Flow Benefits

The CCOP data flow architecture provides:

reliable telemetry transport

traceable environmental data processing

calibration-aware measurement handling

predictive maintenance through lifecycle monitoring

centralized analytics and reporting

14 Diagram Usage

This data flow diagram supports the following documents:

CCOP Backend Software Architecture

CCOP Data Model and Telemetry Specification

CCOP Sensor Lifecycle Management Architecture

CCOP Verification and Validation Plan

CCOP Network Topology and Infrastructure Architecture

15 Revision History
Version	Description
1.0	Initial CCOP data flow diagram


