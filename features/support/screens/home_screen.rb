class HomeScreen
	include ElementHelper

	attr_accessor :element

	def initialize
		@element = { 
					  :homescreen_title => {:text => "Delivery List"},
					  :delivery_items_group => {:class => 'androidx.recyclerview.widget.RecyclerView'},
					  :delivery_items => {:class => 'android.view.ViewGroup'},
					  :load_icon => {:class =>'android.widget.RelativeLayout'},
					  :progress_bar => {:class => 'android.widget.ProgressBar'},
					  :pull_down_refresher => {:class => 'android.widget.LinearLayout'},
					  :deliver_details_title => {:text => 'Delivery Detail'},
					  :map_view => {:id => 'mapView', :class => 'android.widget.FrameLayout'},
					  :wether_details => {:class => 'android.widget.LinearLayout'},
					  :delivery_details => {:id => 'tvDescription'},
					  :address => {:id => 'textView_address', :class => 'android.widget.TextView'}, 
					  :customer_image_icon => {:id => 'simpleDraweeView', :class => 'android.widget.ImageView'},
					  :customer_description => {:id => 'textView_description'},
					  :customer_address => {:id => 'textView_address'},
					  :alter_title => {:id => 'alertTitle'},
					  :app_error_message => {:text => 'TechChallenge has stopped'},
					  :app_restart => {:id => 'aerr_restart'}

					}
	end


	def infinity_scroll(count = 10)		
		top = find_element(@element[:delivery_items_group]).find_elements(@element[:delivery_items]).first.location
		bottom = find_element(@element[:delivery_items_group]).find_elements(@element[:delivery_items]).last.location
		touch = Appium::TouchAction.new
		counts = 0
		100.times do  			
			touch.swipe(start_x: bottom[:x], start_y: bottom[:y], end_x: top[:x], end_y: top[:y], duration:600).perform
			sleep(6)			
			counts = find_element(@element[:delivery_items_group]).find_elements(@element[:delivery_items]).size
			if find_element(@element[:delivery_items_group]).find_elements(@element[:delivery_items]).size <= 10
				if find_element(@element[:delivery_items_group]).find_element(@element[:load_icon]).displayed?
					raise("Delivery list items are not getting loaded")						
				end
			end	
		end
		counts				
	end

	def delete_an_item(index)
		item = find_element(@element[:delivery_items_group]).find_elements(@element[:customer_description])[index].location		
  		Appium::TouchAction.new.long_press(x: item[:x], y: item[:y]).perform
	end

	def check_crash_alert
		flag = false
			if wait_true(timeout: 25, interval:0.0){text(@element[:app_error_message][:text]).displayed?}
				flag = true
			end
		flag
	end

	def item_info(index)
		info = {}
		wait(timeout: 30, interval:0.0){find_element(@element[:delivery_items_group]).find_elements(@element[:customer_description])[index].displayed?}
		info[:customer_description] = find_element(@element[:delivery_items_group]).find_elements(@element[:customer_description])[index].text
		info[:customer_address] = find_element(@element[:delivery_items_group]).find_elements(@element[:customer_address])[index].text
		info
	end

	def top_on_item_to_getinfo(index)
	  details = {}
	  item = find_element(@element[:delivery_items_group]).find_elements(@element[:delivery_items])[index].location
	  Appium::TouchAction.new.tap(x: item[:x], y: item[:y]).perform
	  wait(timeout: 25, interval:0.0){find_element(@element[:customer_address]).displayed?}
	  details[:customer_address] = find_element(@element[:customer_address]).text
	  details[:customer_description] = find_element(@element[:delivery_details]).text
	  details
    end


end