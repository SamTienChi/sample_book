Feature: Update order
Background:
  * url baseUrl
  Scenario:  Update customer name
    Given path 'orders', orderId
    And request
    """
    {
      customerName: #(customerName)
    }
    """
    When method patch
    Then status 204

