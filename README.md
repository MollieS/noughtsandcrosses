# noughtsandcrosses

An unbeatable version of noughts and crosses using a basic version minimax algorithm.

It can be played by two human players, a computer and a human and two computers.

The computer player should be unbeatable and should win when possible.

Written in Ruby, served with Sinatra, tested with RSpec and Cucumber

###How to run

* clone this repository: https://github.com/MollieS/noughtsandcrosses.git
* change into your local repository
* `bundle` to install all dependencies
* `rackup` to serve the app
* visit localhost:9292 to play the game

###Tests

* `rspec` will run all back-end tests
* `cucumber` will test the web app

####Considerations

* the app runs very slowly when playing against a computer, because of the size of the data the minimax algorithm goes through.
* I have researched the alpha-beta pruning algorithm and would like to implement it in the future
