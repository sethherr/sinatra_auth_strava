ENV['RACK_ENV'] = 'test'
require 'addressable/uri'
require 'pp'
require 'sinatra/auth/oauthed'
require 'app'

ENV['APPLICATION_CLIENT_ID'] = 'fd6df6f74658a9202d401aaba38223a7f79e7572926ce845e5268f5171e5b2d5'
ENV['APPLICATION_CLIENT_SECRET'] = 'afee0e20322e5d73dff82f29baf5989afd3422557056129aad29d974e56df677'
ENV['APPLICATION_SCOPES_REQUESTED'] = 'public'
ENV['OAUTH_BASE_URL'] = 'http://localhost:3000'
ENV['API_BASE_URL'] = 'http://localhost:3000/api/v1'
ENV['OAUTHED_VERIFIER_SECRET'] = 'MyStu9GTLJX7vhF0LKQ9dQ-cjjTwMFWTkHV6VqE7ipBpwdwwamVdJx1AXkCuOu4g'
ENV['USER_ATTRIBUTES'] = 'id full_name email'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
