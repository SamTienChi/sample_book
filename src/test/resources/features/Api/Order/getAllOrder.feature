Feature: Get Orders
Background:
  * url baseUrl
  * path 'orders'

  Scenario: Get orders
    When method get
    Then status 200


