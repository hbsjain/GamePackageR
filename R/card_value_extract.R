#' Convert card value to numeric.
#'
#' This function converts the value of a card to its numeric equivalent.
#' For example, '2' becomes 2, '3' becomes 3, 'T' becomes 10, 'J' becomes 11, etc.
#'
#' @param card A character vector representing a single card.
#' @return The numeric value of the card.
#' @keywords internal
convert_to_numeric <- function(card) {
  card_value <- substr(card, 1, 1)
  return(match(card_value, card_values))
}
