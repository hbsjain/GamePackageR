% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/straight_flush_hand.R
\name{is_straight_flush}
\alias{is_straight_flush}
\title{Check if a hand is a straight flush.}
\usage{
is_straight_flush(hand)
}
\arguments{
\item{hand}{A character vector representing a poker hand.}
}
\value{
A logical value indicating whether the hand is a straight flush.
}
\description{
This function checks if a hand is a straight flush, which is a hand that
contains five cards of sequential rank, all of the same suit.
}
\details{
This function internally calls the is_flush and is_straight functions.
}
\keyword{internal}
