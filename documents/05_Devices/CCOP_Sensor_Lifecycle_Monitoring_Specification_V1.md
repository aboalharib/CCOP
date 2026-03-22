# CCOP – Climate Change Operation Platform
## Sensor Lifecycle Monitoring Specification
### TerraNode and TerraEdge

Document ID: CCOP-SENSOR-LIFE-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the sensor lifecycle monitoring method used for TerraNode and TerraEdge devices in the CCOP system.

The objective is to automatically calculate expected sensor lifespan usage, remaining service life, and lifecycle status for selected sensors, then publish this information to Zabbix and local device logs.

---

# 2 Scope

This specification applies only to:

- TerraNode
- TerraEdge

This specification does not currently apply to:

- TerraAir

---

# 3 Functional Objective

The system shall automatically:

- store each sensor installation date
- store expected lifespan in days
- calculate days used
- calculate days remaining
- calculate remaining life percentage
- assign lifecycle status
- publish sensor lifecycle information to Zabbix
- store lifecycle values in local logs
- optionally transmit lifecycle metadata to the CCOP Climate Intelligence Platform (CIP)

---

# 4 Lifecycle Calculation Model

For each applicable sensor, the following values shall be calculated.

## 4.1 Days Used

```text
days_used = current_date - install_date
4.2 Days Remaining
days_remaining = lifespan_days - days_used
4.3 Remaining Life Percentage
life_percent_remaining = (days_remaining / lifespan_days) * 100

If the result is below zero, it shall be clamped to zero.

5 Lifecycle Status Model

The lifecycle status shall be assigned using the following logic.

Status Code	Status Name	Rule
0	OK	days_remaining > 180
1	WARNING	90 < days_remaining <= 180
2	CRITICAL	0 < days_remaining <= 90
3	EXPIRED	days_remaining <= 0
6 Initial Sensor Lifespan Baseline

The following default lifespan values shall be used in Version 1.

Sensor Model	Parameter	Lifespan Days
SEN0670	H₂S	730
SEN0469	NH₃	730
SEN0471	NO₂	730
SEN0470	SO₂	730
SEN0475	HF	547
SEN0465	O₂	730
O₃ sensor module	O₃	547
CO sensor module	CO	730

If a sensor lifespan is defined as a range, the system shall use the conservative lower bound in Version 1.

7 Configuration Model

Sensor lifecycle information shall be stored in a local configuration file on each TerraNode and TerraEdge device.

Example format:

{
  "device_id": "terranode_alkhor_01",
  "device_type": "TerraNode",
  "sensors": [
    {
      "sensor_name": "SEN0469",
      "parameter": "NH3",
      "sensor_serial": "NH3-2026-0001",
      "install_date": "2026-01-15",
      "lifespan_days": 730,
      "replacement_count": 0
    },
    {
      "sensor_name": "SEN0475",
      "parameter": "HF",
      "sensor_serial": "HF-2026-0041",
      "install_date": "2026-01-15",
      "lifespan_days": 547,
      "replacement_count": 0
    }
  ]
}
8 Zabbix Integration

Sensor lifecycle metrics shall be published to Zabbix.

For each sensor, the following items shall be sent:

lifespan_days

days_used

days_remaining

life_percent

lifecycle_status

Example item keys:

sensor.nh3.lifespan_days
sensor.nh3.days_used
sensor.nh3.days_remaining
sensor.nh3.life_percent
sensor.nh3.status
sensor.hf.lifespan_days
sensor.hf.days_used
sensor.hf.days_remaining
sensor.hf.life_percent
sensor.hf.status
9 Zabbix Trigger Thresholds

Recommended Zabbix triggers:

Warning

Trigger when remaining life is less than 180 days.

Critical

Trigger when remaining life is less than 90 days.

Expired

Trigger when remaining life is less than or equal to 0 days.

10 Local Logging

Each device shall store lifecycle information locally in a structured log.

Local log formats may include:

JSON

CSV

The local lifecycle log shall include:

device_id

sensor_name

parameter

install_date

lifespan_days

days_used

days_remaining

life_percent

lifecycle_status

calculation_timestamp

11 Optional CIP Integration

Lifecycle information may also be transmitted to the CCOP Climate Intelligence Platform (CIP) as telemetry metadata.

This allows central lifecycle dashboards and maintenance planning.

12 Sensor Replacement Handling

When a sensor is replaced, the following values must be updated:

sensor_serial

install_date

replacement_count

Historical replacement records should be preserved where possible.

13 Version 1 Engineering Approach

Version 1 shall use:

calendar-based lifespan tracking

This means lifecycle is based on installation date and expected lifespan only.

Future versions may implement:

exposure-weighted aging

humidity penalties

temperature penalties

concentration-based aging

power-cycle penalties

14 Relationship to Other Documents

This specification supports:

CCOP_TerraNode_System_Specification_V2

CCOP_TerraEdge_System_Specification_V1

CCOP Sensor Calibration Framework

CCOP Data Governance Framework

CCOP Zabbix monitoring architecture

15 Revision History
Version	Description
1.0	Initial sensor lifecycle monitoring specification for TerraNode and TerraEdge


