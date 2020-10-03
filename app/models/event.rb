class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations
  has_many :attendees, through: :invitations

  scope :upcomming, -> { where("date >= ?", Date.today)}
  scope :past, -> { where("date < ?", Date.today)}
end
