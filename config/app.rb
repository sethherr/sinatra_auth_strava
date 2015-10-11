ENV['RACK_ENV'] ||= 'development'

require 'rubygems' unless defined?(Gem)
require 'bundler'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'dotenv'
Dotenv.load

require 'sinatra/base'

module Sinatra
  module Auth
    module Oauthed

      class BadAuthentication < Sinatra::Base
        enable :raise_errors
        disable :show_exceptions

        helpers do
          def unauthorized_template
            @unauthenticated_template ||= File.read(File.join(File.expand_path('../../', __FILE__), "views", "401.html"))
          end
        end

        get '/unauthenticated' do
          status 403
          unauthorized_template
        end
      end

      module Helpers
        def warden
          env['warden']
        end

        def authenticate!(*args)
          warden.authenticate!(*args)
        end

        def authenticated?(*args)
          warden.authenticated?(*args)
        end

        def logout!
          warden.logout
        end

        # The authenticated user object
        #
        # Supports a variety of methods, configurable in .env
        def oauthed_user
          warden.user
        end

        # Send a API GET request to the path defined in .env
        #
        # path - the path on api.github.com to hit
        #
        # Returns a rest client response object
        #
        # Examples
        #   oauthed_raw_request("/user")
        #   # => RestClient::Response
        def oauthed_raw_request(path)
          oauthed_user.oauthed_raw_request(path)
        end

        # Send a API GET request to the path defined in .env and parse the response body
        #
        # path - the path on api.github.com to hit
        #
        # Returns a parsed JSON response
        #
        # Examples
        #   oauthed_request("/user")
        #   # => { 'login' => 'atmos', ... }
        def oauthed_request(path)
          oauthed_user.oauthed_request(path)
        end

        def _relative_url_for(path)
          request.script_name + path
        end
      end

      def self.registered(app)
        app.use Warden::Manager do |manager|
          manager.default_strategies :oauthed
          manager.failure_app = BadAuthentication

          manager[:oauthed_client_id]    = ENV['APPLICATION_CLIENT_ID']
          manager[:oauthed_secret]       = ENV['APPLICATION_CLIENT_SECRET']
          manager[:oauthed_scopes]       = ENV['APPLICATION_SCOPES_REQUESTED']
          manager[:oauthed_oauth_domain] = ENV['OAUTH_BASE_URL']
          manager[:oauthed_callback_url] = '/auth/oauthed/callback'
        end

        # Sign cookie sessions in with AS::Verifier
        ENV['WARDEN_OAUTHED_VERIFIER_SECRET'] ||= ENV['OAUTHED_VERIFIER_SECRET']

        unless ENV['WARDEN_OAUTHED_VERIFIER_SECRET']
          warn 'No WARDEN_OAUTHED_VERIFIER_SECRET environmental variable found.'
          warn 'Your sessions are likely being stored insecurely.'
        end

        app.helpers Helpers

        app.get '/auth/oauthed/callback' do
          if params['error']
            redirect '/unauthenticated'
          else
            authenticate!
            return_to = session.delete('return_to') || _relative_url_for('/')
            redirect return_to
          end
        end
      end
    end
  end
end

require './config/routes.rb'
