# Function to check if a hand is a three of a kind
is_three_of_a_kind <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(max(counts) == 3)
}
