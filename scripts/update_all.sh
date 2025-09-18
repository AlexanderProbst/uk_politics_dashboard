#!/usr/bin/env bash
set -euo pipefail

echo "[1/4] Python: petitions"
python3 py/fetch_petitions.py || python py/fetch_petitions.py || true

echo "[2/4] Python: boundaries"
python3 py/fetch_boundaries.py || python py/fetch_boundaries.py || true

echo "[3/4] R: members"
Rscript R/fetch_members.R || true

echo "[4/4] R: votes"
Rscript R/fetch_votes.R || true

echo "Done. Check data_processed/ and geo/."
