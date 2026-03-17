Feature: Create Order
  Background:
    * url baseUrl
    * path 'orders'

  Scenario: Create new order
    Given request
    """
      {
        bookId: #(bookId),
        customerName: #(customerName)
      }
    """
    When method post
    Then status 201
    * def orderId = response.orderId
