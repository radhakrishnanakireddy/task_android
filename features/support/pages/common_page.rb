class CommonPage
	include ElementHelper

	attr_accessor :element

	def initialize
		@element = { :appbar => {:id => 'appBarLayout'},
					 :error_image => {:class => 'android.widget.ImageView'},
					 :delivery_items_group => {:class => 'androidx.recyclerview.widget.RecyclerView'},
					 :delivery_items => {:class => 'android.view.ViewGroup'},
					 :alter_title => {:id => 'alertTitle'},
					 :app_error_message => {:text => 'TechChallenge has stopped'},
					 :app_restart => {:id => 'aerr_restart'},
  	                 :back_arrow => {:class => 'android.widget.ImageButton'}
				}
	end


	def check_crash_alert
		flag = false
			if wait_true(timeout: 15, interval:0.0){text(element[:app_error_message][:text]).displayed?}
				flag = true
			end
		flag
	end

	def back_arrow
		if wait_true(timeout: 5, interval: 0.0){find_element(element[:appbar]).find_element(element[:back_arrow]).displayed?}
			find_element(element[:appbar]).find_element(element[:back_arrow]).click
		end
	end


end