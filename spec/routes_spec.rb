require 'spec_helper'

describe 'Example::App routes' do
  def app
    @app ||= Example::App
  end

  describe "GET '/no_authentication'" do
    it 'renders the index page successfully' do
      get '/no_authentication'
      expect(last_response).to be_ok
    end
  end

  describe "GET '/api'" do
    xit 'uses the api proxy' do
      get '/api/status/something'
      result = JSON.parse(last_response.body)
      expect(last_response).to be_ok
      expect(result['status']).to be_present
    end
  end
end
