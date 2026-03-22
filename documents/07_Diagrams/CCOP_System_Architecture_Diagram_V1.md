# CCOP – Climate Change Operation Platform
## System Architecture Diagram

Document ID: CCOP-DIAGRAM-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document presents a simplified architecture diagram of the CCOP system.

The diagram illustrates how monitoring devices, communication infrastructure, backend processing systems, and user interfaces interact within the CCOP platform.

---

# 2 High-Level CCOP Architecture

               ┌──────────────────────────────┐
               │      Environmental Users      │
               │  Analysts / Operators / Gov   │
               └───────────────▲───────────────┘
                               │
                               │
                       Dashboards / GIS
                               │
                               │
            ┌──────────────────┴──────────────────┐
            │  CCOP Climate Intelligence Platform │
            │                (CIP)                 │
            │                                      │
            │  • Environmental Analytics           │
            │  • Lifecycle Monitoring              │
            │  • Environmental Models              │
            │  • Data Governance                   │
            │  • Reporting Systems                 │
            └───────────────▲──────────────────────┘
                            │
                            │
                     Time-Series Storage
                            │
                            │
                  Stream Processing Engine
                       (Apache Flink)
                            │
                            │
                   Message Broker Layer
                   (Kafka / Pravega)
                            │
                            │
                    Secure VPN Network
                       (WireGuard)
                            │
                            │
    ┌───────────────────────┴───────────────────────┐
    │                                               │
    │             Monitoring Device Layer           │
    │                                               │
    │  ┌──────────────┐   ┌──────────────┐         │
    │  │  TerraNode   │   │  TerraEdge   │         │
    │  │ Reference    │   │ Distributed  │         │
    │  │ Monitoring   │   │ Monitoring   │         │
    │  └──────┬───────┘   └──────┬───────┘         │
    │         │                  │                 │
    │         │                  │                 │
    │         └──────────┬───────┘                 │
    │                    │                         │
    │               TerraAir                      │
    │          Portable Monitoring               │
    │                                             │
    └─────────────────────────────────────────────┘

---

# 3 Monitoring Architecture

The CCOP monitoring network uses a **three-tier sensing architecture**.

| Tier | Device | Function |
|-----|------|-----------|
Tier 1 | Reference Stations | calibration baseline |
Tier 2 | TerraNode | regional monitoring |
Tier 3 | TerraEdge / TerraAir | localized monitoring |

This architecture allows the network to combine **accuracy, coverage, and density**.

---

# 4 Data Processing Pipeline

Telemetry flows through the CCOP system in the following sequence:


Monitoring Device
↓
Secure VPN Communication
↓
Streaming Message Broker
↓
Stream Processing Engine
↓
Time-Series Data Storage
↓
Climate Intelligence Platform
↓
Dashboards and Analytics


---

# 5 Monitoring Infrastructure

System health and monitoring are managed using:

- **Zabbix monitoring infrastructure**
- sensor lifecycle monitoring
- device health metrics
- network connectivity monitoring

This ensures continuous system operation and predictive maintenance.

---

# 6 Architecture Benefits

The CCOP architecture provides:

- scalable environmental monitoring
- secure telemetry transmission
- centralized environmental analytics
- predictive maintenance capability
- reliable environmental data management

---

# 7 Diagram Usage

This architecture diagram is referenced by the following documents:

- CCOP System Vision Document
- CCOP Architecture Description
- CCOP Network Topology Architecture
- CCOP Operational Deployment Plan
- CCOP Backend Infrastructure Architecture

---

# 8 Revision History

| Version | Description |
|---|---|
| 1.0 | Initial CCOP system architecture diagram |
