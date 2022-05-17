#Exercise for Quote Application
  #Epic: https://jira.portnov.com/browse/ACA-659
  #Author: Nataliya Zhuk
  @quote
  Feature: Quote Page Scenarios
    Background:
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"


    @quote1
      # Test Case 1: Verify that Application Section has Location/Date/Time for
          # Desktop and Tablet layouts but those disappear in Phone layouts

    Scenario: Responsive UI
      # Resize to desktop size
      When I resize window to 1349 and 704
      Then I wait for 3 sec
      Then element with xpath "//b[@id='location']" should be displayed
      And element with xpath "//b[@id='currentDate']" should be displayed
      And element with xpath "//b[@id='currentTime']" should be displayed
      # Resize to iPad size
      When  I resize window to 800 and 1024
      Then I wait for 3 sec
      Then element with xpath "//b[@id='location']" should be displayed
      And element with xpath "//b[@id='currentDate']" should be displayed
      And element with xpath "//b[@id='currentTime']" should be displayed
      # Resize to mobile size
      When  I resize window to 390 and 844
      Then I wait for 2 sec
      But element with xpath "//b[@id='location']" should not be displayed
      And element with xpath "//b[@id='currentDate']" should not be displayed
      And element with xpath "//b[@id='currentTime']" should not be displayed


    @quote2
      # Test Case 2: Fill out and validate “Username” field.
          # Validate minimal “Username” field length requirement as 2 characters

     Scenario: Validate minimal "Username" field length requirement as 2 characters
       When I type "Q" into element with xpath "//input[@name='username']"
       And I wait for 3 sec
       Then I click on element with xpath "//button[@id='formSubmit']"
       Then element with xpath "//label[@id='username-error']" should be displayed
       Then element with xpath "//label[@id='username-error']" should have text as "Please enter at least 2 characters."
       And I wait for 3 sec
       Then I clear element with xpath "//input[@name='username']"
       And I wait for 3 sec
       When I type "AA" into element with xpath "//input[@name='username']"
       And I click on element with xpath "//button[@id='formSubmit']"
       But element with xpath "//label[@id='username-error']" should not be displayed

      @quote3
      # Test Case 3: Validate "Email" field behavior
      # Validate that email field accepts only valid email addresses.

      Scenario: Email format validation
        When I type "www" into element with xpath "//input[@name='email']"
        And I click on element with xpath "//button[@id='formSubmit']"
        Then element with xpath "//label[@id='email-error']" should be displayed
        And element with xpath "//label[@id='email-error']" should contain text "valid email address"
        Then I clear element with xpath "//input[@name='email']"
        And element with xpath "//label[@class='error']" should contain text "This field is required."
        When I type "www@gmail.com" into element with xpath "//input[@name='email']"
        Then element with xpath "//label[@id='email-error']" should not be displayed

      @quote4
      #Test Case 4: Fill out and validate “Password” set of fields.
      # Validate that Confirm Password is disabled if Password field is empty.

      Scenario: Password validation and Confirm password disabled verification
        When I type "w" into element with xpath "//input[@id='password']"
        And I click on element with xpath "//input[@name='email']"
        Then element with xpath "//label[@id='password-error']" should be displayed
        And element with xpath "//label[@id='password-error']" should contain text "5 characters"
        When I type "orld" into element with xpath "//input[@id='password']"
        And I click on element with xpath "//input[@name='email']"
        Then element with xpath "//label[@id='password-error']" should not be displayed
       And I wait for 5 sec
        And I clear element with xpath "//input[@id='password']"
        When I click on element with xpath "//input[@id='confirmPassword']"
        Then element with xpath "//input[@id='confirmPassword']" should be disabled
        When I type "word" into element with xpath "//input[@id='password']"
        Then element with xpath "//input[@id='confirmPassword']" should be enabled
        And I clear element with xpath "//input[@id='password']"
        Then element with xpath "//input[@id='confirmPassword']" should be disabled

        @quote5
      # Test Case 5:Validate “Name” field behavior Modal dialog
      # Verification that upon clicking inside of Name field popup dialog appears.
      # Name concatenation: verify that after putting First Name, Middle Name, Last Name,
      # it concatenates it correctly and puts the value in the Name field

      Scenario: Name validation
        When I click on element with xpath "//input[@id='name']"
        Then element with xpath "//div[@aria-describedby='nameDialog']" should be displayed
        When I type "Nataliya" into element with xpath "//input[@id='firstName']"
        And I type "Zh" into element with xpath "//input[@id='lastName']"
        And I click on element with xpath "//span[contains(text(),'Save')]"
        And I wait for 3 sec
        Then element with xpath "//input[@id='name']" should have attribute "value" as "Nataliya Zh"

        @quote6
        # Test Case 6: Validate that Accepting Privacy Policy is required to submit the form,
        # then check the field

     Scenario: Accepting Privacy Policy required
          When I click on element with xpath "//input[@id='name']"
          Then element with xpath "//div[@aria-describedby='nameDialog']" should be displayed
          When I type "Nataliya" into element with xpath "//input[@id='firstName']"
          And I type "Zhuk" into element with xpath "//input[@id='lastName']"
          And I click on element with xpath "//span[contains(text(),'Save')]"
          And I wait for 1 sec
          Then element with xpath "//input[@id='name']" should have attribute "value" as "Nataliya Zhuk"
          And I type "Nata" into element with xpath "//input[@name='username']"
          And I type "www@gmail.com" into element with xpath "//input[@name='email']"
          And I type "world" into element with xpath "//input[@id='password']"
          And I type "world" into element with xpath "//input[@id='confirmPassword']"
          Then I click on element with xpath "//button[@id='formSubmit']"
          Then element with xpath "//label[@id='agreedToPrivacyPolicy-error']" should contain text "- Must check!"
          And I wait for 3 sec
          Then I click on element with xpath "//input[@ng-model='formData.agreedToPrivacyPolicy']"
          And I click on element with xpath "//button[@id='formSubmit']"

       @quote7
      # Test Case 7 (optional):
      #Try entering the following non-required fields in the order:
      #• Phone Number
      #• Country of Origin
      #• Gender
      #• Allowed to Contact?
      #• Address
      #• Car Make
      #• 3rd party agreement acceptance
      #• Date
     Scenario: Optional fields
         When I click on element with xpath "//select[@name='countryOfOrigin']/option[contains(text(),'Ukraine')]"
         And I type "2500 Walton Street, Chicago, IL" into element with xpath "//textarea[@id='address']"
         And element with xpath "//b[@id='currentDate']" should be present
         And I type "773773773" into element with xpath "//input[@name='phone']"
         When I click on element with xpath "//input[@id='dateOfBirth']"
         Then element with xpath "//div[@id='ui-datepicker-div']" should be displayed
         Then I click on element with xpath "//option[contains(text(),'Feb')]"
         And I click on element with xpath "//option[contains(text(),'2002')]"
         And I click on element with xpath "//td[@data-handler='selectDay']/a[text()='1']"
         And I click on element with xpath "//input[@value='female']"
         And I click on element with xpath "//select[@name='carMake']/option[@value='Other']"
         And I click on element with xpath "//button[@id='thirdPartyButton']"
         And I accept alert
         And I wait for 3 sec
         And I click on element with xpath "//input[@ng-model='formData.allowedToContact']"
         And I wait for 3 sec

         @quote8
         # Test Case 8: Submit the form and verify the data.
         # Validate that after form submission entered fields values are present on the page.
         # Validate that password is not displayed on the page

         Scenario: Submit form
         # Required fields
           Given I open url "https://skryabin.com/market/quote.html"
           Then I should see page title as "Get a Quote"
           When I click on element with xpath "//input[@id='name']"
           Then element with xpath "//div[@aria-describedby='nameDialog']" should be displayed
           When I type "Nataliya" into element with xpath "//input[@id='firstName']"
           And I type "Zhuk" into element with xpath "//input[@id='lastName']"
           And I click on element with xpath "//span[contains(text(),'Save')]"
           And I wait for 1 sec
           Then element with xpath "//input[@id='name']" should have attribute "value" as "Nataliya Zhuk"
           And I type "Nata" into element with xpath "//input[@name='username']"
           And I type "www@gmail.com" into element with xpath "//input[@name='email']"
           And I type "world" into element with xpath "//input[@id='password']"
           And I type "world" into element with xpath "//input[@id='confirmPassword']"
           And I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
     # Optional fields
           And I click on element with xpath "//select[@name='countryOfOrigin']/option[contains(text(),'Ukraine')]"
           And I type "2500 Walton Street, Chicago, IL" into element with xpath "//textarea[@id='address']"
           And I type "773773773" into element with xpath "//input[@name='phone']"
           When I click on element with xpath "//input[@id='dateOfBirth']"
           Then element with xpath "//div[@id='ui-datepicker-div']" should be displayed
           Then I click on element with xpath "//option[contains(text(),'Feb')]"
           And I click on element with xpath "//option[contains(text(),'2002')]"
           And I click on element with xpath "//td[@data-handler='selectDay']/a[text()='1']"
           And I click on element with xpath "//input[@value='female']"
           And I click on element with xpath "//select[@name='carMake']/option[@value='Other']"
           When I click on element with xpath "//button[@id='formSubmit']"
           Then element with xpath "//legend[@class='applicationResult']" should contain text "Submitted Application"
           And I wait for 3 sec
           And element with xpath "//b[@name='firstName']" should contain text "Nataliya"
           And element with xpath "//b[@name='lastName']" should contain text "Zhuk"
           And element with xpath "//b[@name='name']" should contain text "Nataliya Zhuk"
           And element with xpath "//b[@name='username']" should contain text "Nata"
           And element with xpath "//b[@name='email']" should contain text "www@gmail.com"
           And element with xpath "//b[@name='password']" should contain text "[entered]"
           And element with xpath "//b[@name='countryOfOrigin']" should contain text "Ukraine"
           And element with xpath "//b[@name='address']" should contain text "2500 Walton Street, Chicago, IL"
           And element with xpath "//b[@name='phone']" should contain text "773773773"
           And element with xpath "//b[@name='dateOfBirth']" should contain text "02/01/2002"
           And element with xpath "//b[@name='gender']" should contain text "female"
           And element with xpath "//b[@name='carMake']" should contain text "Other"
           And element with xpath "//b[@name='agreedToPrivacyPolicy']" should contain text "true"
           And element with xpath "//b[@name='location']" should contain text "Los Altos, CA 94022"
           And element with xpath "//b[@name='currentDate']" should be present
           And element with xpath "//b[@name='currentTime']" should be present
           And I wait for 2 sec
           And element with xpath "//button[@id='return']" should be present
           When I click on element with xpath "//button[@id='return']"
           Then I should see page title as "Get a Quote"
           And I wait for 2 sec



