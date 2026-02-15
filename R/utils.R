#' Pad Text to Line Width
#' @noRd
pad_text <- function(
  text = "",
  align = "centre",
  width = 8L,
  pad_char = " ",
  count_type = "width"
) {
  text_width <- switch(
    count_type,
    width = get_display_width(text),
    chars = nchar(text),
    stop("Argument 'count_type' is invalid.", call. = FALSE)
  )

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
