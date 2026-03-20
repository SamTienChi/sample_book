@api
Feature: Get an Order
Background:
  * url baseUrl
  * path endpoints.orders

  @success
  Scenario: Get a detail order
  And path orderId
  When method Get
  Then status 200

  @notfound
  Scenario: Get a deleted order
  And path orderId
  When method Get
  Then status 404