require 'rails_helper'

RSpec.describe 'Sessions Features' do
  let(:sign_up_and_log) do
    visit('/')
    click_link('Sign up')
    fill_in('Name', with: 'Shaqri')
    fill_in('Email', with: 'Shaqri@hotmail.com')
    click_button('Create account')
    click_link('Log in')
    fill_in('Name', with: 'Shaqri')
    click_button('log in')
  end

  describe 'Creates a new user session' do
    it 'Notify the user has logged in' do
      sign_up_and_log
      expect(current_path).to have_content('/')
      expect(page).to have_content('Logged in!')
    end
    it 'Notify the user is invalid' do
      visit('/')
      click_link('Log in')
      expect(current_path).to have_content('sessions/new')
      fill_in('Name', with: 'Shaqri')
      click_button('log in')
      expect(current_path).to have_content('/sessions')
      expect(page).to have_content('Invalid name')
    end
  end

  describe 'Destroy user session' do
    it 'Notify the user has logged out' do
      sign_up_and_log
      expect(current_path).to have_content('/')
      click_link('Log out')
      expect(page).to have_content('Logged out!')
    end
  end
end
