Feature: Set authorization header

  Scenario:
    * def auth = call read('classpath:features/Api/Auth/register-client.feature')
    * def accessToken = auth.accessToken