#' Deriving iPHIS episode date
#'
#' This function derives the episode date of cases with respect to the iPHIS
#' logic. This logic creates a hierarchy where if symptoms exist, the earliest
#' sympton onset date is used, if no symptons exist, the earliest positive lab
#' collection date is used, if no lab results exists, the earliest reported date
#' is used.
#'
#' @param earliest_symptom_onset_date_derived A dttm representing the earliest
#' symptom onset date of the case.
#' @param earliest_positive_lab_collection_date_derived A dttm representing the
#' earliest positive lab collection date of the case.
#' @param reported_date_system A dttm representing the reported date of the
#' case.
#'
#' @return A dttm represneting the iPHIS episode date of the case.
#' @export
#'
#' @examples
#' `deriving_iphis_episode_date(earliest_symptom_onset_date_derived, earliest_positive_lab_collection_date_derived, reported_date_system)`
deriving_iphis_episode_date <-
  function(earliest_symptom_onset_date_derived,
           earliest_positive_lab_collection_date_derived,
           reported_date_system) {
    case_when(
      !is.na(earliest_symptom_onset_date_derived) ~ earliest_symptom_onset_date_derived,
      !is.na(earliest_positive_lab_collection_date_derived) ~ earliest_positive_lab_collection_date_derived,
      TRUE ~ reported_date_system
    )
    
  }
