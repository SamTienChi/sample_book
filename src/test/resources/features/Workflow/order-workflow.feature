Feature: Complete Order Flow

  Scenario: Register → Books → Order → Update → Delete
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
    * def create = call read('classpath:features/Api/Order/submitOrder.feature') { bookId: #(bookId), customerName: 'John'}
    * def orderId = create.orderId
    * print 'Order id call:', orderId
    * match orderId == '#string'

    # get all orders
    * call read('classpath:features/Api/Order/getAllOrder.feature')

    # update order
    * call read('classpath:features/Api/Order/updateOrder.feature') { orderId: #(orderId), customerName: 'Mike' }

    # get an order
    * call read('classpath:features/Api/Order/getAnOrder.feature') { orderId: #(orderId) }

    # delete order
    * call read('classpath:features/Api/Order/deleteOrder.feature') { orderId: #(orderId) }


