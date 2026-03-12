Feature: Create Client with valid data
  Background:
    * url baseUrl
    * path 'api-clients'
    * def RandomData = Java.type('helpers.RandomData')

  Scenario: TC1 - Register new account succefully
    * def name = RandomData.randomName()
    * def email  = RandomData.randomEmail()
    Given request
      """
      {
        "clientName": "#(name)",
        "clientEmail": "#(email)"
      }
      """
    When method post
    Then status 201
    And match response contains { accessToken: '#string' }


  Scenario: TC2 - Register new account succefully with difference name
    * def name = RandomData.randomName()
    * def email  = RandomData.randomEmail()
    Given request
      """
      {
        "clientName": "#(name)",
        "clientEmail": "#(email)"
      }
      """
    When method post
    Then status 201
    And match response contains { accessToken: '#string' }


  Scenario: TC3 - Register new account succefully with subdomain email
    * def name = RandomData.randomName()
    * def subEmail = RandomData.randomSubEmail()
    Given request
      """
      {
        "clientName": "#(name)",
        "clientEmail": "#(subEmail)"
      }
      """
    When method post
    Then status 201
    And match response contains { accessToken: '#string' }


  Scenario: TC4 - Register new account succefully with contain space
    * def name = RandomData.randomName()
    * def email  = RandomData.randomEmail()
    Given request
      """
       {
        "clientName": "#(name)",
        "clientEmail": "#(email)"
      }
      """
    When method post
    Then status 201
    And match response contains { accessToken: '#string' }