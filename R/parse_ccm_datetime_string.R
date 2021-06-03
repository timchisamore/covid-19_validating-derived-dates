#' Parse CCM datetime string
#'
#' This function takes the formatted CCM datetime strings and parses them as
#' datetime objects using the parse_date_time function from the lubridate
#' package.
#'
#' @param ccm_datetime_string A character vector.
#'
#' @return A POSIXct vector.
#' @export
#'
#' @examples
parse_ccm_datetime_string <- function(ccm_datetime_string) {
  lubridate::parse_date_time(x = format_ccm_datetime_string(ccm_datetime_string = ccm_datetime_string), orders = "%Y-%m-%d %I:%M %p")
}
