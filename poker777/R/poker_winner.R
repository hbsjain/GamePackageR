#' Determine winner of a poker game
#'
#' @return A number indicating player 1 or player 2
#' @export
#'
#' @examples
#' poker_winner()
#' # user will be prompted to enter cards as character vector for each player
poker_winner <- function() {

  # Take user input
  user_input <- function() {
    hands <- list()

    for (i in 1:2) {
      hand <- character(0)

      while (length(hand) < 5) {
        card <- readline(prompt = paste("Player", i, "- Enter a card (e.g., '2H' for 2 of hearts): "))
        if (length(card) == 0) {
          print("Please enter a valid card.")
        } else {
          hand <- c(hand, card)
        }
      }
      hands[[i]] <- hand
    }
    return(hands)
  }

  hands <- user_input()

  card_values <- c("A","2","3","4","5","6","7","8","9","T","J","Q","K")
  suite <- c("H", "C", "D", "S")

  # Function to convert card value to numeric
  convert_to_numeric <- function(card) {
    card_value <- substr(card, 1, 1)
    return(match(card_value, card_values))
  }

  # Function to check if a hand is a flush
  is_flush <- function(hand) {
    suits <- substr(hand, 2, 2)
    return(length(unique(suits)) == 1)
  }

  # Function to check if a hand is a straight
  is_straight <- function(hand) {
    hand_numeric <- sort(sapply(hand, convert_to_numeric))
    return(all(diff(hand_numeric) == 1))
  }

  # Function to check if a hand is a straight flush
  is_straight_flush <- function(hand) {
    return(is_flush(hand) && is_straight(hand))
  }

  # Function to check if a hand is a royal flush
  is_royal_flush <- function(hand) {
    suits <- substr(hand, 2, 2)
    values <- substr(hand, 1, 1)
    royal_values <- c("T", "J", "Q", "K", "A")
    return(length(unique(suits)) == 1 && all(values %in% royal_values))
  }

  # Function to check if a hand is a three of a kind
  is_three_of_a_kind <- function(hand) {
    hand_numeric <- sort(sapply(hand, convert_to_numeric))
    counts <- table(hand_numeric)
    return(max(counts) == 3)
  }

  # Function to check if a hand is a four of a kind
  is_four_of_a_kind <- function(hand) {
    hand_numeric <- sort(sapply(hand, convert_to_numeric))
    counts <- table(hand_numeric)
    return(max(counts) == 4)
  }

  # Function to check if a hand is a full house
  is_full_house <- function(hand) {
    hand_numeric <- sort(sapply(hand, convert_to_numeric))
    counts <- table(hand_numeric)
    return(length(counts) == 2 && max(counts) == 3)
  }

  # Function to check if a hand is a two pair
  is_two_pair <- function(hand) {
    hand_numeric <- sort(sapply(hand, convert_to_numeric))
    counts <- table(hand_numeric)
    return(length(counts) == 3 && all(counts == 2))
  }

  # Function to check if a hand is a pair
  is_pair <- function(hand) {
    hand_numeric <- sort(sapply(hand, convert_to_numeric))
    counts <- table(hand_numeric)
    return(length(counts) == 4 && max(counts) == 2)
  }

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

  # Determine best hand for each player
  player1_hand <- determine_best_hand(hands[1])
  player2_hand <- determine_best_hand(hands[2])

  # Compare best hands
  if (player1_hand > player2_hand) {
    return(1)
  } else if (player1_hand < player2_hand) {
    return(2)
  } else {
    # If both players have the same hand, compare high cards
    player1_high_card <- max(sapply(hands[1], convert_to_numeric))
    player2_high_card <- max(sapply(hands[2], convert_to_numeric))
    if (player1_high_card > player2_high_card) {
      return(1)
    } else if (player1_high_card < player2_high_card) {
      return(2)
    } else {
      return(0)  # It's a tie
    }
  }
}

