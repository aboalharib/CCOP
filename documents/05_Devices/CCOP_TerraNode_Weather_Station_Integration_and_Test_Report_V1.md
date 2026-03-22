# CCOP – Climate Change Operation Platform
## TerraNode Weather Station Integration and Test Report

Document ID: CCOP-TN-WS-TEST-001  
Version: 1.0  
Status: Engineering Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# 1 Purpose

This document records the successful integration and test of the TerraNode weather station interface using the IOT-S300WS7 compact weather station over Modbus RTU.

The purpose of this report is to confirm that the weather station can be read reliably through the TerraNode platform and that the required meteorological parameters are available for telemetry generation.

---

# 2 Scope

This test applies to the TerraNode weather station subsystem.

The test covers:

- Modbus RTU communication
- RS-485 to USB interface operation
- address and baud-rate discovery
- real-time environmental data acquisition

---

# 3 Tested Device

| Item | Value |
|---|---|
Weather Station | IOT-S300WS7 Compact Weather Station |
Communication Method | Modbus RTU |
Physical Interface | RS-485 via USB converter |
Host Platform | Python-based test environment |
Protocol Library | pymodbus |

---

# 4 Measured Parameters

The weather station test successfully reads the following parameters:

| Parameter | Description |
|---|---|
Temperature | ambient air temperature |
Humidity | relative humidity |
Pressure | atmospheric pressure |
Light | ambient light intensity |
Wind Speed | wind velocity |
Wind Direction | wind direction |
Rainfall | cumulative rainfall |

These parameters match the expected TerraNode meteorological monitoring requirements.

---

# 5 Test Features

The implemented test supports:

- reading real-time environmental data
- scanning for the correct Modbus slave address
- scanning for the correct baud rate
- clean console output
- future extension for CSV logging

---

# 6 Software Environment

The test requires:

- Python 3.7 or later
- `pymodbus`
- serial USB connection to RS-485 converter

Example installation method:

```bash
pip install -r requirements.txt
7 Modbus Scan Procedure

A dedicated scan script was used to identify the correct Modbus slave address and baud rate.

The scanner tested:

baud rates: 9600, 19200, 38400

slave IDs: 1 to 20

register access for the temperature field at 0x0000

This process confirms communication parameters before normal operation.

8 Working Read Registers

The validated script reads the following Modbus input register pairs:

Parameter	Register
Temperature	0x0000
Humidity	0x0002
Pressure	0x0004
Light	0x0006
Wind Speed	0x000C
Wind Direction	0x0010
Rainfall	0x001C

The test implementation reads two registers per value and combines them into a scaled numeric output.

9 Validated Python Test Logic

The working test uses a Modbus RTU serial client and reads the weather station values over /dev/ttyUSB0.

9.1 Main Reader Script
from pymodbus.client.sync import ModbusSerialClient

client = ModbusSerialClient(
    method='rtu',
    port='/dev/ttyUSB0',
    baudrate=9600,
    parity='N',
    stopbits=1,
    bytesize=8,
    timeout=1
)

def read_float32(client, unit, reg):
    result = client.read_input_registers(address=reg, count=2, unit=unit)
    if not result.isError():
        value = (result.registers[0] << 16) + result.registers[1]
        return value / 1000.0
    else:
        return None

if client.connect():
    try:
        unit_id = 20

        temp = read_float32(client, unit_id, 0x0000)
        hum = read_float32(client, unit_id, 0x0002)
        press = read_float32(client, unit_id, 0x0004)
        lux = read_float32(client, unit_id, 0x0006)
        wind_speed = read_float32(client, unit_id, 0x000C)
        wind_dir = read_float32(client, unit_id, 0x0010)
        rain = read_float32(client, unit_id, 0x001C)

        print(f"🌡️  Temperature      : {temp:.2f} °C" if temp is not None else "Temp read failed")
        print(f"💧 Humidity         : {hum:.2f} %RH" if hum is not None else "Humidity read failed")
        print(f"🌬️  Pressure         : {press:.2f} Pa" if press is not None else "Pressure read failed")
        print(f"💡 Light            : {lux:.2f} Lux" if lux is not None else "Light read failed")
        print(f"🍃 Wind Speed       : {wind_speed:.2f} m/s" if wind_speed is not None else "Wind speed failed")
        print(f"🧭 Wind Direction   : {wind_dir:.2f} °" if wind_dir is not None else "Wind dir failed")
        print(f"☔ Rainfall (total) : {rain:.2f} mm" if rain is not None else "Rainfall failed")

    except Exception as e:
        print(f"❌ Exception: {e}")
    finally:
        client.close()
else:
    print("❌ Failed to connect to /dev/ttyUSB0")
9.2 Modbus Scanner Script
from pymodbus.client.sync import ModbusSerialClient
import time

baud_rates = [9600, 19200, 38400]
slave_ids = range(1, 21)
port = '/dev/ttyUSB0'

print("🔍 Starting Modbus RTU scan...")

for baud in baud_rates:
    print(f"\n📡 Scanning at {baud} baud...")
    client = ModbusSerialClient(
        method='rtu',
        port=port,
        baudrate=baud,
        parity='N',
        stopbits=1,
        bytesize=8,
        timeout=0.5
    )

    if client.connect():
        for sid in slave_ids:
            try:
                result = client.read_input_registers(address=0x0000, count=2, unit=sid)
                if not result.isError():
                    raw = (result.registers[0] << 16) + result.registers[1]
                    temp = raw / 1000.0
                    print(f"✅ ID {sid} @ {baud} baud → Temp: {temp:.2f} °C")
                else:
                    print(f"❌ ID {sid} @ {baud} baud → No response")
            except Exception as e:
                print(f"⚠️  ID {sid} @ {baud} baud → Error: {e}")
            time.sleep(0.1)
        client.close()
    else:
        print(f"❌ Could not open port at {baud} baud")
10 Engineering Assessment

The successful test confirms the following:

TerraNode can integrate the IOT-S300WS7 weather station over Modbus RTU

the RS-485 to USB communication path is valid

the weather station provides the expected meteorological measurements

a Modbus scan method is available to identify communication settings during deployment or troubleshooting

This confirms the TerraNode weather station interface design at the software integration level.

11 Recommended Next Integration Step

The next engineering step is to move from a standalone test script to a structured TerraNode weather module integrated into:

TerraNode sensor manager

telemetry JSON builder

Zabbix monitoring

CCOP Climate Intelligence Platform telemetry flow

12 Relationship to Other Documents

This test report supports:

CCOP_TerraNode_System_Specification_V3.md

CCOP_TerraNode_Electrical_Architecture_and_Wiring_Package_V1.md

CCOP_Data_Model_and_Telemetry_Specification_V2_5.md

CCOP_Verification_and_Validation_Plan_V2_7.md

13 Revision History
Version	Description
1.0	Initial TerraNode weather station integration and test report


