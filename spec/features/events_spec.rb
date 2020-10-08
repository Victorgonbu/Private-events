require 'rails_helper'

RSpec.describe 'Events Features' do
  let(:log_and_create_event) do
    visit("/")
    click_link('Sign up')
    fill_in('Name', with: 'Shaqri')
    fill_in('Email', with: 'Shaqri@hotmail.com')
    click_button('Create account')
    click_link('Log in')
    fill_in('Name', with: 'Shaqri')
    click_button('log in')
    click_link('Create new Event')
    fill_in('Name', with: 'Event')
    fill_in('Location', with: 'here')
    fill_in('Date', with: '20/10/2020')
    click_button('Create event')
  end

  describe 'Viewing the index' do
    it 'lists all events' do
      User.create(name: "Victor", email: "victor@victor.com")
      Event.create(name: "event", location: "here", date: "02/10/2020", creator_id: User.first.id)
      Event.create(name: "event 2", location: "here 2", date: "20/10/2020", creator_id: User.first.id)
      visit("/")
      expect(page).to have_content('event')
      expect(page).to have_content('event 2')
    end
  end

  describe 'creating a new event' do
    describe 'when logged in' do
      it 'creates an events and notify you about it' do
        log_and_create_event
        expect(page).to have_content('Event created')
      end

    end
    describe 'when not logged in' do
      it 'notify the user must me logged in' do
        visit('events/new')
        expect(page).to have_content('You must be logged in to create a new event')
      end
    end

  end

  describe 'Displaying event details' do
    describe 'when the user logged in is the host of the clicked event' do
      it 'shows the event details' do
        log_and_create_event
        click_link('Details')
        expect(page).to have_content(Event.first.name)
      end
      it 'Displays the invite form to invite users' do
        log_and_create_event
        click_link('Details')
        expect(page).to have_content('Invite')
      end
    end

    describe 'When user is nor logged in or is not the event owner' do
      it 'Shows only the event details' do
        log_and_create_event
        click_link('Details')
        expect(page).to have_content(Event.first.name)
      end
    end
  end
end
