# UK Politics Dashboard

A public, reproducible R + Python project for analysing UK political data and publishing an interactive dashboard.

## Stack
- **R** for wrangling/visualisation; **Python** for scraping & geospatial I/O.
- **Quarto** for the static site (optional **Shiny** app for interactivity).

## Data contracts
- Use **ONS constituency codes (PCON24CD)** as the primary geographic key.
- Store raw pulls in `data_raw/` (ignored), small tidy outputs in `data_processed/` (committed).
- Keep small map assets in `geo/` for the dashboard (TopoJSON/GeoJSON).

## Sources (examples)
- Parliament Members & Votes APIs
- Commons Library GE2024 results
- UK Parliament Petitions JSON
- ONS Open Geography (WPC 2024)
- YouGov tracker (CSV)

See `config/sources.yml` for the canonical URLs.

## Getting started
1. (Optional) Create Python venv and install `requirements.txt` later.
2. For R, use `renv` (recommended) and install packages listed in scripts as needed.
3. Run `bash scripts/update_all.sh` to fetch data (after you add your keys/URLs).
4. Render Quarto site from `dashboards/quarto`.

## Licensing
- **Code:** MIT (see `LICENSE`).
- **Data:** Respect original licences (often **Open Government Licence v3.0**). Attribute sources in the dashboard footer.
