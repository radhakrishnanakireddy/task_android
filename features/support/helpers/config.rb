module Config
	def self.caps
	    { caps: 
	    	{
		        deviceName: Config.fetch_device_name[1],
		        platformName: "Android",
		        app: (File.join(File.dirname(__FILE__), "app-tech-android-challenge-20180918.apk")),
		        appPackage: "com.lalamove.techchallenge",
		        appActivity: "com.lalamove.techchallenge.app.MainActivity",
		        newCommandTimeout: "100",
		        automationName: "UiAutomator2"
	    	}
		}
	end

    def load_test_data
    	DataMagic.yml_directory = 'config/data'
    end

    def self.fetch_device_name
    	begin
	    	stdout, stderr, status = Open3.capture3("adb devices -l")
	    	data = stdout
	    	model = ""
	    	stdout.split(" ").each {|i| model << i if i.include? 'model:'}
	    	model.split(":")
	    rescue Exception => e
	    	raise "Not able to fetch the adb devices list"
	    end
    end

end
