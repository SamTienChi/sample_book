@regression @registerApi @positive
Feature: Create Client with valid data
  Background:
    Given url baseUrl
    * path endpoints.clients
    * def RandomData = Java.type('helpers.RandomData')

  @setup
  Scenario: Generate test data
    * def data = call read('classpath:utils/register-data.js');
    * def normalCases = data.normalCases;
    * def sameNameCases = data.sameNameCases;

  Scenario Outline: <id> - <description>
    * def name = RandomData.randomName();
    * def email = RandomData.randomEmail();
    * def subEmail = RandomData.randomSubEmail();

    Given request <payload>
    When method post
    Then status <status>
    And match response contains { accessToken: '#string' }
    Examples:
      | karate.setup().normalCases |

  Scenario Outline: <id> - <description>
    * def email = RandomData.randomEmail();

                # first register
    Given request <payload>
    When method post
    Then status <status>
    And path 'api-clients'
    * print 'response', response

        # second register
    * def email = RandomData.randomEmail();
    Given request <payload>
    When method post
    Then status <status>
    And  match response contains { accessToken: '#string' }

    Examples:
      | karate.setup().sameNameCases |

