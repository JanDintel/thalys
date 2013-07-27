Feature: Blog posts

  Scenario: First time visit
    Given there are some blog posts
    When I visit the blog
    Then I see the blog posts
