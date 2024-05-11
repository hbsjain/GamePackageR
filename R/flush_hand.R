#' Check if a hand is a flush.
#'
#' This function checks if a hand is a flush, which is a hand that
#' contains five cards of the same suit.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a flush.
#' @keywords internal
is_flush <- function(hand) {
  suits <- substr(hand, 2, 2)
  return(length(unique(suits)) == 1)
}
