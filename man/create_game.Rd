% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/monty-hall-pkg.R
\name{create_game}
\alias{create_game}
\title{Run Monty Hall game simulations}
\usage{
create_game()
}
\arguments{
\item{...}{no arguments are used by the function.}
}
\value{
The function returns a length 3 character vector indicating the positions of goats and the car.
}
\description{
montyhall package contains functions to generate Monty Hall problem games and store results in a data frame.

\code{create_game()} generates a new game that consists of two doors with goats behind them, and one with a car.
}
\details{
The game setup replicates the game on the TV show "Let's
Make a Deal" where there are three doors for a contestant
to choose from, one of which has a car behind it and two
have goats. The contestant selects a door, then the host
opens a door to reveal a goat, and then the contestant is
given an opportunity to stay with their original selection
or switch to the other unopened door. There was a famous
debate about whether it was optimal to stay or switch when
given the option to switch, so this simulation was created
to test both strategies.

Generally, you will not need to run this function yourself; it should be run automatically when you run a full simulation with \code{play_game()}.
}
\examples{
play_game()
play_n_games()
  create_game()
}
\seealso{
Other montyhall: 
\code{\link{change_door}()},
\code{\link{determine_winner}()},
\code{\link{open_goat_door}()},
\code{\link{play_game}()},
\code{\link{play_n_games}()}
}
\concept{montyhall}
