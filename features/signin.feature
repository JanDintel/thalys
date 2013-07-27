Feature: Admin

  Scenario: Signing in
    Given I have an account
    When I sign in
    Then I see the dashboard

  Scenario: Create a blog post
    Given I am on the dashboard
    Then I can create a new post
