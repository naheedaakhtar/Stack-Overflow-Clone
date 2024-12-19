Feature: User Credentials (Requesting and Use)

    Background:

    Given these tags exist:
        | name | description |
        | Instructor Response | Posts with responses by instructors |

    Given these users exist:
        | username | password | email |
        | user1 | password |  user1@email |

    And I am logged in

  

    Scenario: User cannot request when they have a current request
        Given I request certification
        Given I am on my profile
        When I click "Send Credentials"
        Then I should see "Request Already Created"
    
    Scenario: Moderator can deny user credentials and user can request for credentials again
        Given I request certification
        And certification is denied by a moderator
        And I am on my profile
        When I click "Send Credentials"
        Then I should not see "Requests Already Created"


    Scenario: User can request user credentials and leave replies with credentials noted
        Given I request certification
        And "post1" exists
        And certification is approved by a moderator
        And I am on post "post1"
        When I leave a reply
        Then I should see "Instructor Response"
    

    Scenario: Moderator can approve user credentials and relevant posts should be updated
        Given "post1" exists
        And I am on post "post1"
        And I leave a reply
        Then I should not see "Instructor Response"
        When I request certification
        And certification is approved by a moderator
        And I am on post "post1"
        Then I should see "Instructor Response"
    
    Scenario: Certified users's posts should not have the tag unless another certified user sends a response
        Given I request certification
        And certification is approved by a moderator
        When I go to create a post
        And I fill in "Title" with "post2"
        And I create the post
        And I am on post "post2"
        Then I should not see "Instructor Response"


    Scenario: User profile should update to show user has approved credentials
        Given I am on my profile
        Then I should not see "Certified Instructor"
        When I request certification
        And certification is approved by a moderator
        And I am on my profile
        Then I should see "Certified Instructor"



    Scenario: Moderator can deny user credentials and user will not be updated
        Given "post1" exists
        And I am on post "post1"
        And I leave a reply
        Then I should not see "Instructor Response"
        When I request certification
        And certification is denied by a moderator
        And I am on post "post1"
        Then I should not see "Instructor Response"


