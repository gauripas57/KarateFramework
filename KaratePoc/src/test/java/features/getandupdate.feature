Feature: Create a user using POST and update using PUT

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
        "name": "Tommy",
        "gender": "female",
        "status": "active"
    }
	"""
	* set reqPayload.email = randomString + "@gmail.com"
	* print reqPayload

	Scenario: Create a user with given data & update its details
	#1st call: create a user with post call
	Given path '/public/v2/users'
	And request reqPayload
	And header Authorization = 'Bearer ' + tokenID
	When method POST
	Then status 201
	And match $.id == '#present'
	
# fetch the user id from post call response
* def userId = $.id
* print userId


	* def reqPutPayload =
	"""
	{
 
        "gender": "male",
        "status": "inactive"
    }
	"""
#2nd call :put call to update the user
	Given path '/public/v2/users/'+ userId
	And request reqPutPayload
	And header Authorization = 'Bearer ' + tokenID
	When method PUT
	Then status 200
	And match $.id == '#present'
	And match $.id == userId
	And match $.name == 'Tommy'
	And match $.email == reqPayload.email
	
