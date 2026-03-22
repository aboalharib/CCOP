# ADR-009: CCOP Deployment Model (Edge to Core)

**Project:** CCOP  
**Document ID:** CCOP-ADR-009  
**Status:** APPROVED  

---

# 1. Decision

CCOP shall follow an edge-to-core deployment model.

---

# 2. Architecture Flow

Edge → Ingestion → Kafka → Processing → Storage → Dashboard

---

# 3. Edge Layer

- TerraNode devices
- local buffering
- VPN connectivity

---

# 4. Core Layer

- Proxmox cluster
- Kafka
- databases
- monitoring systems

---

# 5. Scaling

- horizontal scaling for ingestion and processing
- distributed edge deployment

---

# Status

FINAL – APPROVED – ACTIVE
