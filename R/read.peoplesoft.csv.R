#' Function to read a downloaded csv file.
#' @param filename full name and location of the csv file to be read.
#' @details
#' Skips the extraneous line in the last row that is added by CUNYFirst.

read.peoplesoft.csv <- function(filename)
{
  requireNamespace("R.utils")
  nlines <- R.utils::countLines(filename)
  data <-readLines(filename)
  skiplast <- data[-nlines]
  df <- utils::read.csv(textConnection(skiplast), stringsAsFactors = FALSE)
}
