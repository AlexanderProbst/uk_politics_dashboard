from pathlib import Path
import os

DATA_RAW = Path("data_raw")
DATA_PROCESSED = Path("data_processed")
GEO = Path("geo")

for p in [DATA_RAW, DATA_PROCESSED, GEO]:
    p.mkdir(parents=True, exist_ok=True)

def env(key: str, default: str = "") -> str:
    return os.getenv(key, default)
