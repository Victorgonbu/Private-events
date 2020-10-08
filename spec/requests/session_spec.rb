require 'rails_helper'

RSpec.describe 'sessions requests' do
  let(:user_params) { {
    user: {
      name: 'victor',
      email: 'victor@victor.com'
    }
  }
  }
  let(:sign_up) do
    post '/users', :params => user_params
  end

  describe 'POST /new' do
    it 'return status and correct body content' do
      get '/sessions/new'
      expect(response.body).to include('Log in')
      expect(response).to have_http_status(200)

    end
  end

  describe 'POST /create' do
    it 'create a user session if exist and redirect to root path' do
      sign_up
      name_params = {
        name: 'victor'
      }
      post '/sessions', :params => name_params
      expect(response).to have_http_status(302)
    end
  end
end
