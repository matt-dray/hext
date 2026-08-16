library(testthat)

test_that("text padding works", {
  expect_equal(
    .pad_text(
      text = "hext",
      align = "right",
      width = 8L,
      pad_char = " ",
      count_type = "width"
    ),
    "    hext"
  )

  expect_error(.pad_text(count_type = "test"))
})

test_that("stringi is used for display width if available", {
  skip_if_not_installed("stringi")

  text <- c("hello", "🙂")

  expect_equal(
    .get_display_width(text),
    stringi::stri_width(text)
  )
})

test_that("base-R display widths returned", {
  expect_equal(
    .get_display_width("hello"),
    5
  )
})

test_that("sentence pasting works", {
  expect_equal(
    .paste_sentence(rep("hext", 3)),
    "hext, hext and hext"
  )

  expect_equal(
    .paste_sentence(""),
    ""
  )

  expect_equal(
    .paste_sentence("hext"),
    "hext"
  )

  expect_equal(
    .paste_sentence(c("hext", "hext")),
    "hext and hext"
  )

  expect_error(.paste_sentence(list("hext", "test")))
})

test_that("colour name is converted to ANSI", {
  expect_equal(.col2ansi("red"), "\033[1;91m")
  expect_error(.col2ansi(1))
  expect_error(.col2ansi("test"))
  expect_error(.col2ansi("none"))
})
