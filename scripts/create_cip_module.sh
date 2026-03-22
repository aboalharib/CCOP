nano ~/CCOP/scripts/create_cip_module.sh#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <module_name>"
  echo "Example: $0 telemetry"
  exit 1
fi

MODULE=$1
BASE=~/CCOP/cip-platform

mkdir -p "$BASE/ingestion"
mkdir -p "$BASE/validation"
mkdir -p "$BASE/processing"
mkdir -p "$BASE/storage"
mkdir -p "$BASE/api"
mkdir -p "$BASE/tests"

touch "$BASE/ingestion/${MODULE}_ingest.py"
touch "$BASE/validation/${MODULE}_validator.py"
touch "$BASE/processing/${MODULE}_processor.py"
touch "$BASE/storage/${MODULE}_store.py"
touch "$BASE/api/${MODULE}_api.py"
touch "$BASE/tests/test_${MODULE}.py"

CLASSNAME="$(echo "$MODULE" | awk -F_ '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS='')"

cat > "$BASE/ingestion/${MODULE}_ingest.py" <<EOF
def ingest_${MODULE}(payload: dict) -> dict:
    return {
        "module": "${MODULE}",
        "status": "accepted",
        "payload": payload
    }
EOF

cat > "$BASE/validation/${MODULE}_validator.py" <<EOF
def validate_${MODULE}(payload: dict) -> bool:
    return isinstance(payload, dict)
EOF

cat > "$BASE/processing/${MODULE}_processor.py" <<EOF
def process_${MODULE}(payload: dict) -> dict:
    processed = dict(payload)
    processed["processed_by"] = "${MODULE}_processor"
    return processed
EOF

cat > "$BASE/storage/${MODULE}_store.py" <<EOF
STORE: list[dict] = []

def save_${MODULE}(payload: dict) -> None:
    STORE.append(payload)

def get_all_${MODULE}() -> list[dict]:
    return STORE
EOF

cat > "$BASE/api/${MODULE}_api.py" <<EOF
def get_${MODULE}_status() -> dict:
    return {
        "module": "${MODULE}",
        "status": "ready"
    }
EOF

cat > "$BASE/tests/test_${MODULE}.py" <<EOF
def test_${MODULE}_placeholder():
    assert True
EOF

echo "Created CIP module scaffold for ${MODULE}"
