Feature: Create Client with valid data
  Background:
    * url baseUrl
    * path 'api-clients'
    * def RandomData = Java.type('helpers.RandomData')

  Scenario Outline: <id> - <description>
    * def name = RandomData.randomName();
    * def email = RandomData.randomEmail();
    * def subEmail = RandomData.randomSubEmail();

    Given request <payload>
    When method post
    Then status <status>
    And match response contains { accessToken: '#string' }
    Examples:
      | read('classpath:data/register-valid.json') |