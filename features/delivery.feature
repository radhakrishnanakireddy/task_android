
@items_verification

Feature: Tests for Delivery List functionality


  Scenario: Verfiy TechChallange apk is installed on mobile
    Given I Check TechChallange apk is installed on mobile


  Scenario: Verify Delivery List Page
   	Given I Land on Home screen
  	Then I Should see"Delivery List" title Home screen
  	And I See Delivery Items on Home 

  Scenario: Verify Back Navigation on App
    Given I Land on Home screen
    Then I tap on a Delivery List item
    And I tap on Back navigation arrow
    And I should get navigated "Delivery List" page


  Scenario: Verify Infinity screen scroll on Delivery List screen
  	Given I Land on Home screen
  	Then I scroll down the screen infinity times to see delivery list items

  
  Scenario: Verify Items count per load on Delivery List screen
  	Given I Land on Home screen
  	Then I scroll down the screen and I should should see "10" or more items per each load 


  Scenario: Verify Delivery Details screen
  	Given I Land on Home screen
  	Then I tap on a Delivery List item
  	And I should see "Delivery Detail" title in header
  	And I should see respective customer name with delivery item name


  Scenario: Verify Deletion of an item from delivery list
  	Given I Land on Home screen
  	Then I Delete an item from Delivery list by long press


  Scenario: Verify that Delivery item name, Location, Profile image should be present for each item in delivery list page
    Given I Land on Home screen
    Then I Should not see items which does not have Item name, location, profile on Delivery List page


  Scenario: Verify Native Back Navigation on App
    Given I Land on Home screen
    Then I tap on a Delivery List item
    And I tap on Navtive Back navigation button
    And I should get navigated "Delivery List" page


 
  Scenario: Verify that app should not get crashed after getting back from background
    Given I Land on Home screen
    Then I send app to background for "5" seconds
    And I should see delivery list page



  Scenario: Verify that app should get back to Delivery Details page only if app send to background on Delivery Details page
    Given I Land on Home screen
    Then I tap on a Delivery List item
    And I send app to background for "5" seconds on delivery details page
    And I should see "Delivery Detail" page





 
