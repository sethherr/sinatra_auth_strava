require 'spec_helper'

describe Example::App do
  
  def app
    @app ||= Example::App
  end

  describe "GET '/'" do
    it 'renders the index page successfully' do
      get '/'
      expect(last_response).to be_ok
    end
  end
end
