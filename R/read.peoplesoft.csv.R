# Function to read a downloaded csv file
# skips the extraneous line in the last row.
#' @param  full name and location of the csv file to be read.

read.peoplesoft.csv <- function(filename)
{
  library("R.utils")
  nlines <- countLines(filename)
  data <-readLines(filename)
  skiplast <- data[-nlines]
  df <- read.csv(textConnection(skiplast), stringsAsFactors = FALSE)
}
