# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Setup

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Required `.env` variables (see `.env.sample`):
- `DATABASE_PATH` — path to `nycdb.duckdb`
- `MAPBOX_API_KEY` — geocoding
- `OPENAI_API_KEY` — AI agent (LangChain + GPT-4)
- `CENSUS_API_KEY` — census demographics
- `ADMIN_PASSWORD` — admin routes (`routes/admin.py`)

## Commands

**Run the server:**
```bash
uvicorn main:app --reload
```

**Lint:**
```bash
ruff check .
ruff format .
```

There are no automated tests. Line length limit is 120 (configured in `ruff.toml`).

## Architecture

This is a FastAPI backend for querying NYC property data (and some other markets). The primary data store is a local DuckDB file (`nycdb.duckdb`).

### Request Flow

```
routes/ → handlers/ → handlers/.../helper_functions/ → database_connector.py
```

- **`routes/`** — thin FastAPI routers; wire up URL paths, inject `db` via `Depends(get_db)`, and apply `validate_api_key` as a dependency on protected endpoints.
- **`handlers/`** — business logic entry points. `search_by_property_bbl.py` is the canonical example: it fans out parallel DB queries, assembles sub-objects from helper functions, and returns a `PropertyDetailsResponse`.
- **`handlers/.../helper_functions/`** — each file handles one piece of the property response (owners, violations, complaints, zoning, last sold, mortgage, job filings).
- **`database_connector.py`** — `DatabaseConnector` wraps DuckDB; `.execute()` returns raw tuples, `.execute_df()` returns a Pandas DataFrame. `get_db()` is the FastAPI dependency.
- **`schemas.py`** — all Pydantic request/response models and dataclasses. Field validators on models handle pandas `NaN` → `None` conversions (common because of LEFT JOINs returning nulls).
- **`exception_handlers.py`** — maps all custom exception types to HTTP status codes via `EXCEPTION_CONFIG`. Add new exception types here when adding new exception classes.

### Authentication

All public endpoints require `X-API-Key` header. Keys are stored in the `api_keys` DuckDB table. Admin endpoints use a separate secret from env (not from the DB). Rate limiting is 1000 req/min per key (or IP as fallback), handled by `slowapi`.

### Database Tables (DuckDB)

The DuckDB file is built from the SQL scripts in `sql/`. Key tables:
- `aggregated_acris_records` — core property/party records (NYC ACRIS data, real + personal property)
- `pluto_latest` — NYC Planning PLUTO data; LEFT JOINed onto `aggregated_acris_records` on `bbl`
- `aggregated_dof_sales` — NYC DOF property sales
- `dobjobs` — DOB job filings (permits)
- `aggregated_acris_violations` — ECB violations
- `zoning` — zoning districts by BBL
- `dob_complaints` — DOB complaints, queried by house number + street name
- `api_keys` — API key management

The primary property lookup key is **BBL** (Borough-Block-Lot, a 10-digit string). Address-based search standardizes the input and resolves it to a BBL via `standardize_address_for_database.py`.

### Non-NYC Data

`data/` may hold local CSV dumps (Fort Lauderdale, LA, Miami, Suffolk County). No route reads them. They are gitignored, same as `nycdb.duckdb` and `nycdb/data/`.

### AI Agent

`POST /ai/ask` accepts a natural language question. `services/ai/llm_agent.py` runs a LangChain ReAct loop with GPT-4, using tools defined in `services/ai/tools.py` to call into the property search handlers. The response includes both a natural language summary and the raw `PropertyDetailsResponse` when a property lookup was performed.

### Exception Pattern

Custom exceptions live in `exceptions/`. Each domain has its own file (e.g., `property_search_exceptions.py`). Raise the most specific type — `exception_handlers.py` handles the HTTP mapping globally.
