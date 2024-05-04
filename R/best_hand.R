# Function to determine the best hand
determine_best_hand <- function(hand) {
  if (is_royal_flush(hand)) {
    return(9)  # Royal Flush
  } else if (is_straight_flush(hand)) {
    return(8)  # Straight Flush
  } else if (is_four_of_a_kind(hand)) {
    return(7)  # Four of a Kind
  }  else if (is_full_house(hand)) {
    return(6)  # Full House
  } else if (is_flush(hand)) {
    return(5)  # Flush
  }  else if (is_straight(hand)) {
    return(4)  # Straight
  } else if (is_three_of_a_kind(hand)) {
    return(3)  # Three of a Kind
  } else if (is_two_pair(hand)) {
    return(2)  # Two pair
  } else if (is_pair(hand)) {
    return(1)  # Pair
  } else {
    return(0)  # High Card
  }
}
