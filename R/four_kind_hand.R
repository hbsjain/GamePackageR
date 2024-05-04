# Function to check if a hand is a four of a kind
is_four_of_a_kind <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(max(counts) == 4)
}
