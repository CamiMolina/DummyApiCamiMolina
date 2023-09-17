Feature: Employees endpoint
  Background: Employees endpoints should allow to get, create, update and delete employees

    @getAll
    Scenario: /employees should return all the employees
      Given I perform a GET to the employees endpoint
      Then I verify status code 200 is returned
      And I verify that the body does not have size 0

    @post
    Scenario: /create should create an employee
      Given I perform a POST to the create endpoint with the following data
        | Diego | 3500 | 26 |
      Then I verify status code 200 is returned
      And I verify that the body does not have size 0
      And I verify the following data in the body response
        | Diego | 3500 | 26 |


    @delete
    Scenario: /delete should delete an employee
      Given I perform a DELETE request to delete an employee with ID "5"
      Then I verify status code 200 is returned
      And I verify that the body contains the message "Successfully! Record has been deleted"

    @getId
    Scenario: /employee/id Have to give us an employee by id
      Given I perform a GET request to get an employee's id "7"
      Then I verify status code 200 is returned
      And I verify all body
        | 7 | Herrod Chandler | 137500 | 59 |
      And I verify that the body contains the message "Successfully! Record has been fetched."

    @put
    Scenario: /update should update an employee
      Given I perform a PUT request to update an employee
        | 1 | Fulano | 123456 | 25 |
      Then I verify status code 200 is returned
      And I verify the following data in the body response
        | Fulano | 123456 | 25 |
      And I verify that the body contains the message "Successfully! Record has been updated."

    @failedPost
    Scenario: /create should not create an employee without all information
      Given I perform a POST to the create endpoint with the following data
        |  | 3500 | 26 |
      Then I verify status code 400 is returned
      And I verify that the body contains the message "Failed! Record has not been created."

