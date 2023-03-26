Feature: Get API headers

Scenario: Pass user request with headers
Given header Content-Type = 'text/xml;charset=ISO-8859-1'
And header Accept-Encoding = 'gzip,deflate'
And header Connection = 'Keep-Alive'
And header Expect = '100-continue'
And header User-Agent = 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'
And header Authorization = 'Bearer' + tokenID
When url baseUrl+'/public/v2/users'
And path '458212'
When method GET
Then status 200
* print response

Scenario: Pass user request with headers with variable
* def request_headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Connection: 'Keep-Alive', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'}
Given headers request_headers
And header Authorization = 'Bearer' + tokenID
When url baseUrl+'/public/v2/users'
And path '458212'
When method GET
Then status 200
* print response

Scenario: Pass user request with headers with configure
* configure headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Connection: 'Keep-Alive', User-Agent: 'Mozilla/4.0(compatible;IE;GACv7\. 1\. 5192\. 22378)'}
Given header Authorization = 'Bearer' + tokenID
When url baseUrl+'/public/v2/users'
And path '458212'
When method GET
Then status 200
* print response