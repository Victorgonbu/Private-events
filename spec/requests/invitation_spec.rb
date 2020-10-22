require 'rails_helper'

RSpec.describe 'invitation requests' do
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
  let(:create_event) do
    Event.create(name: 'victor-event', description: 'event description', location: 'event location', date: '18/10/2020', creator_id: User.first.id)
  end
  describe 'POST /create' do
    it 'invites a existing user' do
      sign_up_and_log
      create_event
      invitation_params = {
        user_id: 1,
        event_id: 1
      }
      get('/events/1')
      post '/invitations/create', params: invitation_params
      expect(response).to have_http_status(302)
    end
  end
end
