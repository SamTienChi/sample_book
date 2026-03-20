@api
Feature: Get books
Background:
  * url baseUrl
  * path endpoints.books

  Scenario: Get available book
    When method get
    Then status 200

    * def books = karate.filter(response, function(x){ return x.available == true })
    * assert books.length > 0
    * def bookId = books[0].id
    * def result = { bookId: #(bookId) }
    * print 'Selected bookId:', bookId