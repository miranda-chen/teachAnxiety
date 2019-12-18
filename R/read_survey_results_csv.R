##' Reads csv files with meaningful error message
##'
##' @description Function to read both .csv and .xlsx files into R.
##' @usage read_survey_results_csv(file)
##' @param file A filename as a character vector of length 1
##' @return A data frame representing the .csv file
##'
##'
##' @export

read_survey_csv <- function(fn, ...) {

  d <- tryCatch(
    d <- readr::read_csv(fn, ...),
    warning = function(w) w,
    error = function(e) {
      error.message <- paste0("Either ", fn, " does not exist, or it is not a readable .csv file.")
      stop(error.message)
    }
  )
  d
}
