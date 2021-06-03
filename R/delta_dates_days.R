#' Delta dates days
#'
#' This function calculates the difference between the system and derived dates
#' in days.
#'
#' @param date_system A POSIXct indicating the system generated date.
#' @param date_derived A POSIXct indicating the derived date.
#'
#' @return A numeric indicating the difference between the dates in days.
#' @export
#'
#' @examples
#' `delta_dates_days(date_system, date_derived)`
delta_dates_days <- function(date_system, date_derived) {
  lubridate::time_length(lubridate::interval(date_system, date_derived), "days")
}
