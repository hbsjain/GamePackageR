# Checking valid hand input
is_valid_hand <- function(hand) {

  # Check if the hand has exactly 5 cards
  if (length(hand) != 5) {
    stop("Each hand must have exactly 5 cards.")
  }
  # Check if each card is in the correct format
  if (!all(substr(hand, 1, 1) %in% card_values & toupper(substr(hand, 2, 2)) %in% suite)) {
    stop("Invalid card format. Cards must be in the format '2H' for 2 of hearts.")
  }
  return(TRUE)
}
