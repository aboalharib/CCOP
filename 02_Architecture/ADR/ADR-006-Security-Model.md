# ADR-006: CCOP Security Model (Zero Trust, IAM, VPN, API Gateway)

**Project:** CCOP (Climate Change Operations Platform)  
**Document ID:** CCOP-ADR-006  
**Status:** APPROVED  
**Date:** [Insert Date]  
**Owner:** Ali Al Harib – Chief Engineer  

---

# 1. Context

CCOP operates across:

- distributed edge devices
- public and private networks
- multiple user roles
- critical environmental data pipelines

Without a strong security model, the system will face:

- unauthorized access
- data manipulation
- device impersonation
- lateral movement inside the network
- exposure of sensitive infrastructure

---

# 2. Decision

CCOP adopts a **Zero Trust Security Model**.

Core principles:

- no implicit trust (internal or external)
- all access must be authenticated and authorized
- all communication must be encrypted
- all actions must be observable

---

# 3. Core Security Principles

## 3.1 Zero Trust

- no network zone is inherently trusted
- identity is required for every request
- access is granted per request, not per location

---

## 3.2 Least Privilege

- users and services only get required permissions
- no broad or shared credentials

---

## 3.3 Defense in Depth

- multiple layers of protection:
  - network
  - identity
  - application
  - data

---

# 4. Identity and Access Management (IAM)

## Approved System

- Authentik (or equivalent IAM system)

---

## Requirements

- all users must authenticate
- all services must use identity-based authentication
- roles must be defined (admin, operator, viewer, system)
- no shared accounts

---

## Access Control

- role-based access control (RBAC)
- API-level authorization
- service-to-service authentication

---

# 5. Network Security Model

## Segmentation

CCOP uses multi-zone segmentation:

- DMZ
- Application
- Data
- Management
- User Access

---

## Rules

- no direct user → data access
- no direct internet → backend access
- all external traffic via DMZ

---

# 6. VPN Model (Edge Access)

## Approved Technology

- WireGuard

---

## Rules

- all edge nodes connect via VPN
- each node has unique identity
- no open inbound access to nodes
- VPN is required for internal services access

---

# 7. API Gateway

## Approved Role

- central control point for APIs

---

## Responsibilities

- authentication enforcement
- rate limiting
- request validation
- routing to backend services

---

## Rules

- all external APIs must go through API Gateway
- no direct public access to backend services

---

# 8. Encryption

## Mandatory

- TLS for all communication
- encrypted VPN tunnels
- encrypted service-to-service traffic where applicable

---

# 9. Device Security

## Requirements

- each device must have unique identity
- firmware version must be tracked
- compromised devices must be isolatable

---

# 10. Logging and Audit

All systems must log:

- authentication attempts
- failed access attempts
- API usage
- system changes

Logs must be centralized and retained.

---

# 11. Failure Scenarios

## Unauthorized Access Attempt

- must be logged
- must be blocked
- must trigger alert

---

## Compromised Device

- must be isolated via VPN controls
- access revoked immediately

---

## API Abuse

- rate limiting must activate
- abnormal patterns must be flagged

---

# 12. Compliance

All CCOP components must comply with:

- Zero Trust model
- IAM enforcement
- VPN requirements
- API Gateway control

No exceptions without ADR approval.

---

# 13. Consequences

## Positive

- strong system security
- reduced attack surface
- controlled access

## Negative

- increased setup complexity
- requires strict identity management

---

# 14. Approval

Approved by:

**Ali Al Harib**  
Chief Engineer – CCOP  

---

# 15. Status

FINAL – APPROVED – ACTIVE
