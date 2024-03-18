user_input <- function() {
  hands <- list()

  for (i in 1:2) {
    hand <- character(0)

    while (length(hand) < 5) {
      card <- readline(prompt = paste("Player", i, "- Enter a card (e.g., '2H' for 2 of hearts): "))
      if (length(card) == 0) {
        print("Please enter a valid card.")
      } else {
        hand <- c(hand, card)
      }
    }

    hands[[i]] <- hand
  }

  return(hands)
}
