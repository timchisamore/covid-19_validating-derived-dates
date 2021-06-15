#' Deriving iPHIS episode date type
#'
#' This function derives the episode date type of a case with respect to the
#' iPHIS logic. This means if symptoms exists, the episode date type will be
#' symptom onset. If not, if positive lab results exists, the episode date
#' type will be lab specimen collection. If not, the episode date type will
#' be investigation reported.
#'
#' @param earliest_symptom_onset_date_derived A dttm representing the earliest
#' symptom onset date of the case.
#' @param earliest_positive_lab_collection_date_derived A dttm representing the
#' earliest positive lab collection date of the case.
#' @param reported_date_system A dttm representing the reported date of the
#' case.
#'
#' @return A character representing the iPHIS episode date type of the case.
#' @export
#'
#' @examples
#' `deriving_iphis_episode_date_type(earliest_symptom_onset_date_derived, earliest_positive_lab_collection_date_derived, reported_date_system)`
deriving_iphis_episode_date_type <-
  function(earliest_symptom_onset_date_derived,
           earliest_positive_lab_collection_date_derived,
           reported_date_system) {
    case_when(
      !is.na(earliest_symptom_onset_date_derived) ~ "Symptom Onset",
      !is.na(earliest_positive_lab_collection_date_derived) ~ "Lab Specimen Collection",
      TRUE ~ "Investigation Reported"
    )
  }
