# montyhall
R package from Melissa Phillips. <br>
Class: PAF 514  
Term: Fall A 2024

## Overview
The `montyhall` R package provides functions to simulate the Monty Hall problem from the classic game show, "Let's Make a Deal." This package allows users to simulate new games and explore the probability of winning under different decision-making strategies. 

## Installation
To install the `montyhall` package, using the `devtools` package. 
```
install.package("devtools")
devtools::install_github("M-Gamez/montyhall")
```
## Usage

`library( montyhall )`

The `play_game()` function returns a 2x2 data frame
with a strategy column with 'stay' or 'switch' options
and a result column showing whether the strategy won or lost the game.

To run a simulation of the game 10,000 and display results in a table: 
```
results.df <- NULL   # collector

for( i in 1:10000 )  # iterator
{
  game.outcome <- play_game()
  results.df <- rbind( results.df, game.outcome )
}
table( results.df ) 
```

To display results as a proportion of each outcome: 
```
table( results.df ) %>% 
  prop.table( margin=1 ) %>%  # row proportions
  round( 2 )
```
