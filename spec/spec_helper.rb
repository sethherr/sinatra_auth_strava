ENV['APPLICATION_CLIENT_ID'] = 'dddc188f84e348ddae69f17dd63e758ded4cc24abed435a53db9525db2cd7af45f0'
ENV['APPLICATION_CLIENT_SECRET'] = 'e35b8e02901a3ca1b5b1e0c4cf3e1e6dbd1855de4684bd95175721428816ae96'
ENV['APPLICATION_SCOPES_REQUESTED'] = 'public'
ENV['OAUTH_BASE_URL'] = 'http://localhost:3000'
ENV['OAUTHED_VERIFIER_SECRET'] = 'MyStu9GTLJX7vhF0LKQ9dQ-cjjTwMFWTkHV6VqE7ipBpwdwwamVdJx1AXkCuOu4g'
ENV['USER_ATTRIBUTES'] = 'id full_name email'
ENV['RACK_ENV'] = 'test'

require 'bundler'
require 'rubygems' unless defined?(Gem)
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
require 'addressable/uri'
require 'pp'
require 'rack/test'
require 'sinatra/auth/oauthed'
require 'app'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
