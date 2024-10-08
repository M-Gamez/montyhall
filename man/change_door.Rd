% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/monty-hall-pkg.R
\name{change_door}
\alias{change_door}
\title{Determine whether contestant keeps original door or changes to different door.}
\usage{
change_door(stay = T, opened.door, a.pick)
}
\arguments{
\item{stay}{: Logical where \code{TRUE} returns contestants original choice and \code{FALSE} switches contestants choice to last remaining door.}

\item{opened.door:}{Number between 1-3 corresponding to goat door opened by host.}

\item{a.pick:}{Number between 1-3 corresponding to the original door selected by the contestant.}
}
\value{
Returns number between 1 and 3.
}
\description{
\code{change_door()} determines the last remaining door that was not selected by the contestant
or opened by the host to reveal a goat, and allows the contestant's choice to be changed
if desired.
}
\details{
This function requires three arguments.
Generally, you will not need to run this function yourself; it should be run automatically when you run a full simulation with \code{play_game()}.
}
\examples{
change_door(stay=T, opened.door, a.pick)
change_door(stay=F, opened.door, a.pick)
}
\seealso{
Other montyhall: 
\code{\link{create_game}()},
\code{\link{determine_winner}()},
\code{\link{open_goat_door}()},
\code{\link{play_game}()},
\code{\link{play_n_games}()}
}
\concept{montyhall}
