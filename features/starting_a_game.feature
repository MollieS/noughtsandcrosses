Feature: Starting a game
  In order to play a game
  As a keen player
  I would like to set up a game of noughts and crosses

  Scenario: Against another human
    Given I am on the homepage
    And I choose "two_humans"
    And I choose "X"
    And I choose "player1"
    When I press "submit"
    Then I should see "X to play"

  Scenario: Against a computer
    Given I am on the homepage
    And I choose "computer_v_human"
    And I choose "O"
    And I choose "player2"
    When I press "submit"
    Then I should see "X to play"

  Scenario: A computer playing a computer
    Given I am on the homepage
    And I choose "computer_v_computer"
    And I choose "X"
    And I choose "player1"
    When I press "submit"
    Then I should see the button "show next moves"
