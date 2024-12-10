Feature: Tag and Post Associations (creating Tags and Tagging Posts)

    Background:

    Given these tags exist:
        | name | description | 
        | ""   | empty tag |
        | tag1 | tag1 description | 
        | tag2 | tag2 description |
    And I am logged in

    Scenario: Create Post with null tag should create post
        Given I go to create a post
        When I fill in "Title" with "Question 1"
        And I create the post
        Then I should see "Posted by"
    
    Scenario: Create post with tag should create post and post should be visible on the tag's show page
        Given I go to create a post
        When I fill in "Title" with "Question 1"
        And I select the "tag1" tag
        And I create the post
        Then I should see "tag1"
        And I should see "Posted by"
        When I look at the "tag1" page
        Then I should see "Question 1"

    Scenario: Editing a post should allow a new tag to be chosen and update appropriately
        Given I go to create a post
        And I fill in "Title" with "Question 1"
        And I select the "tag1" tag
        And I create the post
        When I edit the post
        And I select the "tag2" tag
        When I finish the edit
        Then I should see "Posted by"
        And I should not see "tag1"
        And I should see "tag2"
        When I look at the "tag1" page
        Then I should not see "Question 1"
        When I look at the "tag2" page
        Then I should see "Question 1"

    Scenario: Posts with multiple tags should be created
        Given I go to create a post
        And I fill in "Title" with "Question 1"
        And I select the "tag1" tag
        And I select the "tag2" tag
        When I create the post
        Then I should see "tag1"
        And I should see "tag2"
        When I look at the "tag1" page
        Then I should see "Question 1"
        When I look at the "tag2" page
        Then I should see "tag2"

    Scenario: Tags on posts should be link to tag page
        Given I go to create a post
        And I select the "tag1" tag
        When I create the post
        When I click "tag1"
        Then I should see "tag1 description"

    Scenario: Deleting tags should not delete posts
        Given I go to create a post
        And I fill in "Title" with "Question 1"
        And I select the "tag1" tag
        When I create the post
        When I click "tag1"
        And I click "Destroy this tag"
        And I click "Posts"
        Then I should see "Question 1"