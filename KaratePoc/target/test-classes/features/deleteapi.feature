Feature: Create,Delete & verify a user using POST,DELETE, GET

Background:
	* url 'https://gorest.co.in'
	* def random_string = 
	"""
	function(s){
	var text = "";
	var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	for(var i=0; i<s; i++)
		text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
		return text
	}
	"""
	* def randomString = random_string(5)
	* def reqPayload =
	"""
	{
        "name": "Parveen",
        "gender": "female",
        "status": "active"
    }
	"""
	* reqPayload.email = randomString + "@gmail.com"
	* print reqPayload

	Scenario: Create,Delete & verify a user with given data
	#1st create a user using post call
	Given path '/public/v2/users'
	And request reqPayload
	And header Authorization = 'Bearer ' + tokenID
	When method POST
	Then status 201
	And match $.id == '#present'	
	
	#fetch the created user
	* def userId = $.id
	* print userId
	
	#Delete the same user
	Given path '/public/v2/users/' + userId
	And header Authorization = 'Bearer ' + tokenID
	When method DELETE
	Then status 204
	
	#get the same user with get call
	Given path '/public/v2/users/' + userId
  When method GET
  Then status 404
  And match $.message == 'Resource not found'
