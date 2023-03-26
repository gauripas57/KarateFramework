Feature: Update a user using PUT

Background:
	* url 'https://gorest.co.in'
	* def reqPayload =
	"""
	{
        "status": "active",
        "name" : "Danu"
    }
	"""

	Scenario: Update a user with given data
	Given path '/public/v2/users/467921'
	And request reqPayload
	And header Authorization = 'Bearer ' + tokenID
	When method PUT
	Then status 200
	And match $.id == '#present'
	And match $.name == 'Danu'
	And match $.email == 'wEznu@gmail.com'