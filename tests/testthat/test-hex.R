library(testthat)

test_that("hext returns a character string when print = FALSE", {
  res <- hext("a", "b", "c", "d", print = FALSE)
  expect_type(res, "character")
  expect_length(res, 1)
})

test_that("hext prints output", {
  expect_output(
    hext("a", "b", "c", "d", print = TRUE)
  )
})

test_that("hext returns string invisibly", {
  res <- hext("a", "b", "c", "d", print = TRUE)
  expect_type(res, "character")
})

test_that("hext output has expected hex structure", {
  res <- hext("a", "b", "c", "d", print = FALSE)
  lines <- strsplit(res, "\n", fixed = TRUE)[[1]]

  expect_equal(length(lines), 5)
  expect_true(grepl("^  ________", lines[1]))
  expect_true(grepl("^ /.*\\\\$", lines[2]))
  expect_true(grepl("^/.*\\\\$", lines[3]))
  expect_true(grepl("^\\\\.*/$", lines[4]))
  expect_true(grepl("^ \\\\.*\\/$", lines[5]))
})

test_that("text exceeding width limits errors", {
  expect_error(
    hext("123456789", "", "", "", print = FALSE), # > 8 chars line 1
    class = "error"
  )

  expect_error(
    hext("", "12345678901", "", "", print = FALSE), # > 10 chars line 2
    class = "error"
  )
})

test_that("alignment options work without error", {
  expect_no_error(
    hext(
      "a",
      "b",
      "c",
      "d",
      align_1 = "left",
      align_2 = "right",
      align_3 = "centre",
      align_4 = "left",
      print = FALSE
    )
  )
})

test_that("invalid alignment errors", {
  expect_error(
    hext("a", "b", "c", "d", align_1 = "middle", print = FALSE),
    class = "error"
  )
})

test_that("newline characters in text are rejected", {
  expect_error(
    hext("a\nb", "", "", "", print = FALSE),
    class = "error"
  )
})

test_that("count_type argument is validated", {
  expect_no_error(
    hext("a", "b", "c", "d", count_type = "width", print = FALSE)
  )

  expect_no_error(
    hext("a", "b", "c", "d", count_type = "chars", print = FALSE)
  )

  expect_error(
    hext("a", "b", "c", "d", count_type = "bytes", print = FALSE)
  )
})

test_that("empty inputs produce valid hex", {
  res <- hext(print = FALSE)
  expect_type(res, "character")
  expect_match(res, "________")
})
