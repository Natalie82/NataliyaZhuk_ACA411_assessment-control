# Exercise for Webdriver experience

  # This comment is an example for https://github.com/Natalie82/NataliyaZhuk_ACA411_assessment-controlgir

  
  @webdriver
  Feature: Exercise for Webdriver experience
    Background:
      Given I navigate "quote"
    @webdriver1
    Scenario: Open URL using site name
      #Given I navigate "quote"
      And I print page details
      And I wait for 3 sec

    @webdriver2
    Scenario: Email field verification
      When I type "www" into email field
      And I click Submit button
      Then Error message "Please enter a valid email address" should be displayed
      And I wait for 3 sec
      Then I clear Email field
      And I wait for 3 sec
      And xpath should has the same text "This field is required."
      When I type correct email "www@gmail.com"
      And The error message should not be displayed
      And I wait for 3 sec

    @webdriver3
    Scenario: Full name validation
      When I click on Name field
      Then I open dialog window
      And I wait for 2 sec
      #Then I type "Natali" as First Name
      #Then I type "E" as Middle Name
      #Then I type "Zh" as Last Name
      #And I wait for 2 sec
      Then I type "Natali" as First Name "E" as Middle Name "Zh" as Last Name and validate the Full name is "Natali E Zh"
      And I wait for 3 sec
      #Then I click save button
      #Then I validate the Full Name is "Natali E Zh"

    @webdriver4
    Scenario: Date picker
      When I validate date picker
      Then I validate the date picker entered the date "02/01/2002"





