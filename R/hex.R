#' Make a Text Hex Logo
#'
#' Create a simple text-based hexagon logo, optionally coloured, with up to four
#' lines of aligned text.
#'
#' @param text_1,text_2,text_3,text_4 Character scalar. Text to display on lines
#'     1 to 4 of the hex logo. Each must be length 1 and not contain
#'     newlines. Defaults to `""` for empty lines.
#' @param align_1,align_2,align_3,align_4 Character scalar. Text alignment for
#'     each line. One of `"centre"`, `"left"`, or `"right"`. Defaults to
#'     `"centre"`.
#' @param count_type Character scalar. Count the display width of
#'     characters (`"width"`, default) or number of characters (`"chars"`)
#'     provided by all `text_*` arguments.
#' @param col Character scalar. Name of a colour for the text foreground.
#'     See details for colour options. Defaults to `"none"`.
#' @param print Logical scalar. If `TRUE` (default), prints the hex logo
#'     and returns it invisibly. If `FALSE`, returns the string without
#'     printing.
#'
#' @details
#'
#' ## Line limits
#'
#' * Lines 1 and 4 have a maximum width of 8 characters.
#' * Lines 2 and 3 have a maximum width of 10 characters.
#' * Text exceeding a line's width will trigger an error.
#'
#' ## Text padding
#'
#' * Padding is automatically applied with spaces (lines 1 to 3) or underscores
#'   (line 4) to maintain border alignment.
#' * You can manually pad text with spaces or underscores to fine-tune text
#'   placement.
#'
#' ## Display width
#'
#' * You can set `count_type` to help manually place characters.
#' * The display width of text is calculated with [stringi::stri_width()] if
#'   `stringi` is installed, otherwise [base::nchar()] with `type = "width"`.
#'
#' ## Rendering
#'
#' * Unicode characters such as emoji may not align perfectly across all
#'   terminals or fonts due to rendering differences.
#' * The backslash character does not get rendered without escaping, like
#'   `"\\"`.
#'
#' ## Colours
#'
#' You can pass these colour name options to `col`:
#'
#' * `"none"`, which results in the default colours provided by your terminal
#' * `"red"`
#' * `"green"`
#' * `"yellow"`
#' * `"blue"`
#' * `"magenta"`
#' * `"cyan"`
#' * `"white"`
#' * `"black"`
#' * `"grey"` or `"gray"`
#'
#' These are converted to ANSI escape codes that represent bright foreground
#' colours (colour codes 90 to 97) and black (30). The exact colour that gets
#' rendered will vary by terminal. Note that the ANSI codes are included in the
#' returned hex if `col` is set to a value other than `"none"`.
#'
#' @return Character scalar containing the formatted hex. Invisible if `print`
#'     is `TRUE`.
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
#' # Colour the text
#' hext(
#'   "hello!", "this", "is", "hext",
#'   "left", "right", "centre", "left",
#'   col = "yellow"
#' )
#'
#' # Return hex invisibly without printing
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
  col = c(
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
  align_1 <- match.arg(align_1)
  align_2 <- match.arg(align_2)
  align_3 <- match.arg(align_3)
  align_4 <- match.arg(align_4)
  count_type <- match.arg(count_type)
  col <- match.arg(col)

  .validate_print(print)

  texts <- c(text_1, text_2, text_3, text_4)

  width_min <- 8L
  width_max <- 10L
  widths <- c(width_min, width_max, width_max, width_min)

  .validate_texts(texts, widths)

  aligns <- c(align_1, align_2, align_3, align_4)

  .validate_aligns(aligns)

  pad_chars <- c(rep(" ", 3L), "_")

  padded_texts <- mapply(
    .pad_text,
    texts,
    aligns,
    widths,
    pad_chars,
    count_type,
    USE.NAMES = FALSE
  )

  hex_template <- c(
    "  ________",
    " /%s\\",
    "/%s\\",
    "\\%s/",
    " \\%s/"
  )

  if (col != "none") {
    ansi_start <- .col2ansi(col)
    ansi_stop <- "\033[0m"
    hex_template <- paste0(ansi_start, hex_template, ansi_stop)
  }

  hex <- sprintf(
    paste(hex_template, collapse = "\n"),
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
