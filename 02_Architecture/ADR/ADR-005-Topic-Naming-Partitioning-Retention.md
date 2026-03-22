# ADR-005: Kafka Topic Naming, Partitioning, and Retention Strategy

**Project:** CCOP (Climate Change Operations Platform)  
**Document ID:** CCOP-ADR-005  
**Status:** APPROVED  
**Date:** [Insert Date]  
**Owner:** Ali Al Harib – Chief Engineer  

---

# 1. Context

CCOP uses Kafka as the central streaming backbone for telemetry ingestion and internal event distribution.

Without strict control over:

- topic naming
- partitioning strategy
- retention configuration

the system will suffer from:

- uneven load distribution
- consumer bottlenecks
- data loss or uncontrolled growth
- operational instability
- difficulty scaling to national deployment

This ADR defines mandatory rules for Kafka topic design.

---

# 2. Decision

All Kafka topics in CCOP shall follow:

- a strict naming convention
- a controlled partitioning strategy
- defined retention policies

No ad hoc topic creation is permitted in production.

---

# 3. Topic Naming Standard

## Format

```bash
ccop.<layer>.<domain>.<type>
Components
Component	Description
ccop	fixed prefix
layer	raw / processed / alerts
domain	air / weather / node
type	optional specialization
Approved Examples
Raw telemetry
ccop.raw.air_quality
ccop.raw.weather
ccop.raw.node_status
Processed data
ccop.processed.air_quality
ccop.processed.weather
Alerts
ccop.alerts.air_quality
ccop.alerts.node
Rules
lowercase only
underscore allowed
no spaces
no inconsistent naming
no direct device-based topic names (e.g. no tn-001-data)
4. Partitioning Strategy
Core Rule

All raw telemetry topics shall be partitioned by:

device_id
Why

This ensures:

ordering per device
predictable replay handling
balanced distribution across brokers
scalable consumer parallelism
Rules
partition key must always be present
producers must use the same key consistently
consumers must not assume global ordering
5. Partition Count Guidelines

Initial recommendation:

small deployment → 3–6 partitions per topic
medium deployment → 6–12 partitions
large deployment → scale based on throughput
Important Constraints
partitions cannot be easily reduced later
too many partitions increase overhead
too few partitions limit scalability
6. Retention Strategy

Kafka is not the long-term storage layer.

It is used for:

buffering
transport
replay window
Raw Topics Retention

Recommended:

24 to 72 hours (initial baseline)

Purpose:

allow replay
support consumer recovery
avoid disk overflow
Processed Topics Retention

Recommended:

shorter retention (e.g. 12–24 hours)

Processed data should be stored in databases, not Kafka.

Alerts Topics

Recommended:

3–7 days (depending on operational needs)
7. Retention Configuration Rules
retention must be explicitly set per topic
no unlimited retention in production
disk usage must be monitored
retention must align with storage capacity
8. Replication and Durability

Minimum production requirements:

replication factor = 3
min in-sync replicas = 2
Rules
no single-replica topics in production
producers must wait for acknowledgment (acks=all)
durability must be enforced
9. Topic Governance
Creation Rules
topics must be created through controlled process
no auto-topic creation in production
naming must follow ADR-005
Change Rules

Changes to:

topic names
partition count
retention policies

require:

review
impact analysis
approval
10. Observability Requirements

Kafka must be monitored for:

partition imbalance
consumer lag
disk usage
under-replicated partitions
topic growth rate
11. Failure Scenarios
Scenario 1: Consumer Lag

If consumers fall behind:

lag increases
data freshness drops
dashboards become inaccurate

Mitigation:

scale consumers
monitor lag continuously
Scenario 2: Disk Full

If retention is too long:

brokers run out of disk
Kafka stops accepting data

Mitigation:

enforce retention limits
monitor disk usage
Scenario 3: Hot Partition

If partitioning is wrong:

one partition overloaded
uneven load
performance degradation

Mitigation:

use device_id as key
monitor partition distribution
12. Compliance

All Kafka topics in CCOP must comply with:

naming standard
partitioning rules
retention policy
replication requirements

No exceptions without ADR approval.

13. Consequences
Positive
predictable scaling
stable Kafka operation
controlled storage usage
consistent data flow
Negative
requires upfront planning
limits flexibility for ad hoc usage
14. Approval

Approved by:

Ali Al Harib
Chief Engineer – CCOP

Signature: _________________________

Date: _________________________

15. Status

FINAL – APPROVED – ACTIVE
