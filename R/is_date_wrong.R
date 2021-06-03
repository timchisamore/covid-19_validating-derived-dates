#' Is date wrong
#'
#' This function takes the system and derived dates and returns a boolean
#' indicating whether they are not equal.
#'
#' @param date_system A POSIXct indicating the system generated date.
#' @param date_derived A POSIXct indicating the derived date.
#'
#' @return A boolean indicating whether the dates are not equal.
#' @export
#'
#' @examples
#' `is_date_wrong(date_system, date_derived)`
is_date_wrong <- function(date_system, date_derived) {
  date_system != date_derived
}
