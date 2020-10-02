class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations, foreign_key: :event_id
  has_many :attendee, through: invitations
end
