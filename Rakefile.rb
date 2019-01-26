require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

desc "Run Suites"
namespace "test" do
	Cucumber::Rake::Task.new(:android) do |t|
		t.profile = 'android'
	end  
end

