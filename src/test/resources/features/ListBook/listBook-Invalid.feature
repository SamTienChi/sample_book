@regression @bookApi @negative
Feature: Get list book with invalid data
  Background:
    * url baseUrl
    * path endpoints.books

  @setup
  Scenario: Generate test data
    * def invalidData = read('classpath:data/listbook-invalid.json')

  Scenario Outline: <id> - <description>
    Given params <payload>
    When method get
    Then status <status>
    And match response == { error: '#(error)'}
    Examples:
      | karate.setup().invalidData |