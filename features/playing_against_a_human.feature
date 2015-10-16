Feature: Playing against a human
  In order to play the game
  As a player
  I would like see my moves on a board

  Scenario: two humans
    Given I have set up a game
    When I press "1"
    Then I should see "X" in the top left corner 

  Scenario: winning a game
    Given I have set up a game
    And I press "3"
    And my opponent presses "5"
    And I press "7"
    And my opponent presses "9"
    And I press "1"
    And my opponent presses "2"
    And I press "4"
    Then I should see "Winner: X"

  Scenario: a tied game
    Given I have set up a game
    And I press "1"
    And my opponent presses "5"
    And I press "9"
    And my opponent presses "2"
    And I press "8"
    And my opponent presses "7"
    And I press "3"
    And my opponent presses "6"
    And I press "4"
    Then I should see "It's a tie!"

  Scenario: when a game is over
    Given I have set up a game
    And I press "1"
    And my opponent presses "4"
    And I press "2"
    And my opponent presses "5"
    And I press "3"
    When my opponent presses "9"
    Then I should see "9" in the bottom left corner
