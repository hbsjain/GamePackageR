#' Check if a hand is a two pair.
#'
#' This function checks if a hand is a two pair, which is a hand that
#' contains two different pairs of cards of the same rank.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a two pair.
#' @keywords internal
is_two_pair <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(length(counts) == 3 && sum(counts == 2)==2)
}
