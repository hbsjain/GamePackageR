# Function to check if a hand is a royal flush
is_royal_flush <- function(hand) {
  suits <- substr(hand, 2, 2)
  values <- substr(hand, 1, 1)
  royal_values <- c("T", "J", "Q", "K", "A")
  return(is_flush(hand) && all(values %in% royal_values))
}
