# ADR-004: CCOP Telemetry Data Schema Standard

**Project:** CCOP (Climate Change Operations Platform)  
**Document ID:** CCOP-ADR-004  
**Status:** APPROVED  

---

# 1. Context

CCOP requires a unified telemetry schema to avoid data inconsistency and system failures.

---

# 2. Decision

All telemetry must follow a standardized, versioned schema.

---

# 3. Envelope Fields

- schema_version  
- message_id  
- event_type  
- device_id  
- node_type  
- event_time_utc  
- ingest_time_utc  
- gps  
- gps_status  
- firmware_version  
- sensor_status  
- payload  

---

# 4. Rules

- All timestamps in UTC  
- GPS must always exist  
- No uncontrolled payloads  
- Schema must be versioned  

---

# Status

FINAL – APPROVED – ACTIVE
