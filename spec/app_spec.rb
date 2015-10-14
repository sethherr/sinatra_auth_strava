require 'spec_helper'

describe Example::App do
  def app
    @app ||= Example::App
  end

  describe "GET '/'" do
    it 'requesting a url that requires authentication redirects to redirect uri' do
      response = get '/'

      uri = Addressable::URI.parse(response.headers['Location'])

      uri.scheme.should eql('http')
      uri.host.should eql('localhost')

      params = uri.query_values
      expect(params['response_type']).to eq 'code'
      expect(params['scope']).to eq 'public'
      expect(params['client_id']).to match(/\w{20}/)
      expect(params['redirect_uri']).to eq 'http://example.org/auth/oauthed/callback'
    end
  end
end
