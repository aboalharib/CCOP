from __future__ import annotations

import json
from datetime import date, datetime
from pathlib import Path
from typing import Any

from zabbix_sender_client import send_to_zabbix_metrics

CONFIG_PATH = Path(__file__).resolve().parent / "sensor_lifecycle_config.json"
LOG_DIR = Path(__file__).resolve().parent / "lifecycle_log"
LOG_DIR.mkdir(parents=True, exist_ok=True)


def load_config(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def calculate_lifecycle(install_date_str: str, lifespan_days: int) -> dict[str, Any]:
    install_date = datetime.strptime(install_date_str, "%Y-%m-%d").date()
    today = date.today()

    days_used = (today - install_date).days
    days_remaining = lifespan_days - days_used
    life_percent = max(0.0, round((days_remaining / lifespan_days) * 100, 2))

    if days_remaining <= 0:
        status_code = 3
        status_name = "EXPIRED"
    elif days_remaining <= 90:
        status_code = 2
        status_name = "CRITICAL"
    elif days_remaining <= 180:
        status_code = 1
        status_name = "WARNING"
    else:
        status_code = 0
        status_name = "OK"

    return {
        "days_used": days_used,
        "days_remaining": days_remaining,
        "life_percent": life_percent,
        "status_code": status_code,
        "status_name": status_name,
        "calculation_timestamp": datetime.utcnow().isoformat() + "Z",
    }


def parameter_key(parameter: str) -> str:
    return (
        parameter.strip()
        .lower()
        .replace("₂", "2")
        .replace("₃", "3")
        .replace(" ", "_")
    )


def build_zabbix_metrics(sensor: dict[str, Any], result: dict[str, Any]) -> dict[str, Any]:
    key = parameter_key(sensor["parameter"])
    return {
        f"sensor.{key}.lifespan_days": sensor["lifespan_days"],
        f"sensor.{key}.days_used": result["days_used"],
        f"sensor.{key}.days_remaining": result["days_remaining"],
        f"sensor.{key}.life_percent": result["life_percent"],
        f"sensor.{key}.status": result["status_code"],
    }


def write_local_log(device_id: str, record: dict[str, Any]) -> None:
    timestamp = datetime.utcnow().strftime("%Y%m%d")
    log_file = LOG_DIR / f"{device_id}_sensor_lifecycle_{timestamp}.json"

    records: list[dict[str, Any]] = []
    if log_file.exists():
        try:
            records = json.loads(log_file.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            records = []

    records.append(record)
    log_file.write_text(json.dumps(records, indent=2), encoding="utf-8")


def main() -> None:
    config = load_config(CONFIG_PATH)
    device_id = config["device_id"]
    device_type = config["device_type"]

    if device_type not in {"TerraNode", "TerraEdge"}:
        raise ValueError("Sensor lifecycle monitoring supports only TerraNode and TerraEdge.")

    for sensor in config["sensors"]:
        result = calculate_lifecycle(sensor["install_date"], sensor["lifespan_days"])
        metrics = build_zabbix_metrics(sensor, result)

        record = {
            "device_id": device_id,
            "device_type": device_type,
            "sensor_name": sensor["sensor_name"],
            "parameter": sensor["parameter"],
            "sensor_serial": sensor.get("sensor_serial", ""),
            "install_date": sensor["install_date"],
            "lifespan_days": sensor["lifespan_days"],
            "replacement_count": sensor.get("replacement_count", 0),
            **result,
        }

        write_local_log(device_id, record)
        send_to_zabbix_metrics(device_id, metrics)


if __name__ == "__main__":
    main()
