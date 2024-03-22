test_that("poker_winner() with input 2h,2h,2h,2h,3h and 4h,4h,4h,4h,5h gives 2 as winner", {
  hands <- list(c("2h","2h","2h","2h","3h"),c("4h","4h","4h","4h","5h"))
  expect_equal(poker_winner(hands), 2)
})

test_that("poker_winner() correctly identifies Royal Flush", {
  hands <- list(c("Th", "Jh", "Qh", "Kh", "Ah"), c("2c", "3c", "4c", "5c", "6c"))
  expect_equal(poker_winner(hands), 1)  # Player 1 has a Royal Flush
})

test_that("poker_winner() correctly identifies Straight Flush", {
  hands <- list(c("2h", "3h", "4h", "5h", "6h"), c("3c", "4c", "5c", "6c", "7c"))
  expect_equal(poker_winner(hands), 2)  # Player 2 has a Straight Flush
})

test_that("poker_winner() correctly identifies Four of a Kind", {
  hands <- list(c("2h", "2c", "2d", "2s", "3h"), c("4c", "4d", "4s", "4h", "5c"))
  expect_equal(poker_winner(hands), 2)  # Player 2 has Four of a Kind
})

test_that("poker_winner() correctly identifies Full House", {
  hands <- list(c("2h", "2c", "2d", "3s", "3h"), c("4c", "4d", "4s", "5h", "5c"))
  expect_equal(poker_winner(hands), 2)  # Player 2 has a Full House
})

test_that("poker_winner() correctly identifies Flush", {
  hands <- list(c("2h", "4h", "6h", "8h", "Th"), c("3c", "5d", "7c", "9c", "Jc"))
  expect_equal(poker_winner(hands), 1)  # Player 1 has a Flush
})

test_that("poker_winner() correctly identifies Straight", {
  hands <- list(c("2h", "3c", "4d", "5s", "6h"), c("3c", "4d", "5s", "6h", "7c"))
  expect_equal(poker_winner(hands), 2)  # Player 2 has a Straight
})

test_that("poker_winner() correctly identifies Three of a Kind", {
  hands <- list(c("2h", "2c", "2d", "3s", "4h"), c("3c", "3d", "3s", "5h", "6c"))
  expect_equal(poker_winner(hands), 2)  # Player 2 has Three of a Kind
})

test_that("poker_winner() correctly identifies Two Pair", {
  hands <- list(c("2h", "2c", "3d", "3s", "4h"), c("3c", "3d", "4s", "4h", "5c"))
  expect_equal(poker_winner(hands), 2)  # Player 2 has Two Pair
})

test_that("poker_winner() correctly identifies Pair", {
  hands <- list(c("2h", "2c", "3d", "4s", "5h"), c("3c", "3d", "4s", "6h", "7c"))
  expect_equal(poker_winner(hands), 2)  # Player 2 has a Pair
})

test_that("poker_winner() correctly identifies High Card", {
  hands <- list(c("2h", "3c", "4d", "5s", "7h"), c("3c", "4d", "5s", "6h", "8c"))
  expect_equal(poker_winner(hands), 2)  # Player 2 has the highest card
})

test_that("poker_winner() stops execution and throws error for invalid hand lengths", {
  invalid_hands <- list(c("2h", "2c", "2d"), c("4c", "4d", "4s", "4h", "5c", "6h"))
  expect_error(poker_winner(invalid_hands), "Each hand must have exactly 5 cards.")
})

test_that("poker_winner() stops execution and throws error for invalid card format", {
  invalid_hands <- list(c("2h", "2c", "2d", "2s", "3h"), c("4c", "4d", "4s", "4h", "5c", "6h"))
  invalid_hands[[1]][2] <- "invalid"  # Introduce an invalid card format
  expect_error(poker_winner(invalid_hands), "Invalid card format. Cards must be in the format '2H' for 2 of hearts.")
})

