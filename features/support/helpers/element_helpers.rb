module ElementHelper
    def text_visible?(text)
    	flag = true
    	begin
    		wait(timeout: 0.0, interval: 0.5){text(text).displayed?}
    	rescue Exception => e
    		flag = false
    	end
    	flag				
    end

end