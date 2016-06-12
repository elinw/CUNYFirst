# Calculate GPA
# Used for student-course data e.g. one row per course per student.
# Assumes that the grades have already been converted to numeric values.
# Calculates the GPA for and the number of courses the GPA is based on
# Attempts to handle replaced grades and the CUNY F and CUNY D policy correctly.
#' @param x  Dataframe containing student-course data including ID and numericgrades.
#' @param ID EmplID variable name.
#' @param  numericgrade  Name for columns containing grades in numeric format.
#' ID refers to student EmplID. Numericgrades can be created with gradetonumgrade()

gpa<-function(x, ID = ID, numericgrade = numericgrade)
{
  library(dplyr)
  bystudent <- group_by(x, ID)
  gpa.c<-summarise(bystudent, gpa.calc = mean(numericgrades, na.rm = TRUE))
  ncourses<-tally(bystudent)
  summary<-merge(gpa.c,ncourses)
  summary
}
