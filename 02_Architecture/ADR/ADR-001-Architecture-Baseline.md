# ADR-001: CCOP System Architecture Baseline

**Project:** CCOP (Climate Change Operations Platform)  
**Document ID:** CCOP-ADR-001  
**Title:** CCOP Core Architecture and System Design Baseline  
**Status:** APPROVED  
**Date:** [Insert Date]  
**Owner:** Ali Al Harib – Chief Engineer  

---

# 1. Context

CCOP is designed as a national-scale environmental monitoring and operations platform integrating:

- Distributed edge systems (TerraNode, OnMove, SeaEye, SkyNode)
- Real-time telemetry ingestion
- Data processing and analytics pipelines
- Monitoring and control systems
- Web-based visualization and operational interfaces

The system must operate under:

- intermittent edge connectivity
- multi-zone secure infrastructure
- high data volume and continuous streaming
- long-term scalability and maintainability

A unified architectural baseline is required to ensure:

- consistency across all components
- controlled system evolution
- prevention of design drift
- readiness for real-world deployment

---

# 2. Decision

The CCOP system shall adopt a layered, event-driven, edge-to-core architecture with strict separation of concerns.

---

# 3. Core Architecture Principles

## Edge-to-Core Model
- Edge devices collect telemetry
- Data flows through ingestion layer
- Edge supports buffering and replay

## Event-Driven Backbone
- Kafka is the approved streaming backbone
- Used for telemetry and internal events

## Data Layer Separation
- Raw → Processed → Analytical layers
- No bypass allowed

## Ingestion Control
- No direct DB writes from edge
- All data via ingestion layer or Kafka

## Network Segmentation
- Multi-zone architecture enforced

## Security
- TLS + authentication required
- VPN for edge systems

## Monitoring
- Zabbix + Prometheus + Grafana mandatory

## Edge Autonomy
- Works offline
- Buffers + replays data

## API Layer
- Users access via APIs only
- No raw data exposure

## Data Model
- device_id
- timestamp
- GPS
- payload
- system status

---

# 4. Constraints

- No bypass of Kafka
- No uncontrolled data formats
- No direct user access to data layer

---

# 5. Technology Baseline

- Kafka
- Flink
- PostgreSQL / InfluxDB
- Zabbix / Prometheus / Grafana
- Proxmox / Docker
- WireGuard / Authentik

---

# 6. Compliance

All systems must follow this baseline.  
Changes require ADR approval.

---

# 7. Approval

Ali Al Harib  
Chief Engineer – CCOP  

---

# Status

FINAL – APPROVED – ACTIVE
