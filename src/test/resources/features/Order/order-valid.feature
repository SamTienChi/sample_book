@regression @orderApi @positive
Feature: Get a single book with valid data
  Background:
    * url baseUrl
    * path endpoints.orders

  Scenario: Submit twice order
        # get books
    * def books = call read('classpath:features/Api/Book/getAllBook.feature')
    * def BookId = books.bookId
    * print 'Book id call:', BookId
    * match BookId == '#number'

       # create Order
    * def create = call read('classpath:features/Api/Order/submitOrder.feature@submitTwice') { bookId: #(BookId), customerName: 'John'}
    * def orderId = create.orderIds
    * print 'Order id call:', orderId
    * match orderId == '#? _.length > 1'
    * match orderId[0] != orderId[1]

    When method get
    Then status 200
    And match response == '#? _.length > 1'
