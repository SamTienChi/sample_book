Feature: Get a single book with valid data
  Background:
    * url baseUrl
    * path 'books'
    * def detailBookSchema = read('classpath:Schema/detailBook-schema.json')

  @setup
  Scenario: Generate test data
      * def validData = read('classpath:data/detailbook-valid.json')

  Scenario Outline: <id> - <description>
    Given path payload.id
    When method GET
    Then status <status>
    And match response contains detailBookSchema
    And match response.id == parseInt(payload.id)
    Examples:
    | karate.setup().validData |
