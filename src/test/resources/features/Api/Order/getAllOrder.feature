@api
Feature: Get Orders
Background:
  * url baseUrl
  * path endpoints.orders

  Scenario: Get orders
    When method get
    Then status 200


