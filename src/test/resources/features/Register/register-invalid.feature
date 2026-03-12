Feature: Create Client with Invalid data
  Background:
    * url baseUrl
    * path 'api-clients'
    * def RandomData = Java.type('helpers.RandomData')

  Scenario Outline: <id> - <description>
    * def name = RandomData.randomName()
    * def email  = RandomData.randomEmail()

    Given request <payload>
    When method post
    Then status <status>
    And match response contains { error: '#string' }
    Examples:
      |  read('classpath:data/register-invalid.json') |



