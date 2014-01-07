Feature: Adding stats
  Scenario: User not specified
    Given it tries to add a stat
    And it does not specify a user
    Then it should receive status code 404
  Scenario: User does not exist
    Given it tries to add a stat
    And the user does not exist
    Then it should receive status code 404
  Scenario: User exists but not stat
    Given it tries to add a stat
    And the user exists
    And the stat does not exist
    Then the stat should be added
    And the stats count should be incremented
    And it should receive status code 200
  Scenario: User and stat exist
    Given it tries to add a stat
    And the user exists
    And the stat exists
    Then the stat's count should increment
    And it should receive status code 200