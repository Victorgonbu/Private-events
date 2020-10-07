require 'rails_helper'

RSpec.describe Event do
  let(:creator) {
    User.create(name: "Victor", email: "victor@victor.com")
  }
  let(:upEvent) {
    described_class.create(name: "event", location: "here", date: "18/10/2020", creator_id: creator.id )
  }
  let(:pastEvent) {
    described_class.create(name: "event 2", location: "21 house", date: "02/10/2020", creator_id: creator.id)
  }

  describe 'associations' do
    it' should have many invitations' do
      event = Event.reflect_on_association(:invitations)
      expect(event.macro).to eq(:has_many)
    end
    it' should belongs to creator' do
      event = Event.reflect_on_association(:creator)
      expect(event.macro).to eq(:belongs_to)
    end
    it 'should have many attendees' do
      event= Event.reflect_on_association(:attendees)
      expect(event.macro).to eql(:has_many)
    end
  end
  describe '.upcomming' do
    it 'returns an ActiveRecord::Relation of upcomming events' do
      expect(described_class.upcomming).to contain_exactly(
        upEvent
      )
    end
  end
  describe '.past' do
    it 'returns an ActiveRecord::Relation of previous events' do
      expect(described_class.past).to contain_exactly(
        pastEvent
      )
    end
  end

end
