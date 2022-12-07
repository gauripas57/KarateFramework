Karate framework
1.Open source tool for API testing (SOAP & REST)
2.It is written in Java & uses BDD syntax
3.It can also do API Mocking, UI testing, performance testing(using Gatling)

Features of framework:
1.Parallel testing , Distributed testing , Multi environment testing
2.Data driven testing -CSV, JSON, YAML files
3.Debugging and Reporting

Prerequisites:
1.Karate requires atleast Java 8
2.IDE - Eclipse , IntelliJ , VScode
3.Dependency Management - Maven, Gradle

1.TestRunner.java class is useful in defining tags like smoke test, regression test to run test as a unit in karate.

Karate-config.js
Karate uses a configuration file named karate-config.js
It can be used to store global variables
configure execution environment , base URLs, Timeouts etc
karate reads this file before execution of every scenario

In this framework GET,POST,PUT,DELETE HTTP method are tested via an automation framework.
script calls to HTTP end-points and assert that the JSON or XML responses are as expected. Karate is implemented in Java but test-scripts are written in Gherkin since Karate was originally an extension of the Cucumber framework.