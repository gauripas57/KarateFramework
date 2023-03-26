Feature: json feature testing

Scenario: Read json

	* def jsonObject =
	"""
	[
	{
	"name" : "Tom",
	"city" : "Pune",
	"age"  : 25
	},
		{
	"name" : "Peter",
	"city" : "LA",
	"age"  : 35
	}
	]
	"""
	* print jsonObject
	* print jsonObject[0].name
	* print jsonObject[1].name + " " + jsonObject[1].city + " " +jsonObject[1].age 

Scenario: Complex json
* def jsonObject =
	"""
	{
	"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}
}
	
	"""
	* print jsonObject
	* print jsonObject.menu.value
	* print jsonObject.menu.popup
	* print jsonObject.menu.popup.menuitem
	* print jsonObject.menu.popup.menuitem[2].value
	* print jsonObject.menu.popup.menuitem[2].onclick
