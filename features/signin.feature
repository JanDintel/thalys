Feature: Admin

  Scenario: Signing in
    Given I have an account
    When I sign in
    Then I see the dashboard

  Scenario: Create a blog post
    Given I am on the dashboard
    Then I can create a new post

  Scenario: Edit a blog post
    Given there are some blog posts
    Given I am on the dashboard
    Then I can edit a blog post

  Scenario: Delete a blog post
    Given there are some blog posts
    Given I am on the dashboard
    Then I can delete a blog post
