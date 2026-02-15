#' Pad Text to Line Width
#' @noRd
pad_text <- function(
  text = "",
  align = c("centre", "left", "right"),
  width = 8L,
  pad_char = " "
) {
  text_width <- get_display_width(text)

  align <- match.arg(align)

  if (!is.character(text)) {
    stop("Argument 'text' must be of class character.", call. = FALSE)
  }
  if (!is.character(align)) {
    stop("Argument 'align' must be of class character.", call. = FALSE)
  }
  if (!is.integer(width)) {
    stop("Argument 'width' must be of class integer.", call. = FALSE)
  }
  if (!is.character(pad_char) || nchar(pad_char) > 1) {
    stop(
      "Argument 'pad_char' must be of class character and length 1.",
      call. = FALSE
    )
  }
  if (text_width > width) {
    stop(
      "Text length must not exceed the total character width for this line (",
      width,
      ").",
      call. = FALSE
    )
  }

  n_spaces <- width - text_width

  max_pad <- strrep(pad_char, n_spaces)
  pad_left <- if (align == "right") max_pad else ""
  pad_right <- if (align == "left") max_pad else ""

  if (align == "centre") {
    pad_left_n <- floor(n_spaces / 2)
    pad_right_n <- n_spaces - pad_left_n
    pad_left <- strrep(pad_char, pad_left_n)
    pad_right <- strrep(pad_char, pad_right_n)
  }

  paste0(pad_left, text, pad_right)
}

# Get the Display Width of Text Input
# @noRd
get_display_width <- function(text) {
  if (requireNamespace("stringi", quietly = TRUE)) {
    # Only use stringi if installed on user's machine
    stringi::stri_width(text)
  } else {
    nchar(text, type = "width")
  }
}

#' Vector to Sentence
#' @noRd
paste_sentence <- function(values) {
  if (!is.atomic(values)) {
    stop("Argument 'values' must be an atomic vector.", call. = FALSE)
  }

  values <- as.character(values)
  n <- length(values)

  if (n == 0L) {
    return("")
  }
  if (n == 1L) {
    return(values)
  }
  if (n == 2L) {
    return(paste(values, collapse = " and "))
  }

  rest <- values[-n]
  last <- values[n]

  paste0(paste(rest, collapse = ", "), " and ", last)
}
