#' Check Text Arguments
#' @noRd
validate_texts <- function(texts, widths) {
  if (!all(lengths(as.list(texts)) == 1L)) {
    stop("Each text value must be length 1.", call. = FALSE)
  }

  if (anyNA(texts)) {
    stop("Text values cannot be NA.", call. = FALSE)
  }

  # Newlines or carriage returns
  if (any(grepl("[\r\n]", texts))) {
    stop(
      "Text values cannot be newlines.",
      call. = FALSE
    )
  }

  is_too_wide <- nchar(texts) > widths
  if (any(is_too_wide)) {
    stop(
      sprintf(
        "Text for line(s) %s exceed(s) max width (%s characters).",
        paste_sentence(which(is_too_wide)),
        paste_sentence(widths[is_too_wide])
      ),
      call. = FALSE
    )
  }
}

#' Check Alignment Arguments
#' @noRd
validate_aligns <- function(aligns) {
  if (!all(lengths(as.list(aligns)) == 1L)) {
    stop("Each alignment value must be length 1.", call. = FALSE)
  }

  if (anyNA(aligns)) {
    stop("Alignment values cannot be NA.", call. = FALSE)
  }
}

#' Check Print Argument
#' @noRd
validate_print <- function(is_print) {
  if (!is.logical(is_print) || length(is_print) != 1L || is.na(is_print)) {
    stop("Argument 'print' must be TRUE or FALSE.", call. = FALSE)
  }
}
