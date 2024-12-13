Feature: User Credentials (Requesting and Use)

    Background:

    Given these posts exist:
        | name | 
        | post1   | 
    And I am logged in

    Scenario: User can request user credentials and leave replies with credentials noted
        Given I request certification
        And certification is approved by a moderator
        And I am on post "post1"
        When I leave a reply
        Then I should see "Instructor Response"
    

    Scenario: Moderator can approve user credentials and user should be updated
        Given I am on post "post1"
        And I leave a reply
        Then I should not see "Instructor Response"
        When I request certification
        And certification is approved by a moderator
        And I am on post "post1"
        Then I should see "Instructor Response"



    Scenario: Moderator can deny user credentials and user will not be updated
        Given I am on post "post1"
        And I leave a reply
        Then I should not see "Instructor Response"
        When I request certification
        And certification is denied by a moderator
        And I am on post "post1"
        Then I should not see "Instructor Response"

