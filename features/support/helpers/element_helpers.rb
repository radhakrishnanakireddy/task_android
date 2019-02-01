module ElementHelper
    def text_visible?(text)
    	flag = true
    	begin
    		wait(timeout: 1, interval: 0.0){text(text).displayed?}
    	rescue Exception => e
    		flag = false
    	end
    	flag				
    end
end