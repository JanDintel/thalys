Feature: Sign in

  Scenario: Signing in
    Given I have an account
    When I sign in
    Then I see the dashboard
