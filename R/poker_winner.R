#' Determine winner of a poker game
#'
#' @param hands list of cards that both player have in hand
#' @return A number indicating winner - player 1 or player 2 or tie(0)
#' @export
#'
#' @examples
#' poker_winner(list(c("2h","2h","2h","2h","3h"),c("4h","4h","4h","4h","5h")))

poker_winner <- function(hands) {
  if(!length(hands) == 2){
    stop("More than 2 player hands entered.")
  }
  hands <- lapply(hands, toupper)
  if (!is_valid_hand(hands[[1]]) || !is_valid_hand(hands[[2]])) {
    stop("Invalid hands provided.")
  }

  # Determine best hand for each player
  player1_hand <- determine_best_hand(hands[[1]])
  player2_hand <- determine_best_hand(hands[[2]])

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

