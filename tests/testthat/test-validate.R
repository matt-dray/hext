library(testthat)

test_that("text validation works", {
  testthat::expect_invisible(
    .validate_texts(c("hext", "testing"), c(8, 10))
  )

  testthat::expect_error(
    .validate_texts(
      list(c("hext", "hext")),
      list(c(8, 10))
    )
  )

  testthat::expect_error(
    .validate_texts(c("hext", NA_character_), list(8, 10))
  )

  testthat::expect_error(
    .validate_texts(c("hext", "\n"), list(8, 10))
  )

  testthat::expect_error(
    .validate_texts("hext", 3)
  )
})

test_that("alignment validation works", {
  testthat::expect_invisible(
    .validate_aligns(c("left", "centre", "right", "centre"))
  )

  testthat::expect_error(
    .validate_aligns(
      list(c("left", "left"), "centre", "right", NA_character_)
    )
  )

  testthat::expect_error(
    .validate_aligns(c("left", "centre", "right", NA_character_))
  )
})

test_that("print validation works", {
  testthat::expect_invisible(.validate_print(TRUE))
  testthat::expect_invisible(.validate_print(TRUE))
  testthat::expect_error(.validate_print("true"))
})
