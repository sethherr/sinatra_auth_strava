ENV['RACK_ENV'] = "test"
require File.join(File.dirname(__FILE__), '..', 'config', 'app')
require 'pp'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
