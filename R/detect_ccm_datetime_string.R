#' Detect CCM datetime string
#'
#' This function detects characters with a datetime format of YYYY-mm-dd, II:MM
#' a.m./p.m. so that they can be properly formatted as lubridate datetime
#' objects.
#'
#' @param ccm_datetime_string A character vector.
#'
#' @return A logical vector indicating whether the character had the CCM
#' datetime format.
#' @export
#'
#' @examples
#' `detect_ccm_datetime_string(ccm_datetime_string)`
detect_ccm_datetime_string <- function(ccm_datetime_string) {
  str_detect(string = ccm_datetime_string, pattern = "^\\d{4}-\\d{2}-\\d{2}, \\d{1,2}:\\d{2} [ap]{1}\\.m\\.$")
}
