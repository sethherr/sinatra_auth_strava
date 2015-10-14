module Example
  class App < Sinatra::Base
    enable :sessions
    register Sinatra::Auth::Oauthed

    # These are the settings for authentication redirects
    #
    # Probably don't change them?
    get '/redirect_to' do
      authenticate!
      "Hello There, #{user.name}! return_to is working!"
    end

    get '/auth/oauthed/callback' do
      authenticate!
      redirect '/'
    end

    get '/logout' do
      logout!
      'Peace!'
    end

    # API proxy, sends authenticated requests
    #
    # This isn't working yet
    # get '/api/*' do
    #   authenticate!
    #   url = params[:captures][0]
    #   oauthed_raw_request(url)
    # end

    # The pages that are rendered
    #
    # Add new routes below here
    get '/' do
      authenticate!
      @user = oauthed_user
      # You can make requests to the API and set them on instance variables to
      # render on the page. Include the path, get a response
      @req = oauthed_raw_request('me')
      haml :demo_index
    end

    get '/no_authentication' do
      haml :demo_index
    end
  end
end
