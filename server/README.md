# Parcel API

FastAPI service the Flutter app calls for NYC property records. Property, party, census, heatmap, and AI routes read a local DuckDB file. Dataset loading lives in `nycdb/`, a trimmed copy of [nycdb](https://github.com/nycdb/nycdb) (AGPLv3).

## Setup

```bash
cd server
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.sample .env
```

Set the values in `.env`:

- `DATABASE_PATH` — path to `nycdb.duckdb` (default `nycdb.duckdb` in this directory)
- `MAPBOX_API_KEY` — geocoding
- `OPENAI_API_KEY` — `POST /ai/ask`
- `CENSUS_API_KEY` — census demographics
- `ADMIN_PASSWORD` — admin routes

`nycdb.duckdb` and the raw files under `data/` and `nycdb/data/` stay on disk. They are not part of git. See `nycdb/src/README.md` to rebuild the database, then run the SQL in `sql/`.

## Run

```bash
uvicorn main:app --reload
```

The app expects this on `http://127.0.0.1:8000` unless `SERVER_URL` is set. Protected routes take an `X-API-Key` header.

## Lint

```bash
ruff check .
ruff format --check .
```
