#' Deriving earliest positive lab collection date
#'
#' This function takes the clean CCM case lab results data and filters for lab
#' results that are considered positive based on their interpretation value or
#' observation code and then calculates the earliest collection date.
#'
#' @param clean_ccm_case_lab_results_data A tbl_df of clean CCM case lab
#' results data.
#'
#' @return A tbl_df of derived earliest positive lab collection dates.
#' @export
#'
#' @examples
#' `deriving_earliest_positive_lab_collection_date(clean_ccm_case_lab_results_data)`
deriving_earliest_positive_lab_collection_date <- function(clean_ccm_case_lab_results_data) {
  clean_ccm_case_lab_results_data %>%
    # labs with an interpretation value of positive or an observation code of
    # detected, reactive, or isolated are consider positive
    filter(
      str_to_title(interpretation_value) == "Positive" |
        str_to_title(observation_code) %in% c("Detected", "Reactive", "Isolated")
    ) %>%
    group_by(investigation_number) %>%
    summarise(earliest_positive_lab_collection_date = min(collection_date, na.rm = TRUE))
}
