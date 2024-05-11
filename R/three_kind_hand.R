#' Check if a hand is a three of a kind.
#'
#' This function checks if a hand is a three of a kind, which is a hand that
#' contains three cards of the same rank.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a three of a kind.
#' @keywords internal
is_three_of_a_kind <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(max(counts) == 3)
}
