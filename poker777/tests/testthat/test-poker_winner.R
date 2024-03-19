hands <- list(c("2h","2h","2h","2h","3h"),c("4h","4h","4h","4h","5h"))

test_that("poker_winner() with input 2h,2h,2h,2h,3h and 4h,4h,4h,4h,5h gives 2 as winner", {
  expect_equal(poker_winner(hands), 2)
})
