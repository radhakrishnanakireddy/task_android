require "appium_lib"
require 'require_all'
require 'report_builder'
require "pry"
require 'rspec'
require 'rspec/expectations'
require 'data_magic'



require_all File.dirname(__FILE__) + "/helpers"
require_rel 'helpers'

require_all File.dirname(__FILE__) + "/pages"
require_rel 'pages'

include Config
include PageObjects


Appium::Driver.new(Config.caps, true)
Appium.promote_appium_methods Object 





 

