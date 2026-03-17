Feature: Get an Order
Background:
  * url baseUrl
  * path 'orders'

Scenario:Get a detail order
  And path orderId
  When method Get
  Then status 200