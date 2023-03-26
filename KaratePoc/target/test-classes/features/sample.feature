Feature: print hello world feature

  Scenario: Hello World Scenario
    * print 'hello world'
    * print 'sample feature print statement'

  Scenario: Declare & print variables
  
  * def balance = 200
  * def fee = 20
  * def tax = 10
  * print 'Total amount -> ' + (balance+fee+tax)
  
   Scenario: Calculator Scenario
  
  * def days = 20
  * def work = 50
  * print 'Total workdone -> ' + (days * work)