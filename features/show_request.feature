Feature: view previously submitted request

    As a User
    So that I know I can view a previosuly
    I want to have a details page about

    Background: existing requested translations

        Given I am signed in as a user

        Given the following requests exist:
            | id | user_tarjimly_id | from_language | to_language | document_text | document_format | deadline   | title                  | description | categories    | num_claims | form_type | _status |
            | 1  | 364494           | English       | Arabic      | example text  | text            | 2019-11-09 | Camp Announcment       | information | Refugee, Camp | 1          | N/A       | 0       |
            | 2  | 364494           | English       | Urdu        | example text  | text            | 2019-11-10 | Camp Announcment Flyer | information | Refugee, Camp | 0          | N/A       | 0       |
            | 3  | 364494           | Arabic        | English     | example text  | text            | 2019-12-09 | Visa Application       | information | Visa          | 2          | Visa      | 0       |
            | 4  | 364494           | Urdu          | English     | example text  | text            | 2019-11-01 | Doctor Notes           | information | Child, Doctor | 2          | N/A       | 2       |

        Given the following claims exist:
            | translator_tarjimly_id | _status | submitted_date | translation_text | translation_format | request_id |
            | 364495                 | 0       | Arabic         | example text     | text               | 4          |

    Scenario: visiting request's details page
        Given I am on the "requests" page
        When I click button "View" from the list of request
        Then I should see "Event going on in camp"
        Then I should see "English" and "Arabic"
        Then I should see "Deadline"

    Scenario: return to all requests
        Given I am on the "requests" page
        When I click button "View" from the list of request
        When I select "Back to All Requests"
        Then I should be on the "/requests" path

    Scenario: if request has been deleted will display 404 not found page
        Given I go to the "Show" page
        Then I should see "The page you were looking for doesn't exist."

