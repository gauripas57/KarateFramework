Feature: Get API feature

Scenario: get user details
Given url 'https://reqres.in/api/users'
And path '3'
When method GET
Then status 200
* print response
* def jsonResponse = response
* def actname =  jsonResponse.data.last_name
* def actid =  jsonResponse.data.id
* def actemail =  jsonResponse.data.email
* print actname
* match actname == "Wong"
* match actid == 3
* match actemail == "emma.wong@reqres.in"


Scenario: get user details for user 1
Given url 'https://gorest.co.in/public/v2/users/1'
And path '1'
When method GET
Then status 404
* print response
