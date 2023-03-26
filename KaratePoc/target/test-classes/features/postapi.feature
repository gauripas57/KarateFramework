Feature: Create a user using POST

Background:
	* url 'https://gorest.co.in'
	* def reqPayload =
	"""
	{
        "name": "Parveen",
        "email": "parrveen@gmail.com",
        "gender": "female",
        "status": "active"
    }
	"""

	Scenario: Create a user with given data
	Given path '/public/v2/users'
	And request reqPayload
	And header Authorization = 'Bearer ' + tokenID
	When method POST
	Then status 201
	And match $.id == '#present'
	And match $.name == 'Parveen'
	And match $.email == 'parrveen@gmail.com'