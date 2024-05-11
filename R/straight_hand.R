#' Check if a hand is a straight.
#'
#' This function checks if a hand is a straight, which is a hand that
#' contains five cards of sequential rank.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a straight.
#' @keywords internal
is_straight <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  if(identical(hand_numeric, c(2, 3, 4, 5, 13))){
    return(TRUE)
  }
  return(all(diff(hand_numeric) == 1))
}
