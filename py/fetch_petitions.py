import json, time
from pathlib import Path
import requests
import pandas as pd
from utils import DATA_RAW, DATA_PROCESSED

PETITION_IDS = []  # fill with integers, e.g., [123456, 654321]

def fetch_petition(pid: int) -> dict:
    url = f"https://petition.parliament.uk/petitions/{pid}.json"
    r = requests.get(url, timeout=30)
    r.raise_for_status()
    return r.json()

def main():
    rows = []
    for pid in PETITION_IDS:
        j = fetch_petition(pid)
        Path(DATA_RAW, f"petition_{pid}.json").write_text(json.dumps(j, ensure_ascii=False))
        p = j["data"]["attributes"]
        rows.append({
            "petition_id": pid,
            "action": p.get("action"),
            "state": p.get("state"),
            "opened_at": p.get("opened_at"),
            "signature_count": p.get("signature_count")
        })
        time.sleep(0.5)
    if rows:
        df = pd.DataFrame(rows)
        Path(DATA_PROCESSED, "petitions_summary.csv").write_text(df.to_csv(index=False))

if __name__ == "__main__":
    main()
