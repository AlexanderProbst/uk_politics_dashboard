# Placeholder processing script for GE2024 results once downloaded to data_raw/
safeload(c("dplyr","readr","stringr"))
source("R/utils.R")

process_ge2024 <- function(infile = "data_raw/ge2024_results.csv",
                           outfile = "data_processed/ge2024_constituency.csv") {
  if (!file.exists(infile)) stop("Missing input: ", infile)
  df <- readr::read_csv(infile, show_col_types = FALSE)
  # TODO: adapt to real columns; ensure a PCON24CD/code is present
  df <- df |>
    dplyr::rename_with(\(x) tolower(gsub("\s+","_",x))) |>
    dplyr::mutate(majority_pc = (majority / valid_votes) * 100)
  readr::write_csv(df, timestamp_path(outfile))
  message("Wrote: ", outfile)
}

if (sys.nframe() == 0 && file.exists("data_raw/ge2024_results.csv")) process_ge2024()
