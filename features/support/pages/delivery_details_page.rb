class DeliveryDetailsPage
	include ElementHelper

	attr_accessor :element

	def initialize
		@element = { 	
					  :delivery_items_group => {:class => 'androidx.recyclerview.widget.RecyclerView'},
					  :delivery_items => {:class => 'android.view.ViewGroup'},
					  :deliver_details_title => {:text => 'Delivery Detail'},
					  :map_view => {:id => 'mapView', :class => 'android.widget.FrameLayout'},
					  :wether_details => {:class => 'android.widget.LinearLayout'},
					  :delivery_details => {:id => 'tvDescription'},
					  :address => {:id => 'textView_address', :class => 'android.widget.TextView'}, 
					  :customer_image_icon => {:id => 'simpleDraweeView', :class => 'android.widget.ImageView'},
					  :customer_description => {:id => 'textView_description'},
					  :customer_address => {:id => 'textView_address'},
					}
	end


	def item_info(index)
		info = {}
		wait(timeout: 30, interval:0.0){find_element(element[:delivery_items_group]).find_elements(element[:customer_description])[index].displayed?}
		info[:customer_description] = find_element(element[:delivery_items_group]).find_elements(element[:customer_description])[index].text
		info[:customer_address] = find_element(element[:delivery_items_group]).find_elements(element[:customer_address])[index].text
		info
	end

	def top_on_item_to_getinfo(index)
	  details = {}
	  find_element(element[:delivery_items_group]).find_elements(element[:delivery_items])[index].click
	  wait(timeout: 25, interval:0.0){find_element(element[:customer_address]).displayed?}
	  details[:customer_address] = find_element(element[:customer_address]).text
	  details[:customer_description] = find_element(element[:delivery_details]).text
	  details
    end


end