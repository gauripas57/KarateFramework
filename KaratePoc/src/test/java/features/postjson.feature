Feature: Create a user using POST

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
	* def reqPayload = read('classpath:src/test/resources/payload/user.json')
	* set reqPayload.email = randomString + "@gmail.com"
	* print reqPayload
	
	Scenario: Create a user with given data
	Given path '/public/v2/users'
	And request reqPayload
	And header Authorization = 'Bearer ' + tokenID
	When method POST
	Then status 201
	And match $.id == '#present'
	And match $.name == 'Parveen'
	And match $.email == reqPayload.email