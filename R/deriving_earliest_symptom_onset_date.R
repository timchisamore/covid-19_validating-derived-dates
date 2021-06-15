#' Deriving earliest symptom onset date
#'
#' This function takes the clean CCM case symptoms data, removes those who are
#' asymptomatic, takes the minimum symptom onset date by symptom for each
#' investigation, and then takes the earliest of these. This is because a case
#' can have the same symptoms more than once.
#'
#' @param clean_ccm_case_symptoms_data A tbl_df of clean CCM case symptoms data.
#'
#' @return A tbl_df of derived earliest symptom onset dates.
#' @export
#'
#' @examples
#' `deriving_earliest_symptom_onset_date(clean_ccm_case_symptoms_data)`
deriving_earliest_symptom_onset_date <- function(clean_ccm_case_symptoms_data) {
  clean_ccm_case_symptoms_data %>%
    # removing asymptomatic cases or cases with a missing value for asympomatic
    filter(str_to_title(asymptomatic) != "Yes" | is.na(asymptomatic)) %>%
    group_by(investigation_number) %>%
    # since multiple symptom objects can be linked to a case, we need to
    # find the first occuring date for each symptom
    summarise(across(
      .cols = c(contains("onset"), contains("on_set"), contains("start")),
      .fns = min,
      na.rm = TRUE
    ),
    .groups = "drop"
    ) %>%
    # finding the first occuring symptom for each case
    rowwise() %>%
    mutate(investigation_number,
      earliest_symptom_onset_date = min(c_across(cols = contains("date")), na.rm = TRUE)
    ) %>%
    ungroup() %>%
    select(
      investigation_number,
      earliest_symptom_onset_date
    )
}
