library(testthat)
Grade <- c("A", "B+", "IP", "", "#F", "WU")
numeric <- c(4, 3.25, NA, NA, NA, 0)

df <- data.frame(Grade, numeric)

df<-gradetonumgrade(df)

test_that("conversions are correct", {
  df<- gradetonumgrade(df)
  expect_equivalent(df$numgrade, df$numeric)
})
