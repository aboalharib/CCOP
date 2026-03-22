# CCOP Architecture

This directory contains the core architecture documents for the Climate Change Operations Platform (CCOP).

## Structure

- `ADR/`  
  Architecture Decision Records governing major technical and system-level decisions.

## Current ADRs

- `ADR-001-Architecture-Baseline.md`  
  Defines the core CCOP system architecture baseline.

- `ADR-002-Kafka-Streaming.md`  
  Defines Kafka as the approved raw telemetry streaming backbone.

- `ADR-003-Ingestion-Layer.md`  
  Defines the ingestion layer model for secure, controlled telemetry intake from edge systems.

## Purpose

These documents are used to:

- control design decisions
- prevent architecture drift
- formalize implementation rules
- support consistent deployment across CCOP components

All implementation and future design changes must align with these documents.
