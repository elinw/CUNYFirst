library(testthat)

test_that("reading works", {
  expect_identical(read.peoplesoft.csv("./testfile.csv"), read.csv("./testfile2.csv"))
})
