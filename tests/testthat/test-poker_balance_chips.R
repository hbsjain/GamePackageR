# Test 1: Check if the function returns remaining chips correctly
test_that("Remaining chips are calculated correctly", {
  buy_in_limits <- c(5000, 20000)
  min_bet <- 50
  player_buy_in <- 10000
  bet_n_win <- list(c(500, 5000), c(100, 0), c(200, 1000))

  expected_remaining_chips <- 15200 # Calculated manually

  remaining_chips <-
    poker_balance_chips(buy_in_limits, min_bet, player_buy_in, bet_n_win)
  expect_equal(remaining_chips, expected_remaining_chips)
})

# Test 2: Check if the function throws an error for player buy-in outside limits
test_that("Error is thrown for player buy-in outside limits", {
  buy_in_limits <- c(5000, 20000)
  min_bet <- 50
  player_buy_in <- 25000 # Player buy-in exceeds the maximum limit

  expect_error(poker_balance_chips(buy_in_limits, min_bet, player_buy_in, list()))
})

# Test 3: Check if the function throws an error for incorrect bet amount
test_that("Error is thrown for incorrect bet amount", {
  buy_in_limits <- c(5000, 20000)
  min_bet <- 50
  player_buy_in <- 10000
  bet_n_win <-
    list(c(20, 5000)) # Bet amount less than the minimum bet

  expect_error(poker_balance_chips(buy_in_limits, min_bet, player_buy_in, bet_n_win))
})

# Test 4: Check if the function throws an error for winning amount less than minimum bet
test_that("Error is thrown for winning amount less than minimum bet", {
  buy_in_limits <- c(5000, 20000)
  min_bet <- 50
  player_buy_in <- 10000
  bet_n_win <-
    list(c(500, 5000), c(100, 0), c(200, 40)) # Winning amount less than minimum bet

  expect_error(poker_balance_chips(buy_in_limits, min_bet, player_buy_in, bet_n_win))
})
