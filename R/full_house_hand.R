#' Check if a hand is a full house.
#'
#' This function checks if a hand is a full house, which is a hand that
#' contains three cards of one rank and two cards of another rank.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a full house.
#' @keywords internal
is_full_house <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(length(counts) == 2 && max(counts) == 3)
}
