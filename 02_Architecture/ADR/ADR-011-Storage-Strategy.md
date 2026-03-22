# ADR-011: Storage Strategy

**Project:** CCOP  
**Document ID:** CCOP-ADR-011  
**Status:** APPROVED  

---

# 1. Decision

CCOP shall use multiple storage layers.

---

# 2. Storage Types

- InfluxDB → time-series
- PostgreSQL → structured data
- Object storage → long-term archive

---

# 3. Rules

- Kafka is not long-term storage
- processed data stored separately
- retention policies enforced

---

# Status

FINAL – APPROVED – ACTIVE
