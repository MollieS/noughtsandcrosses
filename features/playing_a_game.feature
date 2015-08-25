Feature: Playing a game
  In order to play the game
  As a player
  I would like see my moves on a board

  Scenario: two humans
    Given I have set up a game
    When I press "0"
    Then I should see "X" within "board"

  Scenario: computer goes first
    Given I have set up a game against a computer
    Then I should see "O" within "board"
