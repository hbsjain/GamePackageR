
<!-- README.md is generated from README.Rmd. Please edit that file -->

# poker777

<!-- badges: start -->
<!-- badges: end -->

The goal of poker777 is to to facilitate the simulation and analysis of
poker games. Package can be used to create scoreboards, create
leaderboards, determine a winner of a game between 2 players, calculate
balance poker chips in a player’s hands.

The `poker_winner` function determines the winner of a poker game based
on the hands of two players. It evaluates the best hand for each player
and compares them to determine the winner or if it’s a tie.

The `poker_balance_chips` function is designed to simulate the balance
of chips for a player participating in a poker game. It takes into
account various parameters such as buy-in limits, minimum bet
requirements, player buy-in amount, and the outcome of each round of
betting.

The `poker_leaderboard` function generates a leaderboard based on the
winners of each round, as well as the pot and bet amounts. It arranges
player positions and displays the net amount won and the number of
rounds won by each player.

The `create_scoreboard` function is used to generate a scoreboard vector
for each round of a poker game. This vector consists of information
about the winner, pot amount, and bet amount for each round.

## Installation

You can install the development version of poker777 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Advanced-R-Programming/assignment-3-package-completion-hbsjain")
```

## Example

This is a basic example which shows you how to input the cards in each
player’s hands and find who wins the round.

``` r
library(poker777)
# Define hands for two players
hands <- list(c("2h", "2h", "2h", "2h", "3h"), c("4h", "4h", "4h", "4h", "5h"))

# Determine the winner
winner <- poker_winner(hands)

# Print the winner
print(winner)
#> [1] 2
```

This is a basic example which shows you how to input the buyin limits,
minimum bets allowed in each round, amount player used to buyin, and how
much they bet and how much they won in each round. The output will be
the total amount won for all rounds.

``` r
library(poker777)
# Define parameters
buy_in_limits <- c(100, 500)
min_bet <- 10
player_buy_in <- 200
bet_n_win <- list(c(20, 50), c(30, 0), c(50, 100))

# Call the function
remaining_chips <- poker_balance_chips(buy_in_limits, min_bet, player_buy_in, bet_n_win)

# Print the result
print(remaining_chips)
#> [1] 250
```

This is a basic example which shows you how to generate a leaderboard
using the scoreboard vector which displays the winner of tournament in
descending order along with how many rounds they won and how much they
won and how much they bet.

``` r
library(poker777)
# Create a scoreboard
pot_wins <- create_scoreboard(c(1, 2, 3), c(5000, 3000, 4000), c(200, 500, 300))

# Generate leaderboard
leaderboard <- poker_leaderboard(pot_wins)

# Print the leaderboard
print(leaderboard)
#> # A tibble: 3 × 4
#>   player_no actual_win total_bet rounds_won
#>       <dbl>      <dbl>     <dbl>      <int>
#> 1         1       4800       200          1
#> 2         3       3700       300          1
#> 3         2       2500       500          1
```

This is a basic example which shows you how to create a scoreboard
vector which has information about which player wins which round and how
much they won and bet for that round.

``` r
library(poker777)
# Create a scoreboard
scoreboard <- create_scoreboard(c(1, 2, 3), c(5000, 3000, 4000), c(200, 500, 300))

# Print the scoreboard
print(scoreboard)
#> <scores[3]>
#> Player    | Pot        | Bet 
#>  1        | 5000       | 200   
#>  2        | 3000       | 500   
#>  3        | 4000       | 300   
#> NULL
```
