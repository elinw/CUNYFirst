library(testthat)

ID<-c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,3, 4)
numericgrade<-c(4.0,2.0,3.3,0,1.25,3.0,NA,NA, 3.0, 3.25, 2.75, 3.0, 4.0, 3.2, NA, 3.75)
Unit.Taken<-rep(3, each = 16)

Unit.Taken.2 <- c(3,3,3,4,3,3,4,3,3,3,2,2,3,3,4,5)
df<-data.frame(ID, numericgrade, Unit.Taken)
df2<-data.frame(ID, numericgrade, Unit.Taken = Unit.Taken.2)


students <- c(1,2,3,4)
gpa.calc <- c(2.258333, 3.200000, NaN, 3.750000)
gpa.calc.2 <- c(2.139474, 3.240625, NaN, 3.750000)
n<-c(8,6,1,1)
Total.Units<-c(24, 18, 3, 3)
Total.Units.2 <- c(26,16,4,5)

test_that("GPA basic calculations are correct", {
  studentgpa<- gpa(df)
  expect_equal(round(studentgpa$gpa.calc, 3), round(gpa.calc, 3))
  expect_equal(studentgpa$Total.Units, Total.Units)
  expect_equal(studentgpa$n, n)
})

test_that("GPA calculation works with unequal weights", {
  studentgpa<- gpa(df2)
  expect_equal(round(studentgpa$gpa.calc, 3), round(gpa.calc.2, 3))
  expect_equal(studentgpa$Total.Units, Total.Units,2)
  expect_equal(studentgpa$n, n)
})
