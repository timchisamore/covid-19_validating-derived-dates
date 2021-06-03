#' Format CCM datetime string
#'
#' This function removes periods and commas from characters, it will be used to
#' properly format CCM datetime strings which contain both of these which makes
#' them incompatible with the parse_date_time function from the lubridate
#' package.
#'
#' @param ccm_datetime_string A character vector.
#'
#' @return A character vector with periods and commas removed.
#' @export
#'
#' @examples
#' `format_ccm_datetime_string(ccm_datetime_string)`
format_ccm_datetime_string <- function(ccm_datetime_string) {
  str_remove_all(string = ccm_datetime_string, pattern = "[\\.,]")
}
