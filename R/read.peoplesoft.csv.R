# Function to read a downloaded csv file
# skips the extraneous line in the last row.
#' @param  full name and location of the csv file to be read.

read.peoplesoft.csv <- function(filename)
{
  requireNamespace("R.utils")
  nlines <- R.utils::countLines(filename)
  data <-readLines(filename)
  skiplast <- data[-nlines]
  df <- read.csv(textConnection(skiplast), stringsAsFactors = FALSE)
}
