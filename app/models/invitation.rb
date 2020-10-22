class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :event
  validates :attendee_id, uniqueness: true
end
