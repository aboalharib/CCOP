#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <device_name>"
  echo "Example: $0 terranode"
  exit 1
fi

DEVICE=$1
BASE=~/CCOP/simulation

mkdir -p "$BASE/simulators"
mkdir -p "$BASE/scenarios"
mkdir -p "$BASE/tests"
mkdir -p "$BASE/configs"

touch "$BASE/simulators/${DEVICE}_sim.py"
touch "$BASE/scenarios/${DEVICE}_normal_operation.py"
touch "$BASE/scenarios/${DEVICE}_failure.py"
touch "$BASE/tests/test_${DEVICE}_sim.py"
touch "$BASE/configs/${DEVICE}_sim.example.json"

CLASSNAME="$(echo "$DEVICE" | awk -F_ '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS='')"

cat > "$BASE/simulators/${DEVICE}_sim.py" <<EOF
from datetime import datetime, timezone


class ${CLASSNAME}Simulator:
    def __init__(self) -> None:
        self.device_id = "CCOP-${CLASSNAME^^}-SIM-001"

    def timestamp(self) -> str:
        return datetime.now(timezone.utc).isoformat()

    def generate(self) -> dict:
        return {
            "device_id": self.device_id,
            "device_type": "${CLASSNAME}",
            "timestamp": self.timestamp(),
            "location": {
                "latitude": 25.68,
                "longitude": 51.50
            },
            "environment": {
                "temperature": 30.0,
                "humidity": 50.0
            },
            "air_quality": {
                "pm25": 10.0
            },
            "system": {
                "power_input": 12.0,
                "internal_temperature": 35.0
            },
            "lifecycle": {
                "lifespan_days": 730,
                "days_used": 10,
                "days_remaining": 720,
                "status": "OK"
            }
        }
EOF

cat > "$BASE/scenarios/${DEVICE}_normal_operation.py" <<EOF
from simulators.${DEVICE}_sim import ${CLASSNAME}Simulator


def run() -> dict:
    sim = ${CLASSNAME}Simulator()
    return sim.generate()
EOF

cat > "$BASE/scenarios/${DEVICE}_failure.py" <<EOF
from simulators.${DEVICE}_sim import ${CLASSNAME}Simulator


def run() -> dict:
    sim = ${CLASSNAME}Simulator()
    payload = sim.generate()
    payload["system"]["network_status"] = "degraded"
    payload["air_quality"]["pm25"] = None
    return payload
EOF

cat > "$BASE/tests/test_${DEVICE}_sim.py" <<EOF
def test_${DEVICE}_sim_placeholder():
    assert True
EOF

cat > "$BASE/configs/${DEVICE}_sim.example.json" <<EOF
{
  "device_type": "${CLASSNAME}",
  "count": 1,
  "interval_seconds": 30,
  "enabled": true
}
EOF

echo "Created simulator scaffold for ${DEVICE}"

