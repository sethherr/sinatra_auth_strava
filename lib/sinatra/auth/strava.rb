require 'sinatra/base'
require 'warden-oauthed'

module Sinatra
  module Auth
    module Strava
      class BadAuthentication < Sinatra::Base
        enable :raise_errors
        disable :show_exceptions

        helpers do
          def unauthorized_template
            @unauthenticated_template ||= File.read(File.join(File.dirname(__FILE__), 'views', '401.html'))
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

        def strava_authenticate!(*args)
          warden.authenticate!(*args)
        end

        def strava_authenticated?(*args)
          warden.authenticated?(*args)
        end

        def strava_logout!
          warden.logout
        end

        # The authenticated user object
        def strava_user
          warden.user
        end

        # Send a API GET request to the path defined in .env
        #
        # path - the path on api.github.com to hit
        #
        # Returns a rest client response object
        #
        # Examples
        #   strava_raw_request("/user")
        #   # => RestClient::Response
        def strava_raw_request(path)
          strava_user.strava_raw_request(path)
        end

        # Send a API GET request to the path defined in .env and parse the response body
        #
        # path - the path on api.github.com to hit
        #
        # Returns a parsed JSON response
        #
        # Examples
        #   strava_request("/user")
        #   # => { 'login' => 'atmos', ... }
        def strava_request(path)
          strava_user.strava_request(path)
        end

        def _relative_url_for(path)
          request.script_name + path
        end
      end

      def self.registered(app)
        app.use Warden::Manager do |manager|
          manager.default_strategies :strava
          manager.failure_app = BadAuthentication

          manager[:strava_client_id]    = ENV['STRAVA_CLIENT_ID']
          manager[:strava_secret]       = ENV['STRAVA_CLIENT_SECRET']
          manager[:strava_scopes]       = ENV['STRAVA_SCOPES_REQUESTED']
          manager[:strava_oauth_domain] = 'https://www.strava.com/oauth/authorize'
          manager[:strava_callback_url] = '/auth/sinatra/callback'
        end

        app.helpers Helpers

        app.get '/auth/sinatra/callback' do
          if params['error']
            redirect '/unauthenticated'
          else
            strava_authenticate!
            redirect '/'
            return_to = session.delete('return_to') || _relative_url_for('/')
            redirect return_to
          end
        end
      end
    end
  end
end
