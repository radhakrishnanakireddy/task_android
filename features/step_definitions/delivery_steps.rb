
Given("I Check TechChallange apk is installed on mobile") do
  expect(app_installed?(Config.caps[:caps][:appPackage])).to be_truthy, 'Error : TechChallange apk is not installed on device'
end

Given(/^I Land on Home screen$/) do
   expect(wait_true(timeout: 25, interval:0.0){ text(delivery_list_page.element[:homescreen_title][:text]).enabled?}).to be_truthy, "Error : Header Bar is  not displayed"
   @header_text = text(delivery_list_page.element[:homescreen_title][:text]).text
end


Then("I Should see{string} title Home screen") do |title|
   expect(@header_text).to be == title, "Error : Header text #{title} is not displayed"
end

Then("I See Delivery Items on Home") do
  expect(delivery_list_page.get_items_size).to be > 0, "Error : Delivery Items are not displayed"  
end

Then("I scroll down the screen infinity times to see delivery list items") do
  delivery_list_page.infinity_scroll
end

Then("I scroll down the screen and I should should see {string} or more items per each load") do |items_count|
  expect(delivery_list_page.get_items_size).to be >= items_count.to_i
end


Then("I tap on a Delivery List item") do
  item ||= begin
    rand(0..delivery_list_page.get_items_size-2)
  end
  @deliver_list_screen_info =  delivery_details_page.item_info(item)
  @delivery_details =  delivery_details_page.top_on_item_to_getinfo(item)
end


Then("I should see {string} title in header") do |title|
  expect(wait_true(timeout: 25, interval:0.0){text(title).displayed?}).to be_truthy, "Error : Delivery List title is not displayed"
end


Then("I should see respective customer name with delivery item name") do
  expect(@deliver_list_screen_info[:customer_address]).to eql(@delivery_details[:customer_address]), "Error : Delivery List screen's Customer address is not matched with Delivery Details screen's customer address"
  expect(@deliver_list_screen_info[:customer_description]).to eql(@delivery_details[:customer_description]), "Error : Delivery List screen's customer_description is not matched with Delivery Details screen's customer_description"
end



Then("I Delete an item from Delivery list by long press") do
  item ||= begin
    rand(0..delivery_list_page.get_items_size-2)
  end
  delivery_list_page.delete_an_item(item)
  expect(common_page_herlpers.check_crash_alert).to be_falsey, "Error : App got crashed while deleting an item from delivery list"
end


Then("I Should not see items which does not have Item name, location, profile on Delivery List page") do
  expect(delivery_list_page.verify_items).to be_truthy, "Error : Delivery item data is missing from page"
end


Then("I tap on Navtive Back navigation button") do
  back
end

Then("I should get navigated {string} page") do |string|
  expect(common_page_herlpers.text_visible?("Delivery List")).to be_truthy, "Error : Not able to navigate to Delivery list page using Native back navigation"
end


Then("I tap on Back navigation arrow") do
  common_page_herlpers.back_arrow
end

Then("I send app to background for {string} seconds") do |seconds|
  background_app(seconds.to_i)
end

Then("I should see delivery list page") do
  expect(delivery_list_page.get_items_size).to be > 0, "Error : Items are not getting loaded after getting back from background app sleep"
end

Then("I send app to background for {string} seconds on delivery details page") do |seconds|
  background_app(seconds.to_i)
end

Then("I should see {string} page") do |page|
   expect(common_page_herlpers.text_visible?(page)).to be_truthy, 'Error : Delivery Details Page is not loaded after getting back app from background time'
end

