require 'rails_helper'

RSpec.describe 'Event Requests' do
  let(:user_params) do
    {
      user: {
        name: 'victor',
        email: 'victor@victor.com'
      }
    }
  end
  let(:sign_up_and_log) do
    name_params = {
      name: 'victor'
    }
    post '/users', params: user_params
    post '/sessions', params: name_params
  end

  let(:event_params) do
    {
      event: {
        name: 'event',
        location: 'my house',
        date: '20/10/2020',
        creator_id: User.first.id
      }
    }
  end
  describe 'GET /new' do
    it 'returns status message and correct body response' do
      sign_up_and_log
      get '/events/new'
      expect(response).to have_http_status(200)
    end
    it 'redirect to root path if user is no loged in' do
      get '/events/new'
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /create' do
    it 'create an event with valid attributes and redirect to root url' do
      sign_up_and_log
      post '/events', params: event_params
      expect(response).to have_http_status(302)
    end
  end
  describe 'GET index' do
    it 'returns all the events created for the users' do
      sign_up_and_log
      post '/events', params: event_params
      get('/events')
      expect(response.body).to include('event')
    end
  end
end
