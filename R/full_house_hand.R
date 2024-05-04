# Function to check if a hand is a full house
is_full_house <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(length(counts) == 2 && max(counts) == 3)
}
