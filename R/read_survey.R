##' Read survey data
##'
##' @description Interprets the extension of a filename for survey data and calls the appropriate function to read the file.
##' @usage read_survey(fn)
##' @param fn A filename as a character vector of length 1
##' @param sheet For .xlsx files, the name of the spreadsheet in which the data are stored
##' @return A data frame containing data from the .csv or .xlsx file
##' @details Currently this can read .xslx or .csv files which must be formatted according to the vignette. Any file not ending in .xlsx tries to read a .csv
##'
##' @export

read_survey <- function(fn, sheet = "Sheet1", ...) {

  # First check whether filename is a character vector
  if(!(is.character(fn))) {
    stop("You didn't pass me a character vector; I can't open this.")
  }

  # Check whether the filename ends in .xlsx or .csv
  if(stringr::str_detect(fn, "\\.xlsx$")) { # .xlsx
    survey_df <- read_survey_xlsx(fn, sheet = sheet, ...)
  } else { #.csv
    if(!stringr::str_detect(fn, "\\.csv%")) {
      warning("The filename does not end in .csv but I am programmed to read any file that doesn't end in .xlsx as a .csv file")
    }
    survey_df <- read_survey_csv(fn, ...)
  }
  #this will display the data to you
  survey_df
}

