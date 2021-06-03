#' Writing wrong dates data
#'
#' This function writes the wrong dates data file into the data > clean
#' directory before returning the pathway, as the targets package requires.
#'
#' @param wrong_dates_data A tbl_df of wrong dates data.
#'
#' @return A character representing the pathway to the written data.
#' @export
#'
#' @examples
#' `(writing_wrong_dates_data(wrong_dates_data)`
writing_wrong_dates_data <- function(wrong_dates_data) {
  write_csv(wrong_dates_data, here::here("data", "clean", "wrong_dates_data.csv"))
  here::here("data", "clean", "wrong_dates_data.csv")
}
