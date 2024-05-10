poker_leaderboard <- function(scoreboard) {
  scoreboard <- vec_cast.data.frame.scores()
  scoreboard %>%
    group_by(player_no) %>%
    summarise(actual_win = sum(pot - bet),
              total_bet = sum(bet),
              rounds_won = n()) |>
    arrange(-actual_win)
}

poker_leaderboard(scoreboard)

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

format.scores <- function(x, ...) {
  cat(sprintf("Player    | Pot        | Bet \n"))
  cat(sprintf(
    "%-8s | %-10s | %-6s\n",
    vctrs::field(x, "player_no"),
    vctrs::field(x, "pot"),
    vctrs::field(x, "bet")
  ))
}

vec_cast.data.frame.scores <- function(x, to, ...){
  vctrs::vec_data(scoreboard)
}

vec_cast.scores.data.frame <- function(x, to, ...){
  vctrs::vec_data(scoreboard)
}

