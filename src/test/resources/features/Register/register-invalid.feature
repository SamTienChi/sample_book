@regression @registerApi @negative
Feature: Create Client with Invalid data
  Background:
    * url baseUrl
    * path endpoints.clients
    * def RandomData = Java.type('helpers.RandomData')

  Scenario Outline: <id> - <description>
    * def name = RandomData.randomName()
    * def email  = RandomData.randomEmail()

    Given request <payload>
    When method post
    Then status <status>
    And match response == { error: '#(error)'}
    Examples:
      |  read('classpath:data/register-invalid.json') |



