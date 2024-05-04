# Function to check if a hand is a straight flush
is_straight_flush <- function(hand) {
  return(is_flush(hand) && is_straight(hand))
}
