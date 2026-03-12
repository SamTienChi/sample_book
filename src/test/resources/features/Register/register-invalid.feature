Feature: Create Client with Invalid data
  Background:
    * url baseUrl
    * path 'api-clients'
    * def RandomData = Java.type('helpers.RandomData')
    * def name = RandomData.randomName()
    * def email  = RandomData.randomEmail()

  Scenario: TC5 - Verify API when register missing client name
    Given request
    """
    {
      "clientEmail": "#(email)"
    }
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

  Scenario: TC6 - Verify API when register with empty client name
    Given request
    """
    {
      "clientName": " ",
      "clientEmail": "#(email)"
    }
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

  @ignore
  Scenario: TC7 - Verify API when register duplicate client name
    Given request
    """
    {
      "clientName": "TestAPi3",
      "clientEmail": "#(email)"
    }
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

  Scenario: TC8 - Verify API when register client name with number.
    Given request
    """
    {
      "clientName": 1234,
      "clientEmail": "#(email)"
    }
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

  Scenario: TC09 - Verify API when register missing client email
    Given request
    """
    {
      "clientName": "#(name)"
    }
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

  Scenario: TC10 - Verify API when register with empty client email
    Given request
    """
    {
      "clientName": "#(name)",
      "clientEmail": " "
    }
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

  Scenario: TC11 - Register with existed client email
    Given request
    """
    {
      "clientName": "#(name)",
      "clientEmail": "testAPI3@gmail.com"
    }
    """
    When method post
    Then status 409
    And match response contains { error: '#string' }

  Scenario: TC12 - Register with invalid format email
    Given request
    """
    {
      "clientName": "#(name)",
      "clientEmail": "Thisistestgmail,com.vn"
    }
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

  Scenario: TC13 - Register without field
    Given request
    """
    {}
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

  Scenario: TC14 - register with invalid format json
    Given request
    """
    {
      "client": "#(name)",
      "Email": "#(email)",
      "Name": "#(name)"
    }
    """
    When method post
    Then status 400
    And match response contains { error: '#string' }

