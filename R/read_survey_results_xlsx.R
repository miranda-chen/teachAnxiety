##' Reads xlsx files with meaningful error message
##'
##' @description Function to read both .csv and .xlsx files into R.
##' @usage read_survey_results_xlsx(file)
##' @param file A filename as a character vector of length 1
##' @return A data frame representing the .xlsx file
##'
##'
##' @export

read_survey_results_xlsx <- function(fn, ...) {

  d <- tryCatch(
    d <- readxl::read_excel(fn, ...),
    warning = function(w) w,
    error = function(e) {
      error.message <- paste0("Either ", fn, " does not exist, or it is not a readable .xlsx file.")
      stop(error.message)
    }
  )
  d
}
