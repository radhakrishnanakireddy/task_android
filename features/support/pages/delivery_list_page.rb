class DeliveryListPage
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
					  :customer_image_icon => {:id => 'simpleDraweeView', :class => 'android.widget.ImageView'},
					  :customer_description => {:id => 'textView_description'},
					  :alter_title => {:id => 'alertTitle'},
					  :app_error_message => {:text => 'TechChallenge has stopped'},
					  :app_restart => {:id => 'aerr_restart'}

					}
	end


	def get_items_size
		find_element(element[:delivery_items_group]).find_elements(element[:delivery_items]).size
	end


	def infinity_scroll(req_count = 10)	
		top = find_element(element[:delivery_items_group]).find_elements(element[:delivery_items]).first.location
		bottom = find_element(element[:delivery_items_group]).find_elements(element[:delivery_items]).last.location
		touch = Appium::TouchAction.new
		counts = 0
		10.times do  			
			touch.swipe(start_x: bottom[:x], start_y: bottom[:y], end_x: top[:x], end_y: top[:y], duration:600).perform			
			begin
				retries ||= 0
					counts = find_element(element[:delivery_items_group]).find_elements(element[:delivery_items]).size
					if counts <= req_count					
						if wait_true(timeout: 0.0, interval: 0.0){find_element(element[:delivery_items_group]).find_element(element[:load_icon]).displayed?}
							raise("Delivery list items are not getting loaded")
						end
					end	
			rescue Exception => e			
				retry if (retries += 1) < 6
				raise("Delivery list items are not getting loaded")								
			end
		end
	end
		
	def delete_an_item(index)
		item = find_element(element[:delivery_items_group]).find_elements(element[:customer_description])[index].location		
  		Appium::TouchAction.new.long_press(x: item[:x], y: item[:y]).perform
	end

	def check_crash_alert
		flag = false
			if wait_true(timeout: 15, interval:0.0){text(element[:app_error_message][:text]).displayed?}
				flag = true
			end
		flag
	end
end