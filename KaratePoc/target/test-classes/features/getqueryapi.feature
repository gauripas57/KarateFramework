Feature: Get API with Query parameters

Scenario: Get all active users
* def query = {status:'active',gender:'male'}
* print tokenID
Given header Authorization = 'Bearer' + tokenID
Given url baseUrl+'/public/v2/users'
And params query
When method GET
Then status 200
* print response

Scenario: Get count of active users
* def query = {status:'active'}
* print tokenID
Given header Authorization = 'Bearer' + tokenID
Given url baseUrl+'/public/v2/users'
And params query
When method GET
Then status 200
* def jsonRes = response
* print jsonRes
* def userCount = jsonRes.length
* print userCount
* match userCount == 10