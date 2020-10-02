class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :event, foreign_key: :event_id
end
