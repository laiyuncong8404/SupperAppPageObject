# encoding: utf-8
require 'require_all'

# require the pages and public_method
begin
  require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'pages')}"
rescue
  puts "No page objects found!"
end
# loading public_method
# require_relative '../pages/public_method'
# setup rspec
require_relative '../common/spec_helper'