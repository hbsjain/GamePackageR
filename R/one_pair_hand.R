# Function to check if a hand is a pair
is_pair <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(length(counts) == 4 && max(counts) == 2)
}
