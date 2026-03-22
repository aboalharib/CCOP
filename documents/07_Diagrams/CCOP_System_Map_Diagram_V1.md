# CCOP – Climate Change Operation Platform
## System Map Diagram

Document ID: CCOP-DIAGRAM-010  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document presents the CCOP system map diagram.

The system map provides a single visual overview of the complete CCOP platform including monitoring devices, communication infrastructure, backend services, and operational interfaces.

---

# 2 CCOP System Map

                  ┌─────────────────────────────────┐
                  │  Environmental Stakeholders     │
                  │                                 │
                  │ • Government Agencies           │
                  │ • Environmental Authorities     │
                  │ • Researchers                   │
                  │ • Industrial Operators          │
                  └───────────────▲─────────────────┘
                                  │
                                  │
                        Dashboards / GIS
                                  │
                                  │
        ┌─────────────────────────┴─────────────────────────┐
        │        CCOP Climate Intelligence Platform         │
        │                      (CIP)                         │
        │                                                    │
        │  • Environmental Analytics                         │
        │  • Sensor Calibration and Correction               │
        │  • Lifecycle Monitoring                            │
        │  • Environmental Reporting                         │
        │  • Data Governance                                 │
        │  • Geospatial Visualization                        │
        └─────────────────────────▲─────────────────────────┘
                                  │
                                  │
                        Environmental Data Storage
                     (Time-Series and Analytics DB)
                                  │
                                  │
                          Stream Processing Layer
                              Apache Flink
                                  │
                                  │
                       Telemetry Message Broker
                           Kafka / Pravega
                                  │
                                  │
                      Secure Communication Layer
                           WireGuard VPN
                                  │
                                  │
 ┌────────────────────────────────┴────────────────────────────────┐
 │                          Monitoring Devices                      │
 │                                                                  │
 │   ┌───────────────┐      ┌───────────────┐      ┌──────────────┐ │
 │   │   TerraNode   │      │   TerraEdge   │      │   TerraAir   │ │
 │   │ Regional Env  │      │ Local Env     │      │ Portable Env │ │
 │   │ Monitoring    │      │ Monitoring    │      │ Monitoring   │ │
 │   └───────┬───────┘      └───────┬───────┘      └───────┬──────┘ │
 │           │                      │                      │        │
 │  Weather Sensors         Air Quality Sensors      Environmental │
 │  Air Quality Sensors     Noise Sensors            Sensors       │
 │  System Health Sensors   UV Sensors               Field Use     │
 │                                                                  │
 └──────────────────────────────────────────────────────────────────┘
                                  │
                                  │
                       Infrastructure Monitoring
                               Zabbix

---

# 3 System Layers

The CCOP system architecture is divided into several layers.

| Layer | Description |
|---|---|
Monitoring Layer | TerraNode, TerraEdge, TerraAir devices |
Communication Layer | Ethernet, Wi-Fi, 5G with WireGuard VPN |
Ingestion Layer | Kafka / Pravega telemetry ingestion |
Processing Layer | Apache Flink stream processing |
Storage Layer | environmental telemetry databases |
Analytics Layer | CCOP Climate Intelligence Platform |
Visualization Layer | dashboards and GIS systems |
Monitoring Layer | Zabbix infrastructure monitoring |

---

# 4 Environmental Monitoring Pyramid

The monitoring system follows a multi-tier sensing architecture.

| Tier | System | Role |
|---|---|---|
Tier 1 | Reference Monitoring Stations | calibration baseline |
Tier 2 | TerraNode | regional monitoring |
Tier 3 | TerraEdge / TerraAir | localized monitoring coverage |

This architecture balances accuracy, coverage, and scalability.

---

# 5 System Benefits

The CCOP system architecture provides:

- scalable environmental monitoring infrastructure  
- secure telemetry communication  
- centralized environmental analytics  
- predictive maintenance using lifecycle monitoring  
- support for environmental reporting frameworks  

---

# 6 Diagram Usage

This system map diagram supports the following documents:

- CCOP System Vision Document  
- CCOP Architecture Description  
- CCOP System Whitepaper  
- CCOP Investor and Stakeholder Brief  
- CCOP Pilot Project Proposal  

---

# 7 Revision History

| Version | Description |
|---|---|
| 1.0 | Initial CCOP system map diagram |
