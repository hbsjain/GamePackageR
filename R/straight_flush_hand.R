#' Check if a hand is a straight flush.
#'
#' This function checks if a hand is a straight flush, which is a hand that
#' contains five cards of sequential rank, all of the same suit.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a straight flush.
#' @details This function internally calls the is_flush and is_straight functions.
#' @keywords internal
is_straight_flush <- function(hand) {
  return(is_flush(hand) && is_straight(hand))
}
