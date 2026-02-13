#' Make a Text-Based Hex Sticker
#'
#' Create a simple text-based hexagon-sticker logo with up to four lines of
#' aligned text.
#'
#' @param text_1,text_2,text_3,text_4 Character scalar. Text to display on lines
#'     1 to 4 of the hex sticker. Each must be length 1 and not contain
#'     newlines. Defaults to `""` for empty lines.
#' @param align_1,align_2,align_3,align_4 Character scalar. Text alignment for
#'     each line. One of `"centre"`, `"left"`, or `"right"`. Defaults to
#'     `"centre"`.
#' @param print Logical scalar. If `TRUE` (default), prints the hex sticker
#'     and returns it invisibly. If `FALSE`, returns the string without
#'     printing.
#'
#' @details
#' * Lines 1 and 4 have a maximum width of 8 characters.
#' * Lines 2 and 3 have a maximum width of 10 characters.
#' * Text exceeding a line's width will trigger an error.
#' * Padding is automatically applied with spaces (lines 1 to 3) or underscores
#'   (line 4) to maintain border alignment.
#' * You can manually pad text with spaces or underscores to fine-tune text
#'   placement.
#'
#' @return Character scalar containing the formatted hex sticker. Invisible
#'     if `print` is `TRUE`.
#'
#' @examples
#' # Default text-centered hex
#' hext("hello!", "this", "is", "hext")
#'
#' # Mixed alignment
#' hext(
#'   "hello!", "this", "is", "hext",
#'   "left", "right", "centre", "left"
#' )
#'
#' # Return hex as a string without printing
#' hex_text <- hext("hello!", "this", "is", "hext", print = FALSE)
#' cat(hext_text)
#' @export
hext <- function(
  text_1 = "",
  text_2 = "",
  text_3 = "",
  text_4 = "",
  align_1 = c("centre", "left", "right"),
  align_2 = c("centre", "left", "right"),
  align_3 = c("centre", "left", "right"),
  align_4 = c("centre", "left", "right"),
  print = TRUE
) {
  validate_print(print)

  texts <- c(text_1, text_2, text_3, text_4)

  width_min <- 8L
  width_max <- 10L
  widths <- c(width_min, width_max, width_max, width_min)

  validate_texts(texts, widths)

  aligns <- c(
    match.arg(align_1),
    match.arg(align_2),
    match.arg(align_3),
    match.arg(align_4)
  )

  validate_aligns(aligns)

  pad_chars <- c(rep(" ", 3L), "_")

  padded_texts <- mapply(
    pad_text,
    texts,
    aligns,
    widths,
    pad_chars,
    USE.NAMES = FALSE
  )

  hex <- sprintf(
    paste(
      "  ________",
      " /%s\\",
      "/%s\\",
      "\\%s/",
      " \\%s/",
      sep = "\n"
    ),
    padded_texts[1],
    padded_texts[2],
    padded_texts[3],
    padded_texts[4]
  )

  if (print) {
    cat(hex)
    return(invisible(hex))
  }

  hex
}
