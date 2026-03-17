Feature: Register API client
  Background:
    * url baseUrl
    * path 'api-clients'
    * def RandomData = Java.type('helpers.RandomData')


    Scenario: Register new Client
      * def name = RandomData.randomName();
      * def email = RandomData.randomEmail();

      Given request
      """
        {
         "clientName": "#(name)",
         "clientEmail": "#(email)"
        }
      """
      When method POST
      Then status 201
      * def accessToken = response.accessToken


