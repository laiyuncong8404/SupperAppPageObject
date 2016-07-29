# encoding: utf-8
# filename: common/spec_helper.rb
require 'rspec'
require 'appium_lib'
require 'yaml'

def setup_driver
	return if $driver
	appium_txt  = File.expand_path(File.join(File.dirname(__FILE__), 'appium.txt'))
	@caps = Appium.load_appium_txt file: appium_txt, verbose: true
	Appium::Driver.new @caps
end

def promote_methods
	Appium.promote_singleton_appium_methods Pages
	Appium.promote_appium_methods RSpec::Core::ExampleGroup
end


RSpec.configure do |config|

	config.before(:suite) do
		yml_file  = File.expand_path(File.join(File.dirname(__FILE__), '..', 'data', 'data.yml'))
		raise "Can not find #{yml_file}!" unless File.exists?(yml_file)
		$data = YAML::load_file(yml_file)
	end

	config.before(:all) do
		setup_driver
		$driver.start_driver
		promote_methods
		set_wait (180)
	end

	config.after(:all) do
		$driver.driver_quit
	end
end
