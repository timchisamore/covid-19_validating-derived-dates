#' Cleaning CCM case symptoms data
#'
#' This function uses the clean_names function from the janitor package to clean
#' the field names and it uses the across function to properly parse all fields
#' with a CCM datetime format (YYYY-mm-dd, II:MM pp).
#'
#' @param raw_ccm_case_symptoms_data A tbl_df of raw CCM case symptoms data.
#'
#' @return A tbl_df of clean CCM case symptoms data.
#' @export
#'
#' @examples
#' `cleaning_ccm_case_symptoms_data(raw_ccm_case_symptoms_data)`
cleaning_ccm_case_symptoms_data <-
  function(raw_ccm_case_symptoms_data) {
    raw_ccm_case_symptoms_data %>%
      janitor::clean_names() %>%
      mutate(across(.cols = where(~ all(
        detect_ccm_datetime_string(.x),
        na.rm = TRUE
      )), .fns = parse_ccm_datetime_string))
  }
