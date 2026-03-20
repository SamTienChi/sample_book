@regression @bookDetailApi @negative
Feature: Get a single book with valid data
Background:
  * url baseUrl
  * path endpoints.books

  @setup
  Scenario:
    * def invalidData = read('classpath:data/detailBook-invalid.json')

  Scenario Outline: <id> - <description>
    Given path payload.id
    When method GET
    Then status <status>
    And match response == { error: '#(error)'}
    Examples:
      | karate.setup().invalidData |
