Feature: Two computers playing
  So that I can learn
  As I keen player
  I would like to see two computers playing a game of noughts and crosses

  Scenario: A game
    Given I am on the homepage
    And I choose "computer_v_computer"
    And I choose "X"
    And I choose "player1"
    When I press "submit"
    And I press "show next moves"
    Then I should see "X" in the centre of the board

  Scenario: A draw
    Given I am on the homepage
    And I choose "computer_v_computer"
    And I choose "X"
    And I choose "player1"
    And I press "submit"
    And I press "show next moves" 8 times
    Then I should see "It's a tie!"
