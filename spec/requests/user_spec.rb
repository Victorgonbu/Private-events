require 'rails_helper'

RSpec.describe 'User requests' do
  let(:user_params) do
    {
      user: {
        name: 'victor',
        email: 'victor@victor.com'
      }
    }
  end
  describe 'GET /new' do
    it 'returns status message and correct body response' do
      get('/users/new')
      expect(response).to have_http_status(200)
      expect(response.body).to include('Sign up')
    end
  end

  describe 'POST /create' do
    it 'create a user with valid attributes' do
      post '/users', params: user_params
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /show' do
    it 'show a user page' do
      name_params = {
        name: 'victor'
      }
      post '/users', params: user_params
      post '/sessions', params: name_params
      get '/users/1'
      expect(response).to have_http_status(200)
    end
  end
end
