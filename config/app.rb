ENV["RACK_ENV"] ||= "development"

require 'rubygems' unless defined?(Gem)
require 'bundler'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'sinatra/asset_pipeline'
require 'dotenv'
Dotenv.load

module Example
  class App < Sinatra::Base
    # Authentication configuration
    enable :sessions
    enable :raise_errors
    disable :show_exceptions
    use Warden::Manager do |manager|
      manager.default_strategies :oauthed
      manager.failure_app = BadAuthentication

      manager[:oauthed_client_id]    = ENV['APPLICATION_CLIENT_ID']
      manager[:oauthed_secret]       = ENV['APPLICATION_CLIENT_SECRET']
      manager[:oauthed_scopes]       = ENV['APPLICATION_SCOPES_REQUESTED']
      manager[:oauthed_oauth_domain] = ENV['OAUTH_BASE_URL']
      manager[:oauthed_callback_url] = '/auth/oauthed/callback'
    end
    
    helpers do
      def ensure_authenticated
        unless env['warden'].authenticate!
          throw(:warden)
        end
      end

      def user
        env['warden'].user
      end
    end
  end

  class BadAuthentication < Sinatra::Base
    get '/unauthenticated' do
      status 403
      "Unable to authenticate, sorry bud."
    end
  end

  def self.app
    @app ||= Rack::Builder.new do
      run App
    end
  end
end
require './config/routes.rb'
