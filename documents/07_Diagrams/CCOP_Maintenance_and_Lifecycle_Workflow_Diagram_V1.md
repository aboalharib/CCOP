# CCOP – Climate Change Operation Platform
## Maintenance and Lifecycle Workflow Diagram

Document ID: CCOP-DIAGRAM-004  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document presents the CCOP maintenance and lifecycle workflow diagram.

The purpose of this diagram is to show how sensor lifecycle monitoring, Zabbix alerting, maintenance planning, and sensor replacement actions are managed within the CCOP system.

---

# 2 High-Level Lifecycle Workflow

```text
Sensor Installation
        ↓
Lifecycle Baseline Registration
(install date / lifespan / serial)
        ↓
Automatic Lifecycle Monitoring
(days used / days remaining / status)
        ↓
Zabbix Lifecycle Metrics
        ↓
Threshold Evaluation
        ↓
┌─────────────────────────────────────────────┐
│ Status Decision                             │
│                                             │
│ OK       → continue normal operation        │
│ WARNING  → plan preventive maintenance      │
│ CRITICAL → schedule urgent replacement      │
│ EXPIRED  → replace sensor immediately       │
└─────────────────────────────────────────────┘
        ↓
Maintenance Action
        ↓
Sensor Replacement / Calibration / Inspection
        ↓
Update Lifecycle Records
(new serial / new install date / replacement count)
        ↓
Return to Monitoring Operation
3 Workflow Stages

The lifecycle workflow consists of the following stages.

Stage	Description
Installation	sensor is installed in TerraNode or TerraEdge
Registration	lifecycle metadata is recorded
Monitoring	days used and days remaining are calculated
Alerting	Zabbix evaluates lifecycle thresholds
Maintenance Decision	action is selected based on status
Replacement / Service	sensor is replaced or serviced
Record Update	lifecycle records are refreshed
Operational Return	device returns to normal operation
4 Lifecycle Status Logic

Lifecycle status is assigned using the following thresholds.

Status	Condition	Operational Meaning
OK	more than 180 days remaining	continue monitoring
WARNING	90–180 days remaining	plan maintenance
CRITICAL	less than 90 days remaining	urgent replacement required
EXPIRED	0 days remaining or less	sensor end-of-life
5 Maintenance Workflow Diagram
TerraNode / TerraEdge Device
        ↓
Sensor Lifecycle Calculation
        ↓
Lifecycle Status Generated
        ↓
Zabbix Monitoring System
        ↓
Alert Notification
        ↓
Engineering / Maintenance Team Review
        ↓
┌─────────────────────────────────────────┐
│ Maintenance Action Selection            │
│                                         │
│ • continue operation                    │
│ • schedule inspection                   │
│ • replace sensor                        │
│ • verify calibration                    │
└─────────────────────────────────────────┘
        ↓
Field Maintenance Execution
        ↓
Update Device Lifecycle Record
        ↓
Resume Monitoring
6 Zabbix Role in the Workflow

Zabbix acts as the monitoring and alerting layer for lifecycle management.

Zabbix receives:

sensor lifespan

days used

days remaining

life percentage

lifecycle status

Zabbix triggers:

warning alerts

critical alerts

expired sensor alerts

This enables proactive maintenance planning.

7 Maintenance Record Update

After maintenance actions, the following lifecycle records must be updated.

Field	Description
sensor_serial	new or existing serial number
install_date	updated installation date
lifespan_days	expected lifespan baseline
replacement_count	number of replacements performed

These updates ensure accurate future lifecycle calculations.

8 Integration with CCOP Platform

The maintenance and lifecycle workflow may also be integrated with the CCOP Climate Intelligence Platform (CIP) to support:

maintenance dashboards

lifecycle analytics

fleet-wide maintenance planning

asset reliability tracking

9 Operational Benefits

This workflow provides:

preventive maintenance capability

reduced downtime

improved sensor reliability

better environmental data quality

stronger asset traceability

10 Diagram Usage

This diagram supports the following documents:

CCOP Sensor Lifecycle Management Architecture

CCOP Maintenance and Asset Lifecycle Management Plan

CCOP TerraNode System Specification

CCOP TerraEdge System Specification

CCOP Verification and Validation Plan

11 Revision History
Version	Description
1.0	Initial CCOP maintenance and lifecycle workflow diagram


