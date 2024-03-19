# Mock input function
mock_input <- function(prompt) {
  static_input <- c("2H", "2H", "2H", "2H", "3H", "4H", "4H", "4H", "4H", "5H")
  return(static_input[1])
}

# Replace readline() with mock_input
old_readline <- readline
readline <- mock_input

test_that("poker_winner() with input 2h,2h,2h,2h,3h and 4h,4h,4h,4h,5h gives 2 as winner", {
  expect_equal(poker_winner(), 2)
})

# Restore readline() function
readline <- old_readline
