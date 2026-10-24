# General Architecture Guide

Always use /graphify skill with looking for code or a code snippet, never look file by file

## Overview
This project follows recommended Flutter architecture principles focused on:
- Separation of concerns
- Layered architecture
- Single Source of Truth (SSOT)
- Unidirectional Data Flow (UDF)
- Declarative UI (UI as a function of state)
- Extensibility
- Testability

---

## Separation of Concerns
- UI must be isolated from business logic
- Each feature should be self-contained (e.g., auth, search, profile)
- Widgets should remain lightweight and reusable
- Business rules must not be embedded in UI components

---

## Layered Architecture

### UI Layer (Presentation)
- Renders state from the logic layer
- Handles user input events
- Contains widgets, screens, and UI components
- Must not access data sources directly

### Logic Layer (Domain / ViewModel)
- Contains business logic
- Transforms repository data into UI-ready state
- Handles user actions from UI
- Communicates only via repositories

### Data Layer
- Owns data sources (API, database, cache, platform services)
- Implements repositories
- Serves as the Single Source of Truth (SSOT)

---

## Single Source of Truth (SSOT)
- Each domain entity has exactly one authoritative source
- Repositories are the SSOT for their domain
- No duplicated or parallel state storage
- Derived values should be computed, not stored

---

## Unidirectional Data Flow (UDF)

### UI → Data Flow
1. User interacts with UI
2. UI triggers a logic layer action
3. Logic layer calls repository
4. Repository updates SSOT
5. State propagates back to logic layer
6. UI rebuilds automatically

### Data → UI Flow
- External updates (API, cache sync, polling) update repositories
- Repositories update state
- Logic layer receives updates
- UI re-renders automatically

---

## UI is a Function of State
- UI is fully declarative
- State changes trigger rebuilds
- Widgets must not hold persistent business state
- State should be immutable where possible
- UI is never a source of truth

---

## Extensibility
- Components expose clear inputs and outputs
- ViewModels depend on abstractions (interfaces/repositories)
- Implementations can be swapped without affecting consumers
- Avoid tight coupling between layers

---

## Testability
- Business logic is testable without Flutter UI
- Repositories should be mockable
- ViewModels should support unit testing
- UI tests focus only on rendering and interaction

---

## Recommended Folder Structure
lib/
core/
data/
repositories/
datasources/
models/
domain/
usecases/
services/
presentation/
screens/
widgets/
viewmodels/


---

## Rules of Thumb
- UI never communicates directly with data sources
- Repositories are the only SSOT
- Avoid shared mutable state across layers
- Prefer composition over inheritance
- Keep widgets stateless whenever possible

---

## Goal
Build applications that are:
- Predictable
- Easy to test
- Easy to scale
- Easy to refactor

---

# Backend Overview

The API lives in `server/`. It is a FastAPI app over a local DuckDB file built from NYC housing datasets.

## Property Search API

### Search by Address
`GET /property/search_by_property_address/address={address}`  
Standard string-based address lookup

### Search by BBL
`GET /property/search_by_property_bbl/bbl={bbl}`  
Precise lookup using Borough, Block, and Lot

### Search by Coordinates
`GET /property/search_by_fuzzy_coords/lat={lat}/long={long}`  
Geospatial lookup using latitude and longitude

---

## Common Response Schema

All property endpoints return a shared structure:

### last_sold
- last_sold_price
- last_sold_date
- year_built
- land_sqft
- gross_sqft

### mortgage
- lender
- borrower
- amount

### owners
- current_owners[]
- previous_owners[]

### records[]
Detailed property and legal records including:
- document and ownership data
- zoning and land use
- building metrics
- assessment values

### job_filings[]
- job_description
- bin
- applicant details
- job status/type

### violations[]
- violation details
- penalties and balances
- severity and status

### complaints[]
- complaint lifecycle data
- inspection and disposition info

### zoning
- zoning_districts[]
- commercial_overlays[]
- special_districts[]
- limited_height_district
- last_updated

### coordinates
- latitude
- longitude
