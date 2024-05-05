# Function to check if a hand is a straight
is_straight <- function(hand) {
  hand_numeric <- sort(sapply(hand, convert_to_numeric))
  if(identical(hand_numeric, c(2, 3, 4, 5, 13))){
    return(TRUE)
  }
  return(all(diff(hand_numeric) == 1))
}
