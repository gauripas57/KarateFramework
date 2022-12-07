Feature: POST API Demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

  # Simple Post request
  Scenario: POST Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name":"Raghav","job":"teacher"}
    When method post
    Then status 201
    And print response

  # Post request with Background
  Scenario: POST Demo 2
    Given path '/users'
    And request {"name":"Meena","job":"doctor"}
    When method post
    Then status 201
    And print response

  # Post request with assertions
  Scenario: POST Demo 3
    Given path '/users'
    And request {"name":"Raghav","job":"teacher"}
    When method post
    Then status 201
    And match response == {"name":"Raghav","job":"#string","id":"#string","createdAt":"#ignore"}

  # Post with read response from file
  Scenario: POST Demo 4
    Given path '/users'
    And request {"name":"Raghav","job":"teacher"}
    When method post
    Then status 201
    And match response == expectedOutput
    And print response

  # Post with given request from file & change parameters
  Scenario: POST Demo 5
    Given path '/users'
   # And def projectPath = karate.properties['user.dir']
   # And print projectPath
   # And def filePath = projectPath + 'src/tests/java/data/request1.json'
   # And print filePath
    And def reqBody = read("request1.json")
    And set reqBody.job = 'engineer'
    And request reqBody
    When method post
    Then status 201
    And print response
