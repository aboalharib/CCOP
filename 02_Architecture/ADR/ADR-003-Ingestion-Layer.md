# ADR-003: CCOP Telemetry Ingestion Layer

**Project:** CCOP (Climate Change Operations Platform)  
**Document ID:** CCOP-ADR-003  
**Status:** APPROVED  
**Date:** [Insert Date]  
**Owner:** Ali Al Harib – Chief Engineer  

---

# 1. Context

CCOP edge systems such as TerraNode operate in real-world conditions where connectivity may be intermittent, payload quality may vary, and devices may replay buffered data after reconnection.

A controlled ingestion layer is required to protect backend systems from:

- invalid payloads
- uncontrolled producer behavior
- duplicate replay conditions
- schema inconsistency
- direct coupling between edge devices and storage systems

---

# 2. Decision

CCOP shall use a controlled ingestion layer between edge producers and downstream backend services.

The ingestion layer is responsible for:

- receiving telemetry from edge systems
- validating payload structure
- normalizing metadata
- assigning ingestion timestamp
- enforcing schema rules
- forwarding approved events into Kafka
- rejecting or quarantining invalid events

Edge systems shall not write directly to backend databases.

---

# 3. Architecture Rule

The ingestion path is defined as:

**Edge Device → Secure Transport / Authenticated Producer → Ingestion Layer → Kafka → Downstream Consumers**

This path is mandatory for approved telemetry flows.

No architecture may bypass the ingestion layer for raw production telemetry without formal approval.

---

# 4. Responsibilities of the Ingestion Layer

The ingestion layer shall perform the following functions:

## 4.1 Validation
- check required fields
- verify schema version
- verify message structure
- verify device identity where applicable

## 4.2 Normalization
- add `ingest_time_utc`
- normalize field names and envelope structure
- attach system metadata where required

## 4.3 Routing
- route valid messages to the correct Kafka topic
- reject or quarantine malformed messages

## 4.4 Security Enforcement
- accept data only from approved authenticated sources
- apply access controls for producer identity

## 4.5 Observability
- log accepted, rejected, and failed events
- expose metrics for volume, errors, and latency

---

# 5. Required Message Envelope

All telemetry entering the ingestion layer shall use or be transformed into a controlled envelope.

Minimum fields:

- `schema_version`
- `message_id`
- `event_type`
- `device_id`
- `node_type`
- `event_time_utc`
- `gps`
- `gps_status`
- `firmware_version`
- `sensor_status`
- `payload`

The ingestion layer shall add:

- `ingest_time_utc`

---

# 6. Duplicate and Replay Handling

The ingestion layer must assume that:

- edge devices may buffer data locally
- replay after reconnect is normal
- duplicates may occur

Therefore:

- duplicate-aware processing is mandatory
- `message_id` must remain preserved end to end
- downstream consumers must be able to detect duplicates where needed

The ingestion layer may record duplicate detection metrics but shall not silently corrupt telemetry flow.

---

# 7. Failure Handling

The ingestion layer must fail in a controlled manner.

Required behavior:

- invalid payloads must not be forwarded as valid telemetry
- rejected events must be logged
- temporary downstream failures must trigger retry logic or controlled backpressure behavior
- failures must be observable through monitoring

No silent drop behavior is acceptable in production.

---

# 8. Security Requirements

The ingestion layer shall enforce:

- authenticated producers
- encrypted transport
- service identity control
- logging of failed authentication or malformed submissions

No anonymous production ingestion is permitted.

---

# 9. Operational Requirements

The ingestion layer shall be monitored for:

- accepted message rate
- rejected message rate
- validation failures
- routing failures
- processing latency
- upstream authentication failures
- downstream Kafka publish failures

This monitoring shall integrate with CCOP operational monitoring systems.

---

# 10. Consequences

## Positive
- controlled telemetry intake
- reduced risk of bad data entering backend systems
- protection against schema drift
- better separation between edge devices and internal services

## Negative
- introduces an additional operational component
- requires disciplined schema and validation management
- adds failure handling responsibilities to the platform team

---

# 11. Compliance

This ADR is mandatory for all production telemetry flows in CCOP.

Any design that allows raw production telemetry to bypass the ingestion layer requires formal review and ADR approval.

---

# 12. Approval

Approved by:

**Ali Al Harib**  
Chief Engineer – CCOP  

Signature: _________________________  

Date: _________________________  

---

# 13. Status

**FINAL – APPROVED – ACTIVE**
