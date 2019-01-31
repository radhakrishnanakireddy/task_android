
@items_verification

Feature: Tests for Home screen functionality

  Scenario: Verify Home Screen
  	Given I Land on Home screen
  	Then I Should see"Delivery List" title Home screen
  	And I See Delivery Items on Home 

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

 
