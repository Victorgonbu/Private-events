require 'rails_helper'

RSpec.describe Event do
  let(:creator) do
    User.create(name: 'Victor', email: 'victor@victor.com')
  end
  let(:upEvent) do
    described_class.create(name: 'event name', description: 'event description', location: 'event location', date: '18/10/2021', creator_id: creator.id)
  end
  let(:pastEvent) do
    described_class.create(name: 'event name 2', description: 'event description', location: '21 house location', date: '02/10/2020', creator_id: creator.id)
  end

  describe 'associations' do
    it ' should have many invitations' do
      event = Event.reflect_on_association(:invitations)
      expect(event.macro).to eq(:has_many)
    end
    it ' should belongs to creator' do
      event = Event.reflect_on_association(:creator)
      expect(event.macro).to eq(:belongs_to)
    end
    it 'should have many attendees' do
      event = Event.reflect_on_association(:attendees)
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
