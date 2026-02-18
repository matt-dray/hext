library(testthat)

test_that("hext default rendering snapshot", {
  expect_snapshot(
    hext("hello!", "this", "is", "hext", print = FALSE)
  )
})

test_that("hext printed output snapshot", {
  expect_snapshot_output(
    hext("hello!", "this", "is", "hext", print = TRUE)
  )
})

test_that("hext mixed alignment snapshot", {
  expect_snapshot(
    hext(
      "hello!",
      "this",
      "is",
      "hext",
      align_1 = "left",
      align_2 = "right",
      align_3 = "centre",
      align_4 = "left",
      print = FALSE
    )
  )
})

test_that("hext manual underscore padding snapshot", {
  expect_snapshot(
    hext(
      "R",
      "pkg",
      "test",
      "name__",
      print = FALSE
    )
  )
})

test_that("hext empty text snapshot", {
  expect_snapshot(
    hext(print = FALSE)
  )
})

test_that("hext max width content snapshot", {
  expect_snapshot(
    hext(
      "12345678", # max width line 1
      "1234567890", # max width line 2
      "abcdefghij", # max width line 3
      "ABCDEFGH", # max width line 4
      print = FALSE
    )
  )
})
