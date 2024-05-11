#' Check if a hand is a pair.
#'
#' This function checks if a hand is a pair, which is a hand that
#' contains two cards of the same rank.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a pair.
#' @keywords internal
is_pair <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(length(counts) == 4 && max(counts) == 2)
}
