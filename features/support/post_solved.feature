Feature: Tag and Post Associations (creating Tags and Tagging Posts)

    Background:

   Given these tags exist:
        | name | description |
        | Post Solved | Posts that have been tagged as solved |

    Given these users exist:
        | username | password | email |
        | user1 | password |  user1@email |

    And I am logged in

    Scenario: Posts/Replies cannot be marked as solved by people other than the creator of the post
        Given "post1" exists
        And I am logged in as user1
        And I am on post "post1"
        And I leave a reply
        When I am on post "post1"
        Then I should not see "Mark Post as Solved"
        And I should not see "Mark Reply as Solution"

    Scenario: Posts should be marked as solved when a reply is marked as a Solution
        Given "post1" exists
        And I leave a reply
        When I click "Mark Reply as Solution"
        Then I should see "Post Solved"
        And I should see "Post Solution"

    Scenario: Posts should lose their solved tag if the only reply solution is removed as a solution
        Given "post1" exists
        And I leave a reply
        And I click "Mark Reply as Solution"
        When I click "Remove Reply as Solution"
        Then I should not see "Post Solved"
        And I should not see "Post Solution"

    Scenario: Posts with multiple replies marked as solution does not lose its solution tag
        Given "post1" exists
        And I leave a reply
        And I click "Mark Reply as Solution"
        And I leave a reply
        And I click "Mark Reply as Solution"
        When I click the first "Remove Reply as Solution"
        Then I should see "Post Solved"

    Scenario: Posts with a reply marked as a solution should not lose its solution tag when trying to just unmark the post
        Given "post1" exists
        And I leave a reply
        And I click "Mark Reply as Solution"
        When I click "Remove Post as Solved"
        Then I should see "Post Solved"

