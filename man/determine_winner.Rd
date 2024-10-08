% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/monty-hall-pkg.R
\name{determine_winner}
\alias{determine_winner}
\title{Determine whether contestant wins or loses if they stay or switch doors.}
\usage{
determine_winner(final.pick, game)
}
\arguments{
\item{game}{: the game with two doors with goats behind them and one with a car.}

\item{final.pick:}{Number between 1-3 corresponding to the contestants final choice after staying or switching.}
}
\value{
The function returns a string value of either "WIN" or "LOSE".
}
\description{
\code{determine_winner()} evaluates whether the contestants choice corresponds to a goat or a car.
The contestant is determined to win if their door contains a car and lose if their door contains a goat.
}
\details{
This function requires two arguments.
Generally, you will not need to run this function yourself; it should be run automatically when you run a full simulation with \code{play_game()}.
}
\examples{
determine_winner(final.pick=contestant.choice, game=new.game)
}
\seealso{
Other montyhall: 
\code{\link{change_door}()},
\code{\link{create_game}()},
\code{\link{open_goat_door}()},
\code{\link{play_game}()},
\code{\link{play_n_games}()}
}
\concept{montyhall}
