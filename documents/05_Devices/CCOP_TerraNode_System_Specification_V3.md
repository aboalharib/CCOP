# 24 Sensor Lifecycle Monitoring

TerraNode implements automatic sensor lifecycle monitoring to ensure that aging electrochemical sensors are replaced before measurement accuracy degrades.

The lifecycle monitoring architecture is defined in:

**CCOP_Sensor_Lifecycle_Management_Architecture_V1.md**

This architecture applies to all electrochemical and wear-limited sensors installed in TerraNode.

---

## 24.1 Lifecycle Data Model

Each applicable sensor shall maintain lifecycle metadata including:

| Field | Description |
|---|---|
sensor_name | sensor model identifier |
parameter | measured gas or parameter |
sensor_serial | unique serial number |
install_date | date of installation |
lifespan_days | expected operational lifespan |
replacement_count | number of replacements |

---

## 24.2 Automatic Lifecycle Calculation

TerraNode software shall automatically calculate:

| Metric | Description |
|---|---|
days_used | days since sensor installation |
days_remaining | estimated days remaining before end-of-life |
life_percent_remaining | percentage of remaining operational life |
lifecycle_status | operational health status of the sensor |

Lifecycle status classification:

| Status | Condition |
|---|---|
OK | more than 180 days remaining |
WARNING | 90–180 days remaining |
CRITICAL | less than 90 days remaining |
EXPIRED | sensor lifespan exceeded |

---

## 24.3 Zabbix Lifecycle Monitoring

Sensor lifecycle metrics shall be transmitted to the Zabbix monitoring system.

Example Zabbix metrics:


sensor.co.days_remaining
sensor.co.life_percent
sensor.co.status

sensor.no2.days_remaining
sensor.no2.life_percent
sensor.no2.status

sensor.nh3.days_remaining
sensor.nh3.life_percent
sensor.nh3.status


These metrics allow automated alerts when sensors approach end-of-life.

---

## 24.4 Maintenance Integration

Lifecycle monitoring supports preventive maintenance scheduling.

Maintenance teams shall use lifecycle data to plan:

- sensor replacement
- calibration campaigns
- device inspection

This approach reduces the risk of degraded measurements caused by aging sensors.

---

## 24.5 Integration with CCOP Platform

Sensor lifecycle metadata may also be transmitted to the **CCOP Climate Intelligence Platform (CIP)** to support:

- network-wide lifecycle dashboards
- fleet-level maintenance planning
- sensor reliability analysis
Step 4 — Update the revision history

At the bottom of the document update the revision table.

Example:

# Revision History

| Version | Description |
|---|---|
| 1.0 | Initial TerraNode specification |
| 2.0 | CCOP architecture alignment and sensor engineering freeze |
| 3.0 | Added sensor lifecycle monitoring and Zabbix integration |
