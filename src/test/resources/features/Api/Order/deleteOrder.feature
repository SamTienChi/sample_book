@api
Feature: Delete Order
Background:
  * url baseUrl
  * path endpoints.orders

  Scenario: Delete Order
    And path orderId
    When method delete
    Then status 204
