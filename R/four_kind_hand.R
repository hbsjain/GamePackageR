#' Check if a hand is a four of a kind.
#'
#' This function checks if a hand is a four of a kind, which is a hand that
#' contains four cards of the same rank.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a four of a kind.
#' @keywords internal
is_four_of_a_kind <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(max(counts) == 4)
}
