# CCOP
# Climate Change Operation Platform

## CCOP Development Prompt Framework

Document ID: CCOP-AI-DEV-001  
Version: 1.0  
Status: Baseline  
Owner: Ali Al Harib – Chief Engineer  

---

# Intellectual Property Notice

© 2026 Ali Al Harib – Individual Owner. All Rights Reserved.

The Climate Change Operation Platform (CCOP), including its development methodology and AI-assisted software development framework, is the intellectual property of the owner.

---

# 1 Purpose

This document defines the development prompt framework used to guide AI-assisted software development of the CCOP system.

The framework ensures that software components generated using AI tools follow the system architecture defined in the CCOP documentation.

---

# 2 Scope

This framework supports AI-assisted development of:

- monitoring station simulators
- telemetry ingestion services
- validation pipelines
- calibration algorithms
- governance services
- analytics services
- alert services
- reporting engines
- dashboard APIs

---

# 3 Development Philosophy

AI-assisted development must follow the CCOP architecture documentation.

AI tools should never generate system components without referencing the authoritative CCOP design documents.

Primary design references include:

- CCOP System Vision
- CCOP Architecture Description
- CCOP CONOPS
- CCOP System Requirements
- CCOP Interface Control Document
- CCOP Data Model and Telemetry Specification
- CCOP Sensor Calibration Framework
- CCOP Environmental Data Governance Framework
- CCOP Backend Software Architecture
- CCOP Database Design

---

# 4 AI Prompt Structure

Every development prompt should include the following structure.


Role Definition
System Context
Reference Documents
Task Definition
Expected Output


---

# 5 Master Development Prompt Template

Example master prompt:


You are the lead backend engineer for the CCOP Climate Intelligence Platform (CIP).

Use the following CCOP documents as authoritative specifications:

System Vision

Architecture Description

CONOPS

System Requirements

Interface Control Document

Data Model

Sensor Calibration Framework

Data Governance Framework

Backend Software Architecture

Database Design

Based on these documents:

Generate the software components required for the requested subsystem.

Follow the architecture, data model, and interface definitions exactly.


---

# 6 Example Prompt: Telemetry Ingestion Service


Using the CCOP Backend Software Architecture and Data Model documents:

Generate a Python telemetry ingestion service that:

receives JSON telemetry from monitoring stations

validates station identifiers

verifies required fields

forwards telemetry to the raw telemetry stream

Output:

service architecture

API endpoints

Python code example


---

# 7 Example Prompt: Calibration Engine


Using the CCOP Sensor Calibration Framework:

Generate calibration algorithms that:

compare TerraEdge measurements against TerraNode reference values

apply correction factors

attach calibration metadata to telemetry records


---

# 8 Example Prompt: Data Governance Service


Using the CCOP Environmental Data Governance Framework:

Generate a validation pipeline that:

verifies telemetry completeness

checks measurement ranges

validates timestamps

assigns governance metadata


---

# 9 Example Prompt: Reporting Engine


Using the CCOP reporting architecture:

Generate a reporting service that:

aggregates telemetry data

produces daily air quality summaries

generates structured reporting datasets


---

# 10 Example Prompt: Simulation Environment


Using the CCOP Simulation Framework:

Generate a monitoring station simulator that:

produces synthetic telemetry

follows the CCOP telemetry schema

simulates TerraNode, TerraEdge, and TerraAir stations


---

# 11 Development Order

Software components should be generated in the following order:


1 Telemetry schema
2 Database schema
3 Telemetry ingestion service
4 Validation service
5 Calibration service
6 Governance service
7 Storage services
8 Analytics services
9 Alert service
10 Reporting engine
11 Dashboard APIs
12 Monitoring station simulators


---

# 12 AI-Assisted Testing

AI tools can also generate test suites based on the CCOP V&V Plan.

Example prompt:


Using the CCOP Verification and Validation Plan:

Generate automated tests for telemetry ingestion, calibration workflows, and governance validation.


---

# 13 Simulation Integration

All generated software must support both:

- real monitoring stations
- simulated telemetry

Simulation compatibility ensures the system can be validated before pilot deployment.

---

# 14 Governance of AI-Generated Code

AI-generated code must be:

- reviewed by the engineering team
- validated against system requirements
- tested using the CCOP V&V plan

AI tools assist development but do not replace engineering oversight.

---

# 15 Revision History

| Version | Description |
|---|---|
| 1.0 | Initial AI development prompt framework |

