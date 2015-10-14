ENV['RACK_ENV'] = 'test'
require 'addressable/uri'
require 'pp'
require 'sinatra/auth/oauthed'
require 'app'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
