@regression @orderSuccessFlow
Feature: Complete Create Order Flow

  Scenario: Create order successfully
    # register client get token
    * def auth = callonce read('classpath:features/Api/Auth/auth-header.feature')
    * def token = 'Bearer ' + auth.accessToken
    * configure headers = { Authorization: #(token) }

    # get books
    * def books = call read('classpath:features/Api/Book/getAllBook.feature')
    * def bookId = books.bookId
    * print 'Book id call:', bookId
    * match bookId == '#number'

    # create order
    * def create = call read('classpath:features/Api/Order/submitOrder.feature@createSuccess') { bookId: #(bookId), customerName: 'John'}
    * def orderId = create.orderId
    * print 'Order id call:', orderId
    * match orderId == '#string'

    # Get an order
    * call read('classpath:features/Api/Order/getAnOrder.feature@success') { orderId: #(orderId) }

  @successtwice
  Scenario: Create order successfully (Order twice)
    * def auth = callonce read('classpath:features/Api/Auth/auth-header.feature')
    * def token = 'Bearer ' + auth.accessToken
    * configure headers = { Authorization: #(token) }

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

    # Get all order
    * def getOrders = call read('classpath:features/Api/Order/getAllOrder.feature')
    * print 'Orders: ', getOrders.response


