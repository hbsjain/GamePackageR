# Function to check if a hand is a flush
is_flush <- function(hand) {
  suits <- substr(hand, 2, 2)
  return(length(unique(suits)) == 1)
}
