# CCOP – Climate Change Operation Platform
## Sensor Lifecycle Management Architecture
### TerraNode and TerraEdge

Document ID: CCOP-SENSOR-LIFE-001  
Version: 1.0  
Status: Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the sensor lifecycle management architecture used for TerraNode and TerraEdge devices within the CCOP system.

The purpose of this architecture is to ensure that selected environmental sensors are automatically tracked throughout their operational lifespan so that maintenance teams can identify aging sensors before performance degradation affects data quality.

---

# 2 Scope

This specification applies only to:

- TerraNode
- TerraEdge

This specification does not currently apply to:

- TerraAir

The lifecycle monitoring model applies primarily to electrochemical and wear-limited sensors.

---

# 3 Functional Objective

The system shall automatically:

- store each applicable sensor installation date
- store expected lifespan in days
- store sensor serial number
- store replacement count
- calculate days used
- calculate days remaining
- calculate remaining life percentage
- assign lifecycle status
- publish lifecycle information to Zabbix
- store lifecycle information in local device records
- optionally provide lifecycle metadata to the CCOP Climate Intelligence Platform (CIP)

---

# 4 Sensor Lifecycle Data Model

Each applicable sensor shall have the following lifecycle fields.

| Field | Description |
|---|---|
sensor_name | sensor model or identifier |
parameter | measured gas or parameter |
sensor_serial | unique sensor serial number |
install_date | date installed in the device |
lifespan_days | expected operational life in days |
replacement_count | number of times replaced |

---

# 5 Lifecycle Calculation Model

For each sensor, the following values shall be calculated.

## 5.1 Days Used

```text
days_used = current_date - install_date
5.2 Days Remaining
days_remaining = lifespan_days - days_used
5.3 Remaining Life Percentage
life_percent_remaining = (days_remaining / lifespan_days) * 100

If the result is below zero, it shall be clamped to zero.

6 Lifecycle Status Model

The lifecycle status shall be assigned using the following logic.

Status Code	Status Name	Condition
0	OK	more than 180 days remaining
1	WARNING	90 to 180 days remaining
2	CRITICAL	less than 90 days remaining
3	EXPIRED	lifespan exceeded
7 Default Sensor Lifespan Baseline

The following default lifespan values shall be used in Version 1.

Sensor Model	Parameter	Expected Lifespan Days
SEN0670	H₂S	730
SEN0469	NH₃	730
SEN0471	NO₂	730
SEN0470	SO₂	730
SEN0475	HF	547
SEN0465	O₂	730
O₃ sensor module	O₃	547
CO sensor module	CO	730

If a sensor lifetime is published as a range, the conservative lower bound shall be used in Version 1.

8 Zabbix Integration

Lifecycle metrics shall be published to the Zabbix monitoring system.

For each sensor, the following metrics shall be exposed.

Metric	Description
lifespan_days	expected operational lifespan
days_used	days since installation
days_remaining	estimated days remaining
life_percent	percentage of remaining life
status	lifecycle state code

Example Zabbix item keys:

sensor.co.lifespan_days
sensor.co.days_used
sensor.co.days_remaining
sensor.co.life_percent
sensor.co.status
sensor.nh3.lifespan_days
sensor.nh3.days_used
sensor.nh3.days_remaining
sensor.nh3.life_percent
sensor.nh3.status

These metrics allow Zabbix to trigger preventive maintenance alerts.

9 Local Lifecycle Logging

Each TerraNode and TerraEdge device shall preserve local lifecycle records.

Local records should include:

device_id

device_type

sensor_name

parameter

sensor_serial

install_date

lifespan_days

days_used

days_remaining

life_percent

lifecycle_status

calculation_timestamp

These records support maintenance planning and auditability.

10 Sensor Replacement Handling

When a sensor is replaced, the following values shall be updated:

sensor_serial

install_date

replacement_count

Historical replacement records should be retained where possible.

11 CIP Integration

Sensor lifecycle information may be transmitted to the CCOP Climate Intelligence Platform (CIP) as telemetry metadata.

This enables:

centralized maintenance dashboards

fleet-wide lifecycle analysis

proactive maintenance planning

sensor aging analytics

12 Engineering Approach

Version 1 uses:

calendar-based lifespan tracking

This means sensor aging is calculated from installation date and expected lifespan only.

Future versions may support:

exposure-weighted aging

temperature penalty models

humidity penalty models

concentration-based aging

power-cycle penalty models

13 Relationship to Device Documents

This lifecycle architecture applies directly to:

CCOP_TerraNode_System_Specification_V2.md

CCOP_TerraEdge_System_Specification_V1.md

It should be treated as part of the maintenance, reliability, and Zabbix monitoring architecture for those systems.

14 Maintenance Relationship

Lifecycle tracking supports:

preventive maintenance

replacement scheduling

quality assurance

calibration planning

It reduces the risk of expired electrochemical sensors continuing to generate unreliable environmental measurements.

15 Final Statement

The CCOP Sensor Lifecycle Management Architecture ensures that TerraNode and TerraEdge operate as managed environmental monitoring infrastructure rather than unmanaged sensor devices.

By automatically tracking installation date, expected lifespan, remaining life, and lifecycle status, the system supports proactive maintenance and stronger environmental data quality.

Revision History
Version	Description
1.0	Initial sensor lifecycle management architecture for TerraNode and TerraEdge

