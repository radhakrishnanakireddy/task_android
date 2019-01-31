module Config
	def self.caps
	    { caps: 
	    	{
		        deviceName: "Nexus 6",
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
end
