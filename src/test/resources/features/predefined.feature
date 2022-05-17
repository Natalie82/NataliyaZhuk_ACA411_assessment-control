# Automate search for the following search engines:
 # Task: https://jira.portnov.com/browse/ACA-647
# Author: Nataliya Zhuk

@predefined
Feature: Smoke steps

  @predefined1
  Scenario: Predefined steps for Google
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    Then element with xpath "//input[@name='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"

  @predefined2
  Scenario: Predefined steps for Gibiru
    Given I open url "https://gibiru.com"
    Then I should see page title as "Gibiru – Protecting your privacy since 2009"
    Then element with xpath "//input[@id='q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@id='q']"
    Then I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//*[@id='web-results']" to be present
    And I wait for 3 sec
    Then element with xpath "//*[@id='web-results']" should contain text "Behavior Driven Development"

  @predefined3
  Scenario: Predefined steps for DuckDuckGo
    Given I open url "https://duckduckgo.com/"
    Then I should see page title as "DuckDuckGo — Privacy, simplified."
    Then I should see page title contains "DuckDuckGo"
    Then element with xpath "//input[@id='search_form_input_homepage']" should be present
    When I type "Duck" into element with xpath "//input[@id='search_form_input_homepage']"
    Then I click on element with xpath "//input[@id='search_button_homepage']"
    Then I wait for element with xpath "//form[@id='search_form']" to be present
    And I wait for 3 sec
    Then element with xpath "//article[@id='r1-1']" should contain text "Duck"
    
  @predefined4
   Scenario: Predefined steps for Swisscows
     Given I open url "https://swisscows.com/"
     Then I should see page title as "Swisscows the alternative, data secure search engine."
     Then I should see page title contains "Swisscows "
     Then element with xpath "//input[@class='input-search']" should be present
     When I type "Illinois" into element with xpath "//input[@class='input-search']"
     Then I click on element with xpath "//button[@class='search-submit']"
     Then I wait for element with xpath "//input[@name='query'][@value='Illinois']" to be present
     And I wait for 3 sec
     Then element with xpath "//div[@id='viewport']" should contain text "Illinois"

   @predefined5
   Scenario: Predefined steps for Search Encrypt
     Given I open url "https://www.searchencrypt.com/home"
     Then I should see page title as "Search Encrypt | Home"
     Then I should see page title contains "Search"
     Then element with xpath "//input[@type='text']" should be present
     When I type "Behavior Driven Development" into element with xpath "//input[@type='text']"
     Then I click on element with xpath "//button[@type='submit']"
     Then I wait for element with xpath "//*[@class='serp__results container']" to be present
     Then element with xpath "//*[@class='serp__results container']" should contain text "Behavior Driven Development"

   @predefined6
   Scenario: Predefined steps for Wiki
     Given I open url "https://www.wiki.com/"
     Then I should see page title as "Wiki.com"
     Then I should see page title contains "Wiki"
     Then element with xpath "//input[@name='q']" should be present
     When I type "Behavior Driven Development" into element with xpath "//input[@name='q']"
     Then I click on element with xpath "//input[@name='btnG']"
     Then I should see page title contains "Form is not secure"
       Then I wait for 3 sec
     Then I click on element with xpath "//button[@id='proceed-button']"
       Then I wait for 3 sec
     Then I wait for element with xpath "//input[@type='text']" to be present
     Then I switch to iframe with xpath "//iframe[@name='googleSearchFrame']"
     Then I wait for element with xpath "//*[@id='cse']" to be present
     Then element with xpath "//*[@id='cse']" should contain text "Behavior Driven Development"

     @predefined7
     Scenario: Predefined steps for Startpage
       Given I open url "https://www.startpage.com/"
       Then I should see page title as "Startpage - Private Search Engine. No Tracking. No Search History."
       Then I should see page title contains "Startpage"
       Then element with xpath "//input[@id='q']" should be present
       When I type "Behavior Driven Development" into element with xpath "//input[@id='q']"
       Then I click on element with xpath "//button[@class='search-form-home__button-desktop']"
       Then I wait for element with xpath "//div[@class='show-results']" to be present
       Then element with xpath "//div[@class='show-results']" should contain text "Behavior Driven Development"

  @predefined8
  Scenario: Predefined steps for Yandex
    Given I open url "https://yandex.com/"
    Then I should see page title as "Yandex"
    Then I should see page title contains "Yandex"
    Then element with xpath "//input[@id='text']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@id='text']"
    Then I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//ul[@id='search-result']" to be present
    Then element with xpath "//ul[@id='search-result']" should contain text "Behavior Driven Development"

    @predefined9
    Scenario: Predefined steps for Ecosia
      Given I open url "https://www.ecosia.org/"
      Then I should see page title as "Ecosia - the search engine that plants trees"
      Then I should see page title contains "Ecosia"
      Then element with xpath "//input[@placeholder='Search the web to plant trees...']" should be present
      When I type "Behavior Driven Development" into element with xpath "//input[@placeholder='Search the web to plant trees...']"
      Then I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//div[@class='results-page']" to be present
      Then element with xpath "//div[@class='results-page']" should contain text "Behavior Driven Development"

      @predefined10
      Scenario: Predefined steps for giveWater
        Given I open url "https://www.givewater.com/"
        Then I should see page title as "Search the Web to Give Clean Water to Those in Need » giveWater Search Engine"
        Then I should see page title contains "giveWater"
        Then element with xpath "//input[@id='site-search']" should be present
        When I type "Behavior Driven Development" into element with xpath "//input[@id='site-search']"
        Then I click on element with xpath "//button[@id='button-addon2']"
        Then I wait for element with xpath "//div[@class='mainline-results mainline-results__web']" to be present
        Then element with xpath "//div[@class='mainline-results mainline-results__web']" should contain text "Behavior Driven Development"

  @predefined11
  Scenario: Predefined steps for Ekoru
    Given I open url "https://ekoru.org/"
    Then I should see page title as "Ekoru - every search cleans our oceans"
    Then I should see page title contains "Ekoru"
    Then element with xpath "//input[@id='fld_q']" should be present
    When I type "Behavior Driven Development" into element with xpath "//input[@id='fld_q']"
    Then I click on element with xpath "//div[@id='btn_search']"
    Then I wait for element with xpath "//div[@class='serp-wrapper']" to be present
    Then element with xpath "//div[@class='serp-wrapper']" should contain text "Behavior Driven Development"


     


    
