#' A Basic Hex
#' @examples
#'   cat(hl_base())
#' @export
get_base <- function() {
  paste(
    r"{  ________}",
    r"{ /        \}",
    r"{/          \}",
    r"{\          /}",
    r"{ \________/}",
    sep = "\n"
  )
}
