#' Reading CCM case dates data
#'
#' This function uses the read_csv() function from the readr package to read
#' the raw CCM case dates data in.
#'
#' @param ccm_case_dates_path A character representing the path to the raw
#' CCM case dates data.
#'
#' @return A tbl_df of raw CCM case dates data.
#' @export
#'
#' @examples
#' `reading_ccm_case_dates_data(here::here("data", "raw", "ccm_case_dates_data.csv"))`
reading_ccm_case_dates_data <- function(ccm_case_dates_path) {
  read_csv(
    file = ccm_case_dates_path,
    col_names = TRUE,
    col_types = cols(
      `Investigation Number` = col_character(),
      `Episode Date Type` = col_factor(
        levels = c(
          "Symptom Onset",
          "Lab Specimen Collection",
          "Investigation Reported"
        )
      ),
      `Episode Date` = col_character(),
      `Episode Date Locked` = col_logical(),
      `Earliest Symptom OnsetDate` = col_character(),
      `Earliest Positive Lab Collection Date` = col_character(),
      `Reported Date` = col_character(),
      `Earliest Lab Collection Date` = col_character()
    )
  )
}
