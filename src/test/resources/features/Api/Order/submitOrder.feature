@api
Feature: Create Order
  Background:
    * url baseUrl
    * path endpoints.orders

  @createSuccess
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


  @submitTwice
  Scenario: Submit twice order
    * def orderIds = []
    Given request
    """
      {
        bookId: #(bookId),
        customerName: #(customerName)
      }
    """
    When method post
    Then status 201
    And eval orderIds.push(response.orderId)

    Given path 'orders'
    And request
    """
      {
        bookId: #(bookId),
        customerName: #(customerName)
      }
    """
    When method post
    Then status 201
    And eval orderIds.push(response.orderId)
    And print 'OrderID submit: ', orderIds
    * karate.set('orderIds', orderIds)
