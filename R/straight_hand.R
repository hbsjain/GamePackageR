# Function to check if a hand is a straight
is_straight <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  return(all(diff(hand_numeric) == 1))
}
