# CCOP – Climate Change Operation Platform
## TerraAir Firmware Architecture

Document ID: CCOP-TA-FW-001  
Version: 1.0  

---

# Purpose

Defines the firmware architecture of TerraAir devices.

---

# Architecture Overview


Sensor Drivers
↓
Sensor Manager
↓
Data Normalization
↓
Telemetry Builder
↓
Communication Manager
↓
Wi-Fi Transmission


---

# Firmware Modules

| Module | Function |
|---|---|
Sensor Drivers | interface with hardware sensors |
Sensor Manager | coordinate sensor reads |
Data Normalization | convert readings to engineering units |
Telemetry Builder | create JSON telemetry |
Communication Manager | send telemetry via Wi-Fi |

---

# Telemetry Example

```json
{
 "device_id": "CCOP-TA-001",
 "temperature": 27.8,
 "humidity": 55,
 "pm25": 14.2,
 "co2": 610
}
Revision History
Version	Description
1.0	Initial TerraAir firmware architecture

Push:

```bash
git add 05_Devices/CCOP_TerraAir_Firmware_Architecture_V1.md
git commit -m "Add TerraAir firmware architecture"
git push
3️⃣ TerraAir Mechanical Engineering Package

Create:

05_Devices/CCOP_TerraAir_Mechanical_Engineering_Package_V1.md

Run:

nano 05_Devices/CCOP_TerraAir_Mechanical_Engineering_Package_V1.md

Paste:

# CCOP – Climate Change Operation Platform
## TerraAir Mechanical Engineering Package

Document ID: CCOP-TA-MECH-001  
Version: 1.0  

---

# Purpose

Defines the mechanical design intent for TerraAir environmental monitoring devices.

---

# Enclosure Design

The TerraAir enclosure is designed for indoor or portable monitoring.

Key requirements:

- compact size
- passive airflow openings
- protection from dust accumulation
- accessible USB power connector

---

# Airflow Design


Ambient Air
↓
Air Intake Slots
↓
PM Sensor Chamber
↓
Gas Sensor Exposure
↓
Air Exhaust


Airflow must remain unobstructed to ensure accurate particulate measurement.

---

# Mounting Options

TerraAir may support:

| Mount Type | Use Case |
|---|---|
Desk placement | office monitoring |
Wall mounting | indoor building monitoring |
Portable enclosure | temporary environmental monitoring |

---

# Materials

Recommended materials:

| Material | Purpose |
|---|---|
ABS plastic | lightweight enclosure |
Polycarbonate | sensor windows |
Stainless fasteners | durability |

---

# Revision History

| Version | Description |
|---|---|
| 1.0 | Initial TerraAir mechanical engineering package |


