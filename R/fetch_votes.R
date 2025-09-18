# Fetch the latest Commons divisions (metadata only as a starter)
safeload(c("httr2","jsonlite","dplyr","readr","tibble","lubridate"))
source("R/utils.R")

fetch_divisions <- function(out = "data_processed/commons_divisions_latest.csv") {
  url <- "https://commonsvotes-api.parliament.uk/data/divisions.json/search?house=Commons&page=1"
  resp <- httr2::request(url) |> httr2::req_perform() |> httr2::resp_body_json()
  items <- resp$items %||% list()
  df <- tibble::as_tibble(items) |>
    dplyr::transmute(
      division_id = id,
      title = title,
      date = lubridate::as_date(date),
      aye_count = ayeCount,
      no_count = noCount
    )
  readr::write_csv(df, timestamp_path(out))
  message("Wrote: ", out)
}

`%||%` <- function(a,b) if (!is.null(a)) a else b

if (sys.nframe() == 0) fetch_divisions()
