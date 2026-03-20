@api
Feature: Update order
Background:
  * url baseUrl
  * path endpoints.orders

  Scenario:  Update customer name
    Given path orderId
    And request
    """
    {
      customerName: #(customerName)
    }
    """
    When method patch
    Then status 204

