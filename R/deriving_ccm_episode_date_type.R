#' Deriving CCM episode date type
#'
#' This function derives the episode date type of a case with respect to the
#' CCM logic. Ties are broken in this order: symptom onset > lab specimen
#' collection > investigation reported.
#'
#' @param earliest_symptom_onset_date_derived A dttm representing the earliest
#' symptom onset date of the case.
#' @param earliest_positive_lab_collection_date_derived A dttm representing the
#' earliest positive lab collection date of the case.
#' @param reported_date_system A dttm representing the reported date of the
#' case.
#' @param episode_date_derived A dttm representing the episode date of the case.
#'
#' @return A character representing the CCM episode date type.
#' @export
#'
#' @examples
#' `deriving_ccm_episode_date_type(earliest_symptom_onset_date_derived, earliest_positive_lab_collection_date_derived, reported_date_system, episode_date_derived)`
deriving_ccm_episode_date_type <-
  function(earliest_symptom_onset_date_derived,
           earliest_positive_lab_collection_date_derived,
           reported_date_system,
           episode_date_derived) {
    case_when(
      earliest_symptom_onset_date_derived == episode_date_derived ~ "Symptom Onset",
      earliest_positive_lab_collection_date_derived == episode_date_derived ~ "Lab Specimen Collection",
      TRUE ~ "Investigation Reported"
    )
  }
