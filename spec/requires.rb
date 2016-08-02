# encoding: utf-8
require 'require_all'

# require the pages and public_method
begin
  require_all "#{File.join(File.expand_path(File.dirname(__FILE__)), '..', 'pages')}"
rescue
  puts "No page objects found!"
end
# include shared_examples
require_relative "./shared/shared_examples"
require_relative "./shared/shared_context"

# setup rspec
require_relative '../common/spec_helper'
