#' Calculate the balance chips in hand after betting a certain rounds
#'
#' @param buy_in_limits Minimum and Maximum chips to buy in a table
#' @param min_bet Minimum bet a player would need to place every round
#' @param player_buy_in Actual chips that player bought in
#' @param bet_n_win A list of betting amount and winning amount for each round. Input must be like list(c(bet1,win1),c(bet2,win2),...)
#'
#' @return A number indicating the outstanding chips in the player's hand at the last round.
#' @export
#'
#' @examples
#'
#' buy_in_limits <- c(5000, 20000)
#' min_bet <- 50
#' player_buy_in <- 10000
#' bet_n_win <- list(c(500, 5000), c(100, 0), c(200, 1000))
#' poker_balance_chips(buy_in_limits, min_bet, player_buy_in, bet_n_win)

poker_balance_chips <-
  function(buy_in_limits,
           min_bet,
           player_buy_in,
           bet_n_win) {
    # Check if player buy-in is within the specified limits
    if (player_buy_in < min(buy_in_limits) |
        player_buy_in > max(buy_in_limits)) {
      stop("Player buy-in must be within the specified limits.")
    }

    # Initialize remaining chips with player's initial buy-in
    remaining_chips <- player_buy_in

    # Iterate over rounds data
    for (i in seq_along(bet_n_win)) {
      round <- bet_n_win[[i]]

      # Bet for any round cannot be less than minimum bet
      if (round[1] < min_bet) {
        stop(
          paste(
            "Player has entered incorrect bet amount which is less than the minimum bet for round",
            i
          )
        )
      }

      # Extract bet placed and winning amount for the round
      bet_placed <- round[1]
      winning_amount <- round[2]

      # Ensure winning amount is not less than the sum of bet placed and minimum bet
      if (winning_amount != 0) {
        if (winning_amount < (bet_placed + min_bet)) {
          stop(
            paste(
              "Winning amount cannot be less than the bet placed plus the minimum bet,",
              bet_placed + min_bet,
              ",for round",
              i
            )
          )
        }
      }

      # Update remaining chips based on the outcome of the round
      remaining_chips <-
        remaining_chips - bet_placed + winning_amount
    }

    return(remaining_chips)
  }
