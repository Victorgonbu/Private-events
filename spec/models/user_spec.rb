require 'rails_helper'

RSpec.describe User do
  let(:new_user) {
    User.new(name: 'victor', email: "elpana@hotmail.com")
  }
  let(:upEvent) {
    Event.create(name: "upcomming event", location: "park", date: "20/10/2020", creator_id: new_user.id)
  }
  let(:pastEvent) {
    Event.create(name: "past event", location: "park 2", date: "02/10/2020", creator_id: new_user.id)
  }
  describe 'associations' do
    it 'should have many events' do
      user = User.reflect_on_association(:events)
      expect(user.macro).to eq(:has_many)
    end
    it 'should have many invitations' do
      user = User.reflect_on_association(:invitations)
      expect(user.macro).to eq(:has_many)
    end
    it 'should have many attended events' do
      user = User.reflect_on_association(:attended_events)
      expect(user.macro).to eq(:has_many)
    end
  end
  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        expect(new_user).to be_valid
        new_user.name = nil
        expect(new_user).to_not be_valid
      end
      it 'must be unique' do
        new_user.save
        expect(User.create(name: "victor", email:"victor@victor.com")).to_not be_valid
      end
    end
    describe 'email' do
      it 'must be present' do
        expect(new_user).to be_valid
        new_user.email = nil
        expect(new_user).to_not be_valid
      end
      it 'must be unique' do
        new_user.save
        expect(User.create(name: "Ariel", email: "elpana@hotmail.com")).to_not be_valid
      end
    end
  end

  describe '.upcomming_events' do
    it 'should return upcomming events for a user to attend' do
      new_user.save
      invitation = Invitation.create(event_id: upEvent.id, attendee_id: new_user.id)
      expect(new_user.upcomming_events).to contain_exactly(
        upEvent
      )
    end
  end

  describe '.prev_events' do
    it 'should return previous events a user attended to' do
      new_user.save
      invitation = Invitation.create(event_id: pastEvent.id, attendee_id: new_user.id)
      expect(new_user.prev_events).to contain_exactly(
        pastEvent
      )
    end
  end
end
