require "appium_lib"
require 'require_all'
require 'report_builder'
require "pry"
require 'rspec'
require 'rspec/expectations'
require 'data_magic'



require_all File.dirname(__FILE__) + "/helpers"
require_rel 'helpers'

require_all File.dirname(__FILE__) + "/screens"
require_rel 'screens'

DataMagic.yml_directory = 'config/data'

def caps
    { caps: {
        deviceName: "Nexus 6",
        platformName: "Android",
        app: (File.join(File.dirname(__FILE__), "app-tech-android-challenge-20180918.apk")),
        appPackage: "com.lalamove.techchallenge",
        appActivity: "com.lalamove.techchallenge.app.MainActivity",
        newCommandTimeout: "3600",
        automationName: "UiAutomator2"
    }}
end

def on(name)
	class_obj = name.new
end



Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object  

