#' Deriving earliest lab collection date
#'
#' This function takes the clean CCM case lab results data and calculates the
#' earliest collection date.
#'
#' @param clean_ccm_case_lab_results_data A tbl_df of clean CCM case lab
#' results data.
#'
#' @return A tbl_df of derived earliest lab collection dates.
#' @export
#'
#' @examples
#' `deriving_earliest_lab_collection_date(clean_ccm_case_lab_results_data)`
deriving_earliest_lab_collection_date <- function(clean_ccm_case_lab_results_data) {
  clean_ccm_case_lab_results_data %>%
    group_by(investigation_number) %>%
    summarise(earliest_lab_collection_date = min(collection_date, na.rm = TRUE), .groups = "drop")
}
