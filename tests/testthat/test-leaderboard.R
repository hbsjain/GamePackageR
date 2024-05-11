# Test for creating a scoreboard
test_that("Creates a scoreboard", {
  player_no <- c(1, 2, 3)
  pot <- c(100, 200, 300)
  bet <- c(10, 20, 30)
  scoreboard <- create_scoreboard(player_no, pot, bet)
  expect_s3_class(scoreboard, "scores")
})

# Test for creating a scoreboard with non-numeric inputs
test_that("Throws an error for non-numeric inputs", {
  player_no <- c(1, 2, 3)
  pot <- c(100, 200, "300")  # '300' is character
  bet <- c(10, 20, 30)
  expect_error(create_scoreboard(player_no, pot, bet))
})

# Test for creating a scoreboard with pot less than or equal to bet
test_that("Throws an error for pot less than or equal to bet", {
  player_no <- c(1, 2, 3)
  pot <- c(100, 200, 300)
  bet <- c(10, 200, 30)  # pot[2] <= bet[2]
  expect_error(create_scoreboard(player_no, pot, bet), "Pot must be greater than bet for all entries.")
})

# Test for creating a scoreboard with different length inputs
test_that("Throws an error for different length inputs", {
  player_no <- c(1, 2, 3)
  pot <- c(100, 200)
  bet <- c(10, 20, 30)
  expect_error(create_scoreboard(player_no, pot, bet), "All parameters must be of the same length.")
})

# Test for calculating poker leaderboard
test_that("Calculates poker leaderboard correctly", {
  # Create a sample scoreboard
  player_no <- c(1, 2, 3, 1, 2, 3)
  pot <- c(100, 200, 300, 50, 150, 250)
  bet <- c(10, 20, 30, 5, 10, 15)
  scoreboard <- create_scoreboard(player_no, pot, bet)

  # Calculate the leaderboard
  leaderboard <- as.data.frame(poker_leaderboard(scoreboard))

  # Expected leaderboard
  expected_leaderboard <- data.frame(
    player_no = c(3, 2, 1),
    actual_win = c(505, 320, 135),
    total_bet = c(45, 30, 15),
    rounds_won = c(2, 2, 2)
  )

  # Compare actual vs expected leaderboard
  expect_equal(leaderboard, expected_leaderboard)
})
