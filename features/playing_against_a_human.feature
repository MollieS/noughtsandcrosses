Feature: Playing against a human
  In order to play the game
  As a player
  I would like see my moves on a board

  Scenario: two humans
    Given I have set up a game
    When I press "0"
    Then I should see "X" in the top left corner 

  Scenario: winning a game against a human
    Given I have set up a game
    And I press "2"
    And my opponent presses "4"
    And I press "6"
    And my opponent presses "8"
    And I press "0"
    And my opponent presses "1"
    And I press "3"
    Then I should see "Winner: X"

  Scenario: a tied game
    Given I have set up a game
    And I press "0"
    And my opponent presses "4"
    And I press "8"
    And my opponent presses "1"
    And I press "7"
    And my opponent presses "6"
    And I press "2"
    And my opponent presses "5"
    And I press "3"
    Then I should see "It's a tie!"
