mkdir -p ~/CCOP/scripts
nano ~/CCOP/scripts/create_sensor_module.sh#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: $0 <device> <sensor_name>"
  echo "Example: $0 terranode gas_o3"
  exit 1
fi

DEVICE=$1
SENSOR=$2

BASE=~/CCOP/firmware/$DEVICE

mkdir -p "$BASE/sensor_drivers"
mkdir -p "$BASE/sensor_manager"
mkdir -p "$BASE/../../firmware/tests"
mkdir -p "$BASE/../../firmware/configs"

touch "$BASE/sensor_drivers/${SENSOR}.py"
touch "$BASE/sensor_manager/${SENSOR}_adapter.py"
touch "$BASE/../../firmware/tests/test_${SENSOR}.py"
touch "$BASE/../../firmware/configs/${DEVICE}_${SENSOR}.example.json"

cat > "$BASE/sensor_drivers/${SENSOR}.py" <<EOF
class ${SENSOR^}Driver:
    def __init__(self) -> None:
        pass

    def read(self) -> dict:
        return {
            "sensor": "${SENSOR}",
            "value": None,
            "status": "not_implemented"
        }
EOF

cat > "$BASE/sensor_manager/${SENSOR}_adapter.py" <<EOF
from ${DEVICE}.sensor_drivers.${SENSOR} import ${SENSOR^}Driver


def read_${SENSOR}() -> dict:
    driver = ${SENSOR^}Driver()
    return driver.read()
EOF

cat > "$BASE/../../firmware/tests/test_${SENSOR}.py" <<EOF
def test_${SENSOR}_placeholder():
    assert True
EOF

cat > "$BASE/../../firmware/configs/${DEVICE}_${SENSOR}.example.json" <<EOF
{
  "device": "${DEVICE}",
  "sensor": "${SENSOR}",
  "enabled": true
}
EOF

echo "Created module scaffold for ${DEVICE}/${SENSOR}"

