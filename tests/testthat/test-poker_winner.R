# Test for valid inputs and player 1 wins with a higher hand
test_that("Player 1 wins with a higher hand", {
  hands <- list(c("2H", "3H", "4H", "5H", "9H"), c("2D", "7D", "4D", "5D", "6D"))
  winner <- poker_winner(hands)
  expect_equal(winner, 1)
})

# Test for valid inputs and player 2 wins with a higher hand
test_that("Player 2 wins with a higher hand", {
  hands <- list(c("2H", "3H", "4H", "5H", "6H"), c("3D", "4D", "5D", "6D", "7D"))
  winner <- poker_winner(hands)
  expect_equal(winner, 2)
})

# Test for valid inputs and a tie
test_that("It's a tie", {
  hands <- list(c("2H", "3H", "4H", "5H", "6H"), c("2D", "3D", "4D", "5D", "6D"))
  winner <- poker_winner(hands)
  expect_equal(winner, 0)
})

# Test for invalid input (more than 2 player hands)
test_that("More than 2 player hands entered", {
  hands <- list(c("2H", "3H", "4H", "5H", "6H"), c("2D", "3D", "4D", "5D", "6D"), c("2C", "3C", "4C", "5C", "6C"))
  expect_error(poker_winner(hands), "More than 2 player hands entered.")
})

# Test for invalid input (invalid hands provided)
test_that("Invalid hands provided", {
  hands <- list(c("2H", "3H", "4H", "5H", "6H"), c("2F", "3G", "4K", "5T", "6S"))
  expect_error(poker_winner(hands))
})

# Test for a royal flush
test_that("Detects a royal flush", {
  hand <- "TH JH QH KH AH"
  expect_true(is_royal_flush(hand))
})


# Test for a straight flush
test_that("Detects a straight flush", {
  hand <- c("2H", "3H", "4H", "5H", "6H")
  expect_true(is_straight_flush(hand))
})

# Test for a non-straight flush
test_that("Does not detect a non-straight flush as a straight flush", {
  hand <- c("2H", "3H", "4H", "5H", "7H")
  expect_false(is_straight_flush(hand))
})

# Test for a non-flush hand
test_that("Does not detect a non-flush hand as a straight flush", {
  hand <- c("2H", "3H", "4H", "5H", "6D")
  expect_false(is_straight_flush(hand))
})



# Test for a four of a kind
test_that("Detects a four of a kind", {
  hand <- c("2H", "2D", "2S", "2C", "5H")
  expect_true(is_four_of_a_kind(hand))
})

# Test for a non-four of a kind
test_that("Does not detect a non-four of a kind as a four of a kind", {
  hand <- c("2H", "2D", "3S", "4C", "5H")
  expect_false(is_four_of_a_kind(hand))
})

# Test for a hand with four aces
test_that("Detects a hand with four aces as a four of a kind", {
  hand <- c("AH", "AD", "AS", "AC", "5H")
  expect_true(is_four_of_a_kind(hand))
})



# Test for a full house
test_that("Detects a full house", {
  hand <- c("2H", "2D", "2S", "3C", "3H")
  expect_true(is_full_house(hand))
})

# Test for a non-full house
test_that("Does not detect a non-full house as a full house", {
  hand <- c("2H", "2D", "3S", "4C", "5H")
  expect_false(is_full_house(hand))
})

# Test for a hand with four aces
test_that("Does not detect a hand with four aces as a full house", {
  hand <- c("AH", "AD", "AS", "AC", "5H")
  expect_false(is_full_house(hand))
})

# Test for a flush
test_that("Detects a flush", {
  hand <- c("2H", "3H", "4H", "5H", "6H")
  expect_true(is_flush(hand))
})

# Test for a non-flush
test_that("Does not detect a non-flush as a flush", {
  hand <- c("2H", "3H", "4H", "5H", "6D")
  expect_false(is_flush(hand))
})



# Test for a straight
test_that("Detects a straight", {
  hand <- c("2H", "3D", "4S", "5C", "6H")
  expect_true(is_straight(hand))
})

# Test for a non-straight
test_that("Does not detect a non-straight as a straight", {
  hand <- c("2H", "3D", "4S", "5C", "7H")
  expect_false(is_straight(hand))
})



# Test for a three of a kind
test_that("Detects a three of a kind", {
  hand <- c("2H", "2D", "2S", "3C", "4H")
  expect_true(is_three_of_a_kind(hand))
})

# Test for a non-three of a kind
test_that("Does not detect a non-three of a kind as a three of a kind", {
  hand <- c("2H", "2D", "3S", "4C", "5H")
  expect_false(is_three_of_a_kind(hand))
})


# Test for a two pair
test_that("Detects a two pair", {
  hand <- c("2H", "2D", "3S", "3C", "4H")
  expect_true(is_two_pair(hand))
})

# Test for a non-two pair
test_that("Does not detect a non-two pair as a two pair", {
  hand <- c("2H", "2D", "3S", "4C", "5H")
  expect_false(is_two_pair(hand))
})

# Test for a hand with three pairs
test_that("Does not detect a hand with three pairs as a two pair", {
  hand <- c("2H", "2D", "3S", "3C", "3H")
  expect_false(is_two_pair(hand))
})

# Test for a hand with a four of a kind
test_that("Does not detect a hand with a four of a kind as a two pair", {
  hand <- c("2H", "2D", "2S", "2C", "5H")
  expect_false(is_two_pair(hand))
})


# Test for a pair
test_that("Detects a pair", {
  hand <- c("2H", "2D", "3S", "4C", "5H")
  expect_true(is_pair(hand))
})

# Test for a non-pair
test_that("Does not detect a non-pair as a pair", {
  hand <- c("2H", "3D", "4S", "5C", "6H")
  expect_false(is_pair(hand))
})

# Test for a hand with three of a kind
test_that("Does not detect a hand with three of a kind as a pair", {
  hand <- c("2H", "2D", "2S", "3C", "4H")
  expect_false(is_pair(hand))
})

# Test for a hand with four of a kind
test_that("Does not detect a hand with four of a kind as a pair", {
  hand <- c("2H", "2D", "2S", "2C", "5H")
  expect_false(is_pair(hand))
})

# Test for converting '2' to 1. Ace is highest so 2 is 1, 3 is 2 and so on
test_that("Converts '2' to 1", {
  expect_equal(convert_to_numeric("2H"), 1)
})

# Test for converting 'A' to 13. Ace is highest so it is 13
test_that("Converts 'A' to 13", {
  expect_equal(convert_to_numeric("AH"), 13)
})
