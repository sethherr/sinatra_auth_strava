ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'config', 'app')
require 'addressable/uri'
require 'pp'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
