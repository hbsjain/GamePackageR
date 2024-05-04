
<!-- README.md is generated from README.Rmd. Please edit that file -->

# poker777

<!-- badges: start -->

[![R-CMD-check](https://github.com/Advanced-R-Programming/assignment-3-package-completion-hbsjain/blob/main/.github/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/numbats/assignment-1-package-creation-hbsjain/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The ‘poker777’ package provides a function to determine the winner of a
poker game between two players based on their hands. It evaluates each
player’s hand according to standard poker rules, including identifying
royal flushes, straights, flushes, pairs, and high cards. The function
validates input hands to ensure they contain exactly five cards in the
correct format before determining the winner. This package is useful for
analyzing poker games and settling disputes in friendly games or
simulations.

## Installation

You can install the development version of poker777 from
[GitHub](https://github.com/numbats/assignment-1-package-creation-hbsjain)
with:

``` r
# install.packages("devtools")
devtools::install_github("numbats/assignment-1-package-creation-hbsjain")
```

## Example

This is a basic example which shows you how to input the cards in each
player’s hands and find who wins the round.

``` r
library(poker777)
hands <- list(c("2h","2h","2h","2h","3h"),c("4h","4h","4h","4h","5h"))
poker_winner(hands)
#> [1] 2
```
