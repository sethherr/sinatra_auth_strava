module Example
  class App < Sinatra::Base
    enable :sessions
    register Sinatra::Auth::Oauthed

    get '/logout' do
      logout!
      'Peace!'
    end

    get '/' do
      authenticate!
      @user = oauthed_user
      "authenticated: #{@user.email}"
    end
  end
end
