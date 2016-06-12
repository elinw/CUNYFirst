# Function to convert letter grades to numbers
#' @param x is a dataframe containing the Grade field from CUNYFirst
#' If you have not read in grades with stringsAsFactors = FALSE you wil get a warning.

gradetonumgrade <- function (x) {
  library(hash)
  library(dplyr)

  x$Grade <- as.character(x$Grade)

  # Deal with any blank grades
  x$Grade[x$Grade == ""]<-"IP"

  # Create hash
  gradehash <- hash("A" = 4,
                    "A-" = 3.75,
                    "B+" = 3.25,
                    "B" = 3,
                    "B-" = 2.75,
                    "C+" = 2.25,
                    "C" = 2,
                    "C-" = 1.75,
                    "D+" = 1.25,
  	                "D" = 1,
                    "F" = 0,
                    "WU" = 0,
                    "INC" = NA,
                    "FIN" = 0,
                    "WN" = NA,
                    "WD" = NA,
                    "#WU" = NA,
                    "#D" = NA,
                    "#D+" = NA,
                    "#F" = NA,
                    "#FI" = NA,
                    "*WN" = NA,
                    "&C+" = 2.25,
                    "IP" = NA,
                    "W" = NA,
                    "P" = NA  )

  newx <- mutate(x, numgrade = values(gradehash, keys = x$Grade))
  names(newx$numgrade) <- NULL

  newx
}
