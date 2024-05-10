#' Leaderboard Generator. Based on the winners of each round and pot amount, arranges player positions and shows net amount won and rounds won by each player
#'
#' @param scoreboard A vector of type scores having the player no, pot amounts and bet amounts
#'
#' @import dplyr
#' @export
#'
#' @examples
#' pot_wins <- create_scoreboard(c(1,2,3), c(5000,3000,4000), c(200,500,300))
#' poker_leaderboard(pot_wins)
poker_leaderboard <- function(scoreboard) {
  scoreboard <- vec_cast.data.frame.scores(scoreboard)
  scoreboard %>%
    group_by(player_no) %>%
    summarise(actual_win = sum(pot - bet),
              total_bet = sum(bet),
              rounds_won = n()) |>
    arrange(-actual_win)
}


#' Used to create a Scoreboard vector which consists of winner, pot amount, bet amount for each round
#'
#' @param player_no A numeric vector having the player numbers
#' @param pot A numeric vector having the pot amounts
#' @param bet A numeric vector bet amounts which can't be more than pot amount
#'
#' @import vctrs
#' @return scoreboard A custom vector usable to calculate leaderboard
#' @export
#'
#' @examples
#' create_scoreboard(c(1,2,3), c(5000,3000,4000), c(200,500,300))
create_scoreboard <- function(player_no, pot, bet) {
  # Check if all parameters are of the same length
  if (!(length(player_no) == length(pot) &&
        length(player_no) == length(bet))) {
    stop("All parameters must be of the same length.")
  }

  # Check if all parameters are numeric
  vctrs::vec_assert(player_no, numeric())
  vctrs::vec_assert(pot, numeric())
  vctrs::vec_assert(bet, numeric())

  # Check if pot[1] is not less than bet[1], and so on
  if (any(pot <= bet)) {
    stop("Pot must be greater than bet for all entries.")
  }
  scoreboard <- vctrs::new_rcrd(list(
    player_no = player_no,
    pot = pot,
    bet = bet
  ), class = "scores")
  return(scoreboard)
}



#' Custom Formatting of the scores class
#'
#' @param x A scores vector rcrd class
#' @param ... Other parameters if required
#' @import vctrs
#' @return Neatly prints the scores board
#' @export
format.scores <- function(x, ...) {
  cat(sprintf("Player    | Pot        | Bet \n"))
  cat(sprintf(
    "%-8s | %-10s | %-6s\n",
    vctrs::field(x, "player_no"),
    vctrs::field(x, "pot"),
    vctrs::field(x, "bet")
  ))
}

#' Custom method for casting the scores class to data frame class
#'
#' @param x A scores vector rcrd class
#' @param to A class that we need to convert to. By default a data frame
#' @param ... Other parameters if required
#' @import vctrs
#' @return A data frame
#' @export
vec_cast.data.frame.scores <- function(x, to, ...){
  vctrs::vec_data(x)
}


