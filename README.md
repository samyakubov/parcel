# Parcel

Flutter app for NYC property lookup. The API it calls lives in [`server/`](server/).

## App

```bash
flutter pub get
flutter run
```

```bash
cp .env.example .env
```

Fill in `MAPBOX_API_KEY`, `BACKEND_API_KEY`, and `STREETVIEW_API_KEY`. `SERVER_URL` defaults to `http://127.0.0.1:8000`.

## API

See [server/README.md](server/README.md). From `server/`:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --reload
```
