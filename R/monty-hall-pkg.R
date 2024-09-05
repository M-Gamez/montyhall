#' @title
#' Run Monty Hall game simulations
#' @description montyhall package contains functions to generate Monty Hall problem games and store results in a data frame.
#' @details
#'   The game setup replicates the game on the TV show "Let's
#'   Make a Deal" where there are three doors for a contestant
#'   to choose from, one of which has a car behind it and two 
#'   have goats. The contestant selects a door, then the host
#'   opens a door to reveal a goat, and then the contestant is
#'   given an opportunity to stay with their original selection
#'   or switch to the other unopened door. There was a famous 
#'   debate about whether it was optimal to stay or switch when
#'   given the option to switch, so this simulation was created
#'   to test both strategies. 
#' @examples
#' play_game()
#' play_n_games()
#' @export
#' montyhall

#' @title
#' Determine contestant's first door choice. 
#' @description
#' `select_door()` randomly one of the doors for the contestant.
#' @param ... no arguments are used by the function.
#' @return The function returns a number between 1 and 3. 
#' @examples
#' select_door()
#' @export
#' @title
#' Create a new Monty Hall game set-up.
#' @description `create_game()` generates a new game that consists of two doors 
#'   with goats behind them, and one with a car.
#' @param ... no arguments are used by the function.
#' 
#' @return The function returns a length 3 character vector
#'   indicating the positions of goats and the car.
#'
#' @examples
#'   create_game()
#'
#' @export
create_game <- function()
{
    a.game <- sample( x=c("goat","goat","car"), size=3, replace=F )
    return( a.game )
} 
#' @title
#' Determine contestant's first door choice. 
#' @description
#' `select_door()` randomly one of the doors for the contestant.
#' @param ... no arguments are used by the function.
#' @return The function returns a number between 1 and 3. 
#' @examples
#' select_door()
#' @export
select_door <- function( )
{
  doors <- c(1,2,3) 
  a.pick <- sample( doors, size=1 )
  return( a.pick )  # number between 1 and 3
}



#' @title
#' Host opens a door with a goat from the remaining doors.
#' @description
#' `open_goat_door()` selects one of the remaining two doors with a goat behind it.
#' @details 
#' This function requires two arguments. 
#' @param game : the game with two doors with goats behind them and one with a car.
#' @param a.pick: the door selected by the contestant.
#' @return The function returns a number between 1 and 3 corresponding to a door with a goat behind it.
#' @examples
#' open_goat_door(game=new_game, a.pick=contestant_choice)
#' @export
open_goat_door <- function( game, a.pick )
{
   doors <- c(1,2,3)
   # if contestant selected car,
   # randomly select one of two goats 
   if( game[ a.pick ] == "car" )
   { 
     goat.doors <- doors[ game != "car" ] 
     opened.door <- sample( goat.doors, size=1 )
   }
   if( game[ a.pick ] == "goat" )
   { 
     opened.door <- doors[ game != "car" & doors != a.pick ] 
   }
   return( opened.door ) # number between 1 and 3
}



#' @title
#' Determine whether contestant keeps original door or changes to different door.
#' @description
#' `change_door()` determines the last remaining door that was not selected by the contestant
#' or opened by the host to reveal a goat, and allows the contestant's choice to be changed 
#' if desired. 
#' @details
#' This function requires three arguments. 
#' @param stay : Logical where `TRUE` returns contestants original choice and `FALSE` switches contestants choice to last remaining door.
#' @param opened.door: Number between 1-3 corresponding to goat door opened by host.
#' @param a.pick: Number between 1-3 corresponding to the original door selected by the contestant.
#' @return 
#' Returns number between 1 and 3.
#' @examples
#' change_door(stay=T, opened.door, a.pick)
#' change_door(stay=F, opened.door, a.pick)
#' @export
change_door <- function( stay=T, opened.door, a.pick )
{
   doors <- c(1,2,3) 
   
   if( stay )
   {
     final.pick <- a.pick
   }
   if( ! stay )
   {
     final.pick <- doors[ doors != opened.door & doors != a.pick ] 
   }
  
   return( final.pick )  # number between 1 and 3
}



#' @title
#' Determine whether contestant wins or loses if they stay or switch doors.
#' @description
#'`determine_winner()` evaluates whether the contestants choice corresponds to a goat or a car.
#' The contestant is determined to win if their door contains a car and lose if their door contains a goat.
#' @details
#' This function requires two arguments. 
#' @param final.pick: Number between 1-3 corresponding to the contestants final choice after staying or switching.
#' @param game : the game with two doors with goats behind them and one with a car.
#' @return 
#' The function returns a string value of either "WIN" or "LOSE".
#' @examples
#' determine_winner(final.pick=contestant.choice, game=new.game)
#' @export
determine_winner <- function( final.pick, game )
{
   if( game[ final.pick ] == "car" )
   {
      return( "WIN" )
   }
   if( game[ final.pick ] == "goat" )
   {
      return( "LOSE" )
   }
}
#' @title
#' Simulate a Monty Hall game and return if contestant wins when they keep their door or change door.
#' @description
#' `play_game()` function simulates one Monty Hall game and returns a 2x2 data frame with a strategy column with 'stay' 
#' or 'switch' options and a result column showing whether the strategy 
#' won or lost the game.
#' @param 
#' ... no arguments are used by the function
#' @return 
#' returns a 2x2 data frame with a strategy column with 'stay' or 'switch' options and a result column showing whether the strategy won or lost the game.
#' @examples
#' play_game()
#' @export
play_game <- function( )
{
  new.game <- create_game()
  first.pick <- select_door()
  opened.door <- open_goat_door( new.game, first.pick )

  final.pick.stay <- change_door( stay=T, opened.door, first.pick )
  final.pick.switch <- change_door( stay=F, opened.door, first.pick )

  outcome.stay <- determine_winner( final.pick.stay, new.game  )
  outcome.switch <- determine_winner( final.pick.switch, new.game )
  
  strategy <- c("stay","switch")
  outcome <- c(outcome.stay,outcome.switch)
  game.results <- data.frame( strategy, outcome,
                              stringsAsFactors=F )
  return( game.results )
}






#' @title
#' Simulate user-defined number of Monty Hall games.
#' @description
#' `play_n_games()` function simulates x number of Monty Hall games and returns a data frame 
#' of results with a strategy column with the 'stay' or 'switch' options and a result column showing 
#' whether the strategy won or lost the game.
#' @details
#' This function requires one argument.
#' @param n: a number corresponding to the number of games to be run.
#' @return 
#' returns a data frame with a strategy column with 'stay' or 'switch' options and a result column showing whether the strategy won or lost the game for each simulation.
#' @examples
#' # play 100 games
#' play_n_games(100)
#' # play 50 games
#' play_n_games(50)
#' @export
play_n_games <- function( n=100 )
{
  
  library( dplyr )
  results.list <- list()   # collector
  loop.count <- 1

  for( i in 1:n )  # iterator
  {
    game.outcome <- play_game()
    results.list[[ loop.count ]] <- game.outcome 
    loop.count <- loop.count + 1
  }
  
  results.df <- dplyr::bind_rows( results.list )

  table( results.df ) %>% 
  prop.table( margin=1 ) %>%  # row proportions
  round( 2 ) %>% 
  print()
  
  return( results.df )

}
