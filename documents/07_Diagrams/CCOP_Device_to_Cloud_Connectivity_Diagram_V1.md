# CCOP – Climate Change Operation Platform
## Device-to-Cloud Connectivity Diagram

Document ID: CCOP-DIAGRAM-003  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document presents the CCOP device-to-cloud connectivity diagram.

The purpose of this diagram is to show how TerraNode, TerraEdge, and TerraAir devices connect through secure communication infrastructure to the CCOP backend platform, monitoring services, and dashboards.

---

# 2 High-Level Connectivity Diagram

```text
 ┌─────────────────────────────────────────────────────────────┐
 │                    CCOP Monitoring Devices                  │
 │                                                             │
 │  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐    │
 │  │  TerraNode   │   │  TerraEdge   │   │   TerraAir   │    │
 │  │ Regional Env │   │ Local Env    │   │ Portable Env │    │
 │  │ Monitoring   │   │ Monitoring   │   │ Monitoring   │    │
 │  └──────┬───────┘   └──────┬───────┘   └──────┬───────┘    │
 └─────────┼──────────────────┼──────────────────┼────────────┘
           │                  │                  │
           │ Ethernet / Wi-Fi / 5G / VPN         │
           └──────────────────┬──────────────────┘
                              │
                              ▼
                 ┌──────────────────────────┐
                 │   Secure WireGuard VPN   │
                 │      Communication        │
                 └──────────────┬───────────┘
                                │
                                ▼
                 ┌──────────────────────────┐
                 │ Telemetry Ingestion Layer │
                 │     Kafka / Pravega       │
                 └──────────────┬───────────┘
                                │
                                ▼
                 ┌──────────────────────────┐
                 │  Stream Processing Layer │
                 │      Apache Flink        │
                 └──────────────┬───────────┘
                                │
                                ▼
                 ┌──────────────────────────┐
                 │  Time-Series Data Store  │
                 │ Raw / Corrected / Life   │
                 └──────────────┬───────────┘
                                │
                                ▼
       ┌─────────────────────────────────────────────────┐
       │   CCOP Climate Intelligence Platform (CIP)      │
       │                                                 │
       │ • Environmental Analytics                       │
       │ • Calibration / Correction                      │
       │ • Lifecycle Monitoring                          │
       │ • Data Governance                              │
       │ • Reporting                                    │
       └──────────────┬───────────────────┬──────────────┘
                      │                   │
                      │                   │
                      ▼                   ▼
         ┌──────────────────────┐   ┌──────────────────────┐
         │   Dashboards / GIS   │   │   Zabbix Monitoring  │
         │ Maps / Trends / Ops  │   │ Health / Alerts / QA │
         └──────────────────────┘   └──────────────────────┘
3 Connectivity Layers

The CCOP device-to-cloud architecture is divided into the following layers.

Layer	Description
Device Layer	TerraNode, TerraEdge, TerraAir
Communication Layer	Ethernet, Wi-Fi, 5G, WireGuard VPN
Ingestion Layer	Kafka / Pravega telemetry intake
Processing Layer	Apache Flink stream processing
Storage Layer	raw, corrected, and lifecycle data
Platform Layer	CCOP Climate Intelligence Platform (CIP)
Operations Layer	dashboards, GIS, Zabbix monitoring
4 Device Connectivity

Each CCOP monitoring device supports secure telemetry transmission.

Supported communication methods:

Method	Purpose
Ethernet	primary wired communication
Wi-Fi	secondary local wireless communication
5G	fallback wide-area communication
WireGuard VPN	secure end-to-end encrypted tunnel
5 Backend Connectivity Flow

Telemetry from devices follows this sequence:

TerraNode / TerraEdge / TerraAir
        ↓
WireGuard VPN
        ↓
Telemetry Ingestion
        ↓
Stream Processing
        ↓
Data Storage
        ↓
CCOP CIP
        ↓
Dashboards / Zabbix / Reports
6 Zabbix Connectivity Role

Zabbix operates as the infrastructure and lifecycle monitoring platform.

Zabbix receives:

device uptime metrics

CPU and memory metrics

network connectivity status

power system health

enclosure temperature

sensor lifecycle metrics

Zabbix generates alerts for:

offline devices

degraded communication

sensor issues

power instability

end-of-life sensor warnings

7 Dashboard Connectivity Role

The CCOP dashboards consume processed telemetry from CIP and provide:

environmental trend visualization

geospatial station maps

device health status

lifecycle monitoring views

reporting outputs

8 Architecture Benefits

This connectivity model provides:

secure device-to-cloud communication

scalable telemetry transport

centralized environmental intelligence

predictive maintenance support

integrated operational monitoring

9 Diagram Usage

This diagram supports the following documents:

CCOP Network Topology and Infrastructure Architecture

CCOP Backend Software Architecture

CCOP Operational Deployment Plan

CCOP Cybersecurity Architecture

CCOP Data Center and Cloud Infrastructure Architecture

10 Revision History
Version	Description
1.0	Initial CCOP device-to-cloud connectivity diagram

