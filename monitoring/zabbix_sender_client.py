from __future__ import annotations

import shutil
import subprocess
from typing import Any


ZABBIX_SERVER = "192.168.0.249"
ZABBIX_PORT = "10051"


def send_to_zabbix_metrics(hostname: str, metrics: dict[str, Any]) -> None:
    sender_path = shutil.which("zabbix_sender")

    if sender_path is None:
        print("[WARN] zabbix_sender not found. Printing metrics instead:")
        print(f"Host: {hostname}")
        for key, value in metrics.items():
            print(f"{key} = {value}")
        return

    for key, value in metrics.items():
        cmd = [
            sender_path,
            "-z",
            ZABBIX_SERVER,
            "-p",
            ZABBIX_PORT,
            "-s",
            hostname,
            "-k",
            key,
            "-o",
            str(value),
        ]
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"[ERROR] Failed to send {key} to Zabbix: {result.stderr.strip()}")
