# montyhall
R package from Melissa Phillips. <br>
Class: PAF 514  
Term: Fall A 2024

## Overview
The `montyhall` R package provides functions to simulate the Monty Hall problem from the classic game show, "Let's Make a Deal." This package allows users to simulate new games and explore the probability of winning under different decision-making strategies. 

## Installation
To install the `montyhall` package, use the `devtools` package. 
```
install.package("devtools")
devtools::install_github("M-Gamez/montyhall")
```
## Usage

`library( montyhall )`

The `play_game()` function returns a 2x2 data frame
with a strategy column with 'stay' or 'switch' options
and a result column showing whether the strategy won or lost the game.

To run a simulation multiple simulations of the game and store results in a data frame, call the `play_n_games(n)` function and pass the number of games you wish to run as an argument. 
```
# to simulate 100 games
play_n_games(100)
```

## Functions
The `play_game()` and  `play_n_games()` functions execute the following functions in order to run a simulation. 
*  `create_game()`: creates a new Monty Hall game set-up.
*  `select_door()`: determines the contestant's first door choice.
*  `open_goat_door()`: selects door with goat from remaining doors. 
*  `change_door()`: determines the contestant's final door choices if they switch or stay.
*  `determine_winner()`: evaluates whether the contestant's final door choice is a car or a goat.
