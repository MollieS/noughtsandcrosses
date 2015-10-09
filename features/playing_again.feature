Feature: Playing again
  So that I can play a lot
  As an obsessed player
  I would like to start a new game easily

 Scenario: with the same players
    Given I have set up a game
    When I press "1"
    And I press "play again"
    Then I should see "X to play"

  Scenario: a new game
    Given I have set up a game
    When I follow "new game"
    Then I should see "Who is playing?"
