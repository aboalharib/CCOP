# ADR-002: Kafka as CCOP Raw Telemetry Streaming Backbone

**Project:** CCOP (Climate Change Operations Platform)  
**Document ID:** CCOP-ADR-002  
**Status:** APPROVED  
**Date:** [Insert Date]  
**Owner:** Ali Al Harib – Chief Engineer  

---

# 1. Context

CCOP requires a production-grade streaming backbone to transport raw telemetry from distributed edge systems into backend processing and storage services.

The platform must support:

- continuous telemetry ingestion
- intermittent edge connectivity
- scalable producer and consumer patterns
- downstream processing by multiple internal services
- operational monitoring and controlled replay

---

# 2. Decision

Apache Kafka is approved as the official raw telemetry streaming backbone for CCOP.

Kafka shall be used for:

- raw air quality telemetry
- raw weather telemetry
- raw node status telemetry
- internal pipeline events related to telemetry handling

Kafka is not approved by this ADR for:

- video stream transport
- arbitrary file transfer
- unmanaged command and control traffic
- direct user-facing reporting delivery

---

# 3. Reason for Decision

Kafka is selected because it provides:

- proven operational maturity
- strong ecosystem support
- compatibility with stream processing systems
- scalable producer and consumer patterns
- lower implementation risk than alternatives considered

Kafka is preferred over Pravega for the current CCOP baseline because Kafka is more practical for the present operational maturity of the project.

---

# 4. Architecture Rule

Kafka is the central backbone for raw telemetry transport.

The following are mandatory:

- edge systems must not write directly to backend databases
- edge systems publish through approved ingestion services or approved authenticated producers
- downstream systems consume from Kafka
- long-term storage is handled downstream, not by Kafka alone

Kafka is therefore a telemetry transport backbone, not the final archival layer.

---

# 5. Initial Topic Model

The initial approved raw telemetry topics are:

- `ccop.raw.air_quality`
- `ccop.raw.weather`
- `ccop.raw.node_status`

Any additional production topics require review and approval.

---

# 6. Partitioning Rule

Raw telemetry topics shall be partitioned by `device_id` or `node_id`.

This is required to:

- preserve per-device ordering
- support horizontal scaling
- simplify replay handling after edge reconnect

Global ordering across all devices shall not be assumed.

---

# 7. Message Requirements

All Kafka messages shall use a controlled versioned envelope.

Minimum required fields:

- `schema_version`
- `message_id`
- `event_type`
- `device_id`
- `node_type`
- `event_time_utc`
- `ingest_time_utc`
- `gps`
- `gps_status`
- `firmware_version`
- `sensor_status`
- `payload`

No producer may publish uncontrolled or unversioned payloads into approved CCOP topics.

---

# 8. Replay and Duplicate Handling

CCOP edge systems may lose connectivity and replay buffered events after reconnection.

Therefore:

- replay is expected
- duplicates are possible
- downstream consumers must support idempotent processing where required
- `message_id` must be unique per event

No consumer design may assume that all incoming events are unique.

---

# 9. Delivery Baseline

The baseline delivery model is at-least-once delivery for raw telemetry.

This means:

- duplicate delivery is possible
- event loss must be minimized through retries and broker durability
- downstream services must handle replay and duplicate conditions correctly

---

# 10. Security Baseline

Production Kafka deployments for CCOP shall enforce:

- TLS encryption
- authenticated producers and consumers
- ACL-based authorization
- no anonymous access

Security shall not be deferred.

---

# 11. Availability Baseline

Production Kafka deployment minimum baseline:

- 3 brokers
- KRaft mode
- replication factor 3
- minimum in-sync replicas of 2

Anything below this is considered lab or pilot level unless approved by exception.

---

# 12. Retention Principle

Kafka retention shall support operational buffering and downstream consumption.

Kafka is not the sole long-term archive for CCOP telemetry.

Long-term retention shall be handled by approved downstream storage systems.

---

# 13. Observability Requirement

Kafka must be monitored for:

- broker availability
- disk utilization
- under-replicated partitions
- producer failures
- consumer lag
- abnormal retry and error rates

No production deployment is acceptable without monitoring and alerting.

---

# 14. Alternatives Considered

## Pravega

Pravega was reviewed and not selected for the CCOP baseline because:

- it introduces greater operational complexity
- it has a narrower operational ecosystem for the current project stage
- it increases implementation risk compared to Kafka

This does not prohibit future bounded use, but it is not the baseline transport backbone.

---

# 15. Compliance

This ADR is binding for all CCOP engineering teams.

Any attempt to replace Kafka, bypass Kafka for approved raw telemetry flows, or introduce conflicting streaming patterns requires formal review and ADR approval.

---

# 16. Approval

Approved by:

**Ali Al Harib**  
Chief Engineer – CCOP  

Signature: _________________________  

Date: _________________________  

---

# 17. Status

**FINAL – APPROVED – ACTIVE**
