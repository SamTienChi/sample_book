Feature: Get list book with valid params
Background:
  * url baseUrl
  * path 'books'
  * def bookSchema = read('classpath:Schema/book-schema.json')

  @setup
  Scenario: Generate test data
    * def validData = read('classpath:data/listbook-valid.json')

  Scenario Outline: <id> - <description>
    Given params payload
    When method get
    Then status <status>
    And match each response == bookSchema
    * assert payload.limit ? response.length <= payload.limit : true
    * if (payload.type) karate.match("each response[*].type == payload.type")
    Examples:
    | karate.setup().validData |