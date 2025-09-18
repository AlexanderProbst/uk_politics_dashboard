# Fetch current MPs from the Members API and write a tidy CSV into data_processed/
safeload(c("httr2","jsonlite","dplyr","readr","tidyr","stringr","tibble","lubridate"))
source("R/utils.R")

fetch_members <- function(out = "data_processed/members_current.csv") {
  url <- "https://members-api.parliament.uk/api/Members/Search?House=Commons&IsCurrentMember=true"
  resp <- httr2::request(url) |> httr2::req_perform() |> httr2::resp_body_string()
  j <- jsonlite::fromJSON(resp, flatten = TRUE)
  df <- tibble::as_tibble(j$items) |>
    tidyr::unnest_wider(value) |>
    dplyr::transmute(
      member_id = id,
      name = nameList.nameDisplayAs,
      party = ifelse(lengths(parties) > 0, sapply(parties, function(p) p[[1]]$name), NA_character_),
      constituency = latestHouseMembership.membershipFrom,
      start_date = lubridate::as_date(latestHouseMembership.membershipStartDate)
    )
  readr::write_csv(df, timestamp_path(out))
  message("Wrote: ", out)
}

if (sys.nframe() == 0) fetch_members()
