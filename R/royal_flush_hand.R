#' Check if a hand is a royal flush.
#'
#' This function checks if a hand is a royal flush, which is a hand that
#' contains five cards of the same suit with values '10', 'Jack', 'Queen', 'King',
#' and 'Ace'.
#'
#' @param hand A character vector representing a poker hand.
#' @return A logical value indicating whether the hand is a royal flush.
#' @details This function internally calls the is_flush function.
#' @keywords internal
is_royal_flush <- function(hand) {
  suits <- substr(hand, 2, 2)
  values <- substr(hand, 1, 1)
  royal_values <- c("T", "J", "Q", "K", "A")
  return(is_flush(hand) && all(values %in% royal_values))
}
