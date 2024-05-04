# Function to check if a hand is a two pair
is_two_pair <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  counts <- table(hand_numeric)
  return(length(counts) == 3 && sum(counts == 2)==2)
}
