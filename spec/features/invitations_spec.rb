require 'rails_helper'

RSpec.describe 'Invitations Features' do
  let(:sign_up) do
    visit("/")
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

  let(:create_event) do
    sign_up_and_log
    click_link('Create new Event')
    fill_in('Name', with: 'Event')
    fill_in('Location', with: 'here')
    fill_in('Date', with: '20/10/2020')
    click_button('Create event')
  end

  describe 'invite a existing user to an existing event' do
    it 'displays a user has been invited sucessfully' do
      create_event
      expect(current_path).to have_content('/')
      click_link('Details')
      fill_in('Guest name', with: 'Shaqri')
      click_button('Invite')
      expect(page).to have_content("#{Event.first.attendees.first.name} was invited!")
    end
    it 'displays a user is invalid to invite' do
      create_event
      expect(current_path).to have_content('/')
      click_link('Details')
      fill_in('Guest name', with: 'Victor')
      click_button('Invite')
      expect(page).to have_content("Invalid user name")
    end
  end
end
