#' Make a Text-Based Hex Sticker
#' @param text_1,text_2,text_3,text_4 Character. Text to display on each line
#'     number.
#' @param align_1,align_2,align_3,align_4 Character. Text alignment for each
#'     line number. One of of `'centre'`, `'left'` or `'right'`. Defaults to
#'     `'centre'`.
#' @param ... Reserved for future use.
#' @param .cat Logical. Concatenate and print the four lines of the hex and
#'     return the character vector silently? Otherwise return the character
#'     vector. Defaults to `TRUE`.
#' @details
#' Lines 1 and 4 have a width of 8 characters. Lines 2 and 3 have width 10.
#' Your provided text cannot exceed this line width.
#' If you put text on line 4 then it will replace the border for that row.
#' @examples
#' make_hext(
#'   line_2 = "⬡⬢", align_2 = "centre",
#'   line_3 = "hext", align_3 = "centre"
#' )
#' @export
make_hext <- function(
  text_1 = "",
  text_2 = "⬡⬢",
  text_3 = "hext",
  text_4 = "",
  align_1 = c("centre", "left", "right"),
  align_2 = c("centre", "left", "right"),
  align_3 = c("centre", "left", "right"),
  align_4 = c("centre", "left", "right"),
  ...,
  .cat = TRUE
) {
  width_min <- 8L
  width_max <- 10L

  if (nchar(text_1) > width_min || nchar(text_4) > width_min) {
    stop(
      "Text length must not exceed the total character width for this line (",
      width_min,
      ")."
    )
  }

  if (nchar(text_2) > width_max || nchar(text_3) > width_max) {
    stop(
      "Text length must not exceed the total character width for this line (",
      width_max,
      ")."
    )
  }

  align_1 <- match.arg(align_1)
  align_2 <- match.arg(align_2)
  align_3 <- match.arg(align_3)
  align_4 <- match.arg(align_4)

  text_1_padded <- pad_text(text_1, align_1, width_min)
  text_2_padded <- pad_text(text_2, align_2, width_max)
  text_3_padded <- pad_text(text_3, align_3, width_max)
  text_4_padded <- pad_text(text_4, align_4, width_min, "_")

  if (text_4_padded == "        ") {
    # Revert empty bottom line to border
    text_4_padded <- "________"
  }

  # fmt: skip
  hex <- paste(
    r"{  ________}",
    paste0(" /",  text_1_padded, "\\"),
    paste0("/",   text_2_padded, "\\"),
    paste0("\\",  text_3_padded, "/"),
    paste0(" \\", text_4_padded, "/"),
    sep = "\n"
  )

  if (.cat) {
    cat(hex)
    return(invisible(hex))
  }

  hex
}

#' Pad Text to Line Width
#' @param text Character. Text to display on this line of the hex.
#' @param align Character. Text alignment for this line of the hex. One of
#'     `'centre'`, `'left'` or `'right'`. Defaults to `'centre'`.
#' @param width Integer. Maximum number of characters on this line of the hex.
#' @param pad_char Character. Symbol to pad text with on this line of the hex.
#'     Must be length 1.
#' @example pad_text("hext", "centre", 8L, "_")
#' @noRd
pad_text <- function(
  text = "",
  align = c("centre", "left", "right"),
  width = 8L,
  pad_char = " "
) {
  align <- match.arg(align)

  if (!inherits(text, "character")) {
    stop("Argument 'text' must be of class character.")
  }
  if (!inherits(align, "character")) {
    stop("Argument 'align' must be of class character.")
  }
  if (!inherits(width, "integer")) {
    stop("Argument 'width' must be of class integer.")
  }
  if (!inherits(pad_char, "character") || nchar(pad_char) > 1) {
    stop("Argument 'pad_char' must be of class character with length 1.")
  }
  if (nchar(text) > width) {
    stop(
      "Text length must not exceed the total character width for this line (",
      width,
      ")."
    )
  }

  n_spaces <- width - nchar(text)

  max_pad <- paste(rep(pad_char, n_spaces), collapse = "")
  pad_left <- ifelse(align == "right", max_pad, "")
  pad_right <- ifelse(align == "left", max_pad, "")

  if (align == "centre") {
    pad_left_n <- floor(n_spaces / 2) # favour right pad
    pad_right_n <- n_spaces - pad_left_n
    pad_left <- paste(rep(pad_char, pad_left_n), collapse = "")
    pad_right <- paste(rep(pad_char, pad_right_n), collapse = "")
  }

  paste0(pad_left, text, pad_right)
}
