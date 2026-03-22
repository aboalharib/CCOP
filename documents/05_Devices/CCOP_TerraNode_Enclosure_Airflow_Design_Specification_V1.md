# CCOP – Climate Change Operation Platform
## TerraNode Enclosure and Airflow Design Specification

Document ID: CCOP-TN-MECH-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the mechanical enclosure layout and airflow chamber design for the TerraNode environmental monitoring station.

The objective is to ensure reliable and scientifically valid measurements by controlling airflow conditions around particulate and gas sensors.

This specification is intended for use by industrial designers, enclosure manufacturers, and system integrators responsible for TerraNode hardware production.

---

# 2 Design Objectives

The TerraNode enclosure must support:

• stable airflow around sensors  
• protection against rain and dust  
• minimal thermal interference from electronics  
• controlled environmental exposure  
• ease of maintenance and service  

The airflow system must ensure that environmental sensors receive representative ambient air samples.

---

# 3 Enclosure Functional Zones

The TerraNode enclosure shall be divided into three functional zones.

| Zone | Function |
|-----|-----------|
Air Sampling Zone | PM and gas sensors |
Electronics Zone | controller, communication hardware |
Power Zone | battery and solar controller |

Sensors must be isolated from electronics to reduce thermal measurement bias.

---

# 4 Enclosure Architecture


┌───────────────────────────────────────┐
│ Weather Cap / Vent │
│ │
│ Rain Shield + Insect Mesh │
│ ↓ │
│ Air Intake Channel │
│ ↓ │
│ Air Sampling Chamber │
│ (PM + Gas Sensors Exposure) │
│ ↓ │
│ Passive Exhaust Vent │
│───────────────────────────────────────│
│ Electronics Compartment │
│ Raspberry Pi CM5 + Interfaces │
│───────────────────────────────────────│
│ Power Management Zone │
│ Battery + Solar Regulator │
└───────────────────────────────────────┘


---

# 5 Air Intake System

The TerraNode air intake shall include the following components:

1. Rain Hood  
2. Insect Mesh  
3. Dust Pre-Filter  
4. Airflow Channel  
5. PM Sensor Chamber  
6. Exhaust Vent

The intake must face downward or sideways to prevent water entry.

---

# 6 Air Intake Geometry

Recommended intake configuration:

| Parameter | Value |
|-----------|------|
Intake orientation | downward or shielded side intake |
Intake diameter | 8–12 mm |
Airflow channel length | 20–50 mm |
Filter mesh size | 200–300 microns |

The airflow channel must be smooth and free of sharp bends.

---

# 7 PM Sensor Chamber

The particulate sensor chamber must provide:

• stable airflow  
• minimal turbulence  
• protection from dust overload  
• isolation from heat sources  

The PM sensor must be mounted vertically where possible to maintain internal airflow consistency.

The chamber must be positioned away from:

• power electronics  
• communication modules  
• battery pack  

---

# 8 Gas Sensor Exposure Zone

Gas sensors should be installed within the airflow chamber but slightly downstream of the PM sensor intake.

This arrangement ensures:

• mixed air exposure  
• consistent gas distribution  
• reduced contamination from large particles

---

# 9 Exhaust Vent

Air exiting the chamber must leave through a passive exhaust vent.

Requirements:

• vent diameter ≥ intake diameter  
• exhaust positioned below sensor chamber  
• exhaust shielded from rain

This prevents pressure buildup and allows natural airflow.

---

# 10 Thermal Isolation

Electronics generate heat that can bias environmental sensors.

To prevent thermal bias:

• the air sampling chamber must be physically separated from electronics  
• insulation barriers should be installed between compartments  
• airflow around sensors must not pass over hot components

---

# 11 Airflow Protection

The intake system must include protection against:

• rain intrusion  
• dust accumulation  
• insects and debris  

Recommended components:

• rain hood  
• stainless steel insect mesh  
• replaceable dust filter

---

# 12 Mechanical Mounting

TerraNode shall be mounted on a vertical pole.

| Parameter | Value |
|-----------|------|
Recommended height | 2.5–3.5 m |
Pole diameter | 50–75 mm |
Orientation | unobstructed airflow |

Solar panels should be mounted above the enclosure.

---

# 13 Materials

Recommended enclosure materials:

| Component | Material |
|-----------|----------|
Main enclosure | UV-stabilized polycarbonate |
Structural frame | aluminum |
Air intake mesh | stainless steel |
Mounting hardware | stainless steel |

All materials must be corrosion resistant.

---

# 14 Environmental Protection

Minimum enclosure protection rating:


IP65


The enclosure must withstand:

• high temperature  
• dust exposure  
• heavy rain  
• strong wind  

---

# 15 Maintenance Requirements

The enclosure design must allow easy access for:

• filter cleaning  
• sensor replacement  
• wiring inspection  
• calibration maintenance

Recommended filter inspection interval: **3 months**

---

# 16 Manufacturing Requirements

The enclosure manufacturer must ensure:

• repeatable airflow geometry  
• consistent intake dimensions  
• accurate sensor mounting locations  
• sealed electronics compartment  
• protected airflow chamber

Manufacturing drawings must include:

• airflow channel dimensions  
• mounting brackets  
• intake and exhaust geometry

---

# 17 Quality Control

Each manufactured enclosure must undergo:

• visual inspection  
• airflow path verification  
• seal integrity testing  
• mounting alignment verification

---

# 18 Compliance References

The enclosure and airflow design should align with practices used in:

• WMO meteorological station installation guidance  
• EPA air-quality sensor deployment guidelines  
• industrial outdoor monitoring system design practices

---

# 19 Revision History

| Version | Description |
|--------|-------------|
| 1.0 | Initial TerraNode enclosure and airflow design specification |

