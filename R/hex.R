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
#' @param count_type Character scalar. Count the display width of
#'     characters (`"width"`, default) or number of characters (`"chars"`)
#'     provided by all `text_*` arguments.
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
#' * You can set count_display_width to help manually place characters.
#' * The display width of text is calculated with [stringi::stri_width()] if
#'   `stringi` is installed, otherwise [base::nchar()] with `type = "width"`.
#' * Unicode characters such as emoji may not align perfectly across all
#'   terminals or fonts due to rendering differences.
#' * The backslash character does not get rendered without escaping `\\`.
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
#' cat(hex_text)
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
  count_type = c("width", "chars"),
  col_border = c(
    "none",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "white",
    "black",
    "grey",
    "gray"
  ),
  print = TRUE
) {
  count_type <- match.arg(count_type)

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
    count_type,
    USE.NAMES = FALSE
  )

  hex_lines <- c(
    "  ________",
    sprintf(" /%s\\", padded_texts[1]),
    sprintf("/%s\\", padded_texts[2]),
    sprintf("\\%s/", padded_texts[3]),
    sprintf(" \\%s/", padded_texts[4])
  )

  if (col_border != "none") {
    col_border <- match.arg(col_border)

    cols <- setNames(
      c(91:97, 30, 90, 90),
      c(
        "red",
        "green",
        "yellow",
        "blue",
        "magenta",
        "cyan",
        "white",
        "black",
        "grey",
        "gray"
      )
    )

    col <- paste0("\033[1;", cols[col_border], "m")
    col_end <- "\033[0m"

    hex_lines[1] <- gsub("_", paste0(col, "_", col_end), hex_lines[1])

    hex_lines[2] <- .substr(hex_lines[2], 2, 2, paste0(col, "/", col_end))
    hex_lines[2] <- .substr(hex_lines[2], 22, 22, paste0(col, "\\", col_end))

    hex_lines[3] <- .substr(hex_lines[3], 1, 1, paste0(col, "/", col_end))
    hex_lines[3] <- .substr(hex_lines[3], 23, 23, paste0(col, "\\", col_end))

    hex_lines[4] <- .substr(hex_lines[4], 1, 1, paste0(col, "\\", col_end))
    hex_lines[4] <- .substr(hex_lines[4], 23, 23, paste0(col, "/", col_end))

    hex_lines[5] <- .substr(hex_lines[5], 2, 2, paste0(col, "\\", col_end))
    hex_lines[5] <- .substr(hex_lines[5], 22, 22, paste0(col, "/", col_end))

    hex_lines[5] <- gsub("_", paste0(col, "_", col_end), hex_lines[5])
  }

  hex <- paste(hex_lines, collapse = "\n")

  if (print) {
    cat(hex)
    return(invisible(hex))
  }

  hex
}

.substr <- function(x, start, stop, value) {
  paste0(substr(x, 1, start - 1), value, substr(x, stop + 1, nchar(x)))
}
