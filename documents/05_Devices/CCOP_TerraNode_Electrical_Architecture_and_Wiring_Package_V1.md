# CCOP – Climate Change Operation Platform
## TerraNode Electrical Architecture and Wiring Package

Document ID: CCOP-TN-ELEC-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document defines the electrical architecture and wiring design intent for the TerraNode environmental monitoring station.

The purpose of this package is to provide a clear system-level wiring baseline for:

- hardware integration
- prototype assembly
- software integration alignment
- manufacturing preparation
- maintenance reference

This document is a **system wiring architecture package**, not a final PCB schematic.

---

# 2 Scope

This electrical package applies to the TerraNode monitoring station and covers:

- system power architecture
- interface bus allocation
- sensor bus mapping
- communication interfaces
- wiring logic between major subsystems
- connector and pin mapping at system level

---

# 3 Design Philosophy

The TerraNode electrical design follows a simple and maintainable interface structure.

| Interface | Assigned Function |
|---|---|
RS-485 | weather station |
I²C | gas sensors, UV sensor, power monitors |
ADC | noise sensor and analog expansion |
UART | GPS |
USB | 5G modem |
Ethernet | primary communications |
Wi-Fi | secondary communications |

This separation reduces integration complexity and simplifies maintenance.

---

# 4 Electrical Architecture Overview

```text
Solar Panel
     │
Charge Controller
     │
Battery
     │
External DC Input
     │
DC Power Distribution Bus
     │
 ┌───────────────────────────────┐
 │       Raspberry Pi CM5        │
 │       Main Controller         │
 └──────────────┬────────────────┘
                │
                ├──────── RS-485 / USB-RS485 → Weather Station
                │
                ├──────── I²C Main Bus
                │           ├── Multiplexer 0x70
                │           └── Multiplexer 0x71
                │
                ├──────── UART → GPS Module
                │
                ├──────── USB → 5G Modem
                │
                ├──────── ADC → Noise Sensor
                │
                └──────── Ethernet / Wi-Fi → Network
5 Power Architecture

The TerraNode power subsystem supports field deployment.

5.1 Power Sources
Source	Function
Solar panel	primary field charging
Battery system	local energy storage
External DC input	maintenance or fixed-site power
5.2 Power Distribution Targets

Power is distributed to:

Raspberry Pi CM5

sensor buses

GPS module

5G modem

RS-485 interface

ADC subsystem

5.3 Power Monitoring

Two INA226 devices are used for power visibility.

Device	Function	Address
INA226A	system input monitoring	0x71 "2"
INA226B	solar / battery branch monitoring	0x71 "4"
6 Main Interface Buses
6.1 RS-485 Bus

The weather station uses RS-485 with Modbus RTU.

Device	Interface	Notes
IOT-S300WS7 / weather station	RS-485 Modbus RTU	via USB-RS485 or dedicated RS-485 interface

Validated test characteristics:

Modbus RTU communication

slave ID discovery by scan

baud rate discovery by scan

real-time environmental parameter reads

6.2 I²C Bus

The I²C bus is the main sensor backbone.

The TerraNode uses two multiplexer domains:

Multiplexer	Function
0x70	core pollutant block
0x71	secondary environmental and power sensors
6.3 ADC Bus

The ADC path is used for analog sensor support.

Device	Interface	Notes
Noise sensor	ADC input	analog measurement path
6.4 UART
Device	Interface	Notes
GR-BD-GPS	UART	position and time reference
6.5 USB
Device	Interface	Notes
5G modem	USB	fallback communications
USB-RS485 converter	USB	weather station integration option
7 I²C Sensor Mapping
7.1 Multiplexer 0x70
Channel	Sensor	Function
0x70 "0"	CO sensor module	carbon monoxide
0x70 "1"	H₂S sensor module	hydrogen sulfide
0x70 "2"	SEN0460	PM1 / PM2.5 / PM10
0x70 "3"	SEN0472	ozone
0x70 "4"	SEN0465	oxygen
0x70 "5"	SEN0471	nitrogen dioxide
0x70 "6"	SEN0636	UV index
0x70 "7"	SEN0475	hydrogen fluoride
7.2 Multiplexer 0x71
Channel	Sensor	Function
0x71 "0"	SEN0469	ammonia
0x71 "1"	SEN0470	sulfur dioxide
0x71 "2"	INA226A	system input monitoring
0x71 "3"	reserved / ADC support reference	noise monitoring integration context
0x71 "4"	INA226B	solar / battery monitoring
0x71 "5"	DS18B20	enclosure temperature
0x71 "6"	GR-BD-GPS	GPS integration reference
0x71 "7"	reserved	future expansion

Note: The GPS and noise path may use UART and ADC respectively in the final implementation. Their placement in the table preserves current system mapping references and integration planning context.

8 Weather Station Interface Definition

The weather station subsystem is integrated through Modbus RTU.

8.1 Tested Device
Item	Value
Weather station	IOT-S300WS7 Compact Weather Station
Protocol	Modbus RTU
Physical link	RS-485 via USB converter
Validated host path	/dev/ttyUSB0
Tested baud options	9600, 19200, 38400
Validated read pattern	input registers, count 2
8.2 Validated Registers
Parameter	Register
Temperature	0x0000
Humidity	0x0002
Pressure	0x0004
Light	0x0006
Wind Speed	0x000C
Wind Direction	0x0010
Rainfall	0x001C
8.3 Wiring Logic
RS-485 Signal	Converter / Interface
A / D+	RS-485 A
B / D-	RS-485 B
GND	common ground if required by converter design
9 Connector and Pin Mapping Intent

This section defines system-level pin intent, not final PCB pin numbers.

9.1 I²C Sensor Bus
Signal	Function
SDA	I²C data
SCL	I²C clock
3.3V / sensor rail	sensor power
GND	signal and power return
9.2 UART GPS
Signal	Function
TX	GPS transmit
RX	GPS receive
VCC	module power
GND	ground
9.3 ADC Noise Sensor
Signal	Function
AIN	analog measurement input
VCC	sensor power
GND	ground
9.4 5G Modem
Signal	Function
USB data	modem communications
USB power	modem supply path or powered hub path
10 Wiring Integration Rules

The TerraNode wiring design shall follow these rules:

sensor wiring shall not obstruct the airflow chamber

power wiring shall be isolated from sensor signal paths where possible

RS-485 wiring shall be routed separately from sensitive analog lines

USB modem and RS-485 converter cabling shall be strain-relieved

all external cable entry points shall use sealed cable glands

grounding shall be consistent across power and signal subsystems

11 Electrical Separation Rules

To reduce noise and thermal interference:

Subsystem	Requirement
Power subsystem	isolated from airflow chamber
Electronics compartment	separated from sensor chamber
RS-485 and modem cabling	routed away from analog sensor lines
Battery and regulators	placed in dedicated power compartment
12 Assumptions and Open Engineering Items

The following items remain to be frozen in a later revision:

exact CM5 carrier board pin allocation

final ADC model and channel map

connector part numbers

terminal block type

fuse and surge protection values

final grounding scheme

harness lengths and cable gauge

This document remains valid as the baseline wiring architecture until those items are finalized.

13 Manufacturing and Integration Use

This package is intended to support:

prototype assembly

manufacturer discussions

enclosure integration

firmware interface planning

field maintenance planning

It should be used together with the mechanical package and BOM baseline.

14 Related Documents

This document supports:

CCOP_TerraNode_System_Specification_V3.md

CCOP_TerraNode_Mechanical_Engineering_Package_V1.md

CCOP_TerraNode_Weather_Station_Integration_and_Test_Report_V1.md

CCOP_Hardware_Bill_of_Materials_Baseline_V1.md

CCOP_Data_Model_and_Telemetry_Specification_V2_5.md

15 Revision History
Version	Description
1.0	Initial TerraNode electrical architecture and wiring package

