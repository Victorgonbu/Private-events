require 'rails_helper'

RSpec.describe 'Users Features' do
  let(:sign_up) do
    visit('/')
    click_link('Sign up')
    fill_in('Name', with: 'Shaqri')
    fill_in('Email', with: 'Shaqri@hotmail.com')
    click_button('Create account')
  end
  let(:sign_up_and_log) do
    sign_up
    click_link('Log in')
    fill_in('Name', with: 'Shaqri')
    click_button('log in')
  end

  let(:create_events_and_invite) do
    Event.create(name: 'upcomming event', location: 'My house', date: '20/10/2020', creator_id: User.first.id)
    Event.create(name: 'new event', location: 'john house', date: '02/10/2020', creator_id: User.first.id)
    Invitation.create(event_id: Event.first.id, attendee_id: User.first.id)
    Invitation.create(event_id: Event.last.id, attendee_id: User.first.id)
  end

  describe 'creates a new user' do
    it 'shows you have successfully created a new user' do
      sign_up
      expect(page).to have_content("User #{User.first.name} created successfully")
    end
  end

  describe 'displays user show page' do
    it 'Shows user hosted and invited events' do
      sign_up_and_log
      create_events_and_invite
      click_link(User.first.name)
      expect(page).to have_content('Hosted Events')
      expect(page).to have_content('Upcomming Events')
      expect(page).to have_content('Previous Attended Events')
    end
  end
end
