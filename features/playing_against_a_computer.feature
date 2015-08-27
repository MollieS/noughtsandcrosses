Feature: Playing agaist a computer
  So that I can challenge myself
  As a competative player
  I would like to play a game against a computer

  Scenario: the computer goes first
    Given I have set up a game against a computer
    Then I should see "O" in the top left corner

  Scenario: a tie
    Given I have set up a game against a computer
    And I press "4"
    And I press "2"
    And I press "3"
    And I press "8"
    Then I should see "It's a tie!"

  Scenario: when the computer wins
    Given I have set up a game against a computer
    And I press "2"
    And I press "6"
    And I press "5"
    Then I should see "Winner: O"
