#' Deriving CCM episode date
#'
#' This function derives the episode date of cases with respect to the CCM
#' logic. This logic is simply the first occuring date out of earliest symptom
#' onset date, earliest positive lab collection date, and reported date.
#'
#' @param earliest_symptom_onset_date_derived A dttm representing the earliest
#' symptom onset date of the case.
#' @param earliest_positive_lab_collection_date_derived A dttm representing the
#' earliest positive lab collection date of the case.
#' @param reported_date_system A dttm representing the reported date of the
#' case.
#'
#' @return A dttm represneting the CCM episode date of the case.
#' @export
#'
#' @examples
#' `deriving_ccm_episode_date(earliest_symptom_onset_date_derived, earliest_positive_lab_collection_date_derived, reported_date_system)`
deriving_ccm_episode_date <-
  function(earliest_symptom_onset_date_derived,
           earliest_positive_lab_collection_date_derived,
           reported_date_system) {
    min(c_across(
      cols = c(
        earliest_symptom_onset_date_derived,
        earliest_positive_lab_collection_date_derived,
        reported_date_system
      )
    ), na.rm = TRUE)
  }
