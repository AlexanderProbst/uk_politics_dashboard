from pathlib import Path
import requests
from utils import GEO

# TODO: paste your ONS WPC 2024 TopoJSON/GeoJSON URL here
ONS_WPC_2024_URL = ""

def main():
    if not ONS_WPC_2024_URL:
        print("Set ONS_WPC_2024_URL in py/fetch_boundaries.py")
        return
    r = requests.get(ONS_WPC_2024_URL, timeout=60)
    r.raise_for_status()
    ext = ".json" if "json" in ONS_WPC_2024_URL else ".topo.json"
    out = Path(GEO, f"wpc_2024{ext}")
    out.write_bytes(r.content)
    print(f"Wrote {out}")

if __name__ == "__main__":
    main()
