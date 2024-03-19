#' Take user input
#'
#' @return hands A list of 2 character vectors having cards for each player
#' @export
user_input <- function() {
  hands <- list()

  card_values <- c("A","2","3","4","5","6","7","8","9","T","J","Q","K")
  suits <- c("H", "C", "D", "S")

  for (i in 1:2) {
    hand <- character(0)

    while (length(hand) < 5) {
      card <- casefold(readline(paste("Player", i, "- Enter a card (e.g., '2H' for 2 of hearts): ")),upper = TRUE)
      if (length(card) == 0) {
        print("Please enter a valid card.")
      } else {
        # Extract card value and suit
        card_value <- substr(card, 1, 1)
        suit <- substr(card, 2, 2)

        # Check if card value and suit are valid
        if (card_value %in% card_values && suit %in% suits) {
          hand <- c(hand, card)
        } else {
          print("Invalid card format. Please enter cards in the format '2H' for 2 of hearts.")
        }
      }
    }
    hands[[i]] <- hand
  }
  return(hands)
}


