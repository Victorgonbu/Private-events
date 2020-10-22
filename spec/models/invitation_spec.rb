require 'rails_helper'

RSpec.describe Invitation do
  describe 'associations' do
    it 'should belongs to attendee' do
      invitation = Invitation.reflect_on_association(:attendee)
      expect(invitation.macro).to eq(:belongs_to)
    end
    it 'should belongs to event' do
      invitation = Invitation.reflect_on_association(:event)
      expect(invitation.macro).to eq(:belongs_to)
    end
  end
end
