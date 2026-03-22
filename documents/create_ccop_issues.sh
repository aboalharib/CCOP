nano create_ccop_issues.sh
gh label create "phase:firmware" --color FFAA00 --description "Firmware implementation tasks" 2>/dev/null || true
gh label create "phase:cip" --color 0052CC --description "CIP backend tasks" 2>/dev/null || true
gh label create "phase:simulation" --color 0E8A16 --description "Simulation tasks" 2>/dev/null || true
gh label create "status:backlog" --color CFD3D7 --description "Task not started" 2>/dev/null || true
gh label create "type:implementation" --color 5319E7 --description "Implementation task" 2>/dev/null || true

gh issue create \
  --title "FW-001 Create ccop-firmware repository structure" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
Device Firmware Foundation

Task:
Create the ccop-firmware repository with the approved structure.

Acceptance criteria:
- repository created
- folder structure committed
- README.md added
- requirements.txt added" \
  --label "phase:firmware" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "FW-002 Create shared telemetry schema module" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
Device Firmware Foundation

Task:
Implement the shared telemetry schema module.

Acceptance criteria:
- schema module exists
- common payload structure defined
- reusable by all device classes" \
  --label "phase:firmware" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "FW-003 Create lifecycle calculation module" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
Device Firmware Foundation

Task:
Implement shared lifecycle calculation support.

Acceptance criteria:
- lifecycle module exists
- remaining days are calculated
- status values are returned" \
  --label "phase:firmware" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "FW-004 Create shared logging module" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
Device Firmware Foundation

Task:
Implement shared logging support for device firmware.

Acceptance criteria:
- logger module exists
- can be imported by device apps
- basic structured logging works" \
  --label "phase:firmware" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "FW-005 Create configuration loader module" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
Device Firmware Foundation

Task:
Implement shared configuration loading support.

Acceptance criteria:
- config loader exists
- JSON files load successfully
- example config file supported" \
  --label "phase:firmware" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "FW-006 Implement TerraNode minimal firmware structure" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
Device Firmware Foundation

Task:
Implement the TerraNode minimal firmware path.

Acceptance criteria:
- terranode.main runs
- valid telemetry is printed
- payload aligns with CCOP telemetry model" \
  --label "phase:firmware" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "CIP-001 Create ccop-cip-platform repository structure" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
CIP Ingestion and Backend Core

Task:
Create the ccop-cip-platform repository with the approved structure.

Acceptance criteria:
- repository created
- folder structure committed
- README.md added
- requirements.txt added" \
  --label "phase:cip" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "CIP-002 Implement telemetry ingestion API" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
CIP Ingestion and Backend Core

Task:
Implement the HTTP API endpoint for telemetry ingestion.

Acceptance criteria:
- endpoint exists
- valid JSON accepted
- invalid JSON rejected" \
  --label "phase:cip" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "CIP-003 Implement telemetry validation service" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
CIP Ingestion and Backend Core

Task:
Implement payload validation for incoming telemetry.

Acceptance criteria:
- validation module exists
- malformed payloads fail validation
- valid payloads pass validation" \
  --label "phase:cip" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "CIP-004 Implement raw telemetry storage" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
CIP Ingestion and Backend Core

Task:
Store raw telemetry exactly as received.

Acceptance criteria:
- raw payloads are stored
- stored payload matches original input
- storage works for multiple devices" \
  --label "phase:cip" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "SIM-001 Create ccop-simulation repository structure" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
Simulation and Synthetic Devices

Task:
Create the ccop-simulation repository with the approved structure.

Acceptance criteria:
- repository created
- folder structure committed
- README.md added
- requirements.txt added" \
  --label "phase:simulation" --label "status:backlog" --label "type:implementation"

gh issue create \
  --title "SIM-002 Implement TerraNode simulator" \
  --body "Source: CCOP_Development_Kanban_Task_Breakdown_V1.md

Phase:
Simulation and Synthetic Devices

Task:
Implement the TerraNode telemetry simulator.

Acceptance criteria:
- simulator returns valid TerraNode payload
- payload matches telemetry model
- payload can be sent to CIP" \
  --label "phase:simulation" --label "status:backlog" --label "type:implementation"

echo "CCOP issues created successfully."


