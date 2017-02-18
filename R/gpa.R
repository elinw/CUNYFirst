#' Calculate GPA from numeric grades.
#
#' @details
#' Used for student-course data e.g. one row per course per student.
#' Assumes that the grades have already been converted to numeric values.
#' Calculates the GPA for and the number of courses the GPA is based on
#' Attempts to handle replaced grades and the CUNY F and CUNY D policy correctly.
#' @param x  Dataframe containing student-course data including ID and numericgrades.
#' @param ID EmplID variable name.
#' @param  numericgrade  Name for columns containing grades in numeric format.
#' @param Unit.Taken  Name for column representing the number of units for a course in integer format.
#' ID refers to student EmplID. Numericgrades can be created with gradetonumgrade()

gpa<-function(x, ID = ID, numericgrade = numericgrade, Unit.Taken = Unit.Taken)
{
  requireNamespace('dplyr')
  bystudent <- dplyr::group_by(x, ID)

  gpa.c<-dplyr::summarise(bystudent,
                    gpa.calc = stats::weighted.mean(numericgrade, Unit.Taken, na.rm = TRUE),
                    Total.Units = sum(Unit.Taken))
  ncourses<-dplyr::tally(bystudent)
  summary<-merge(gpa.c,ncourses)
  summary
}
