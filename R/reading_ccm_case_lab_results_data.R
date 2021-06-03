#' Reading CCM case lab results data
#'
#' This function uses the read_csv() function from the readr package to read
#' the raw CCM case lab results data in.
#'
#' @param ccm_case_lab_results_path A character representing the path to the raw
#' CCM case lab results data.
#'
#' @return A tbl_df of raw CCM case lab results data.
#' @export
#'
#' @examples
#' `reading_ccm_case_lab_results_data(here::here("data", "raw", "ccm_case_lab_results_data.csv"))`
reading_ccm_case_lab_results_data <- function(ccm_case_lab_results_path) {
  read_csv(
    file = ccm_case_lab_results_path,
    col_names = TRUE,
    col_types = cols(
      `Investigation Number` = col_character(),
      `Interpretation Value` = col_character(),
      `Observation Code` = col_character(),
      `Observation Result Status` = col_character(),
      `Observation Value` = col_character(),
      `Collection Date` = col_character(),
      `Specimen Received Date` = col_character(),
      `Lab Result Reported Date` = col_character()
    )
  )
}
