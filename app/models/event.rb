class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :attendees, through: :invitations
  
  validates :name, :location, length: { minimum: 6, maximum: 30 }
  validates :description, length: { minimum: 6, maximum: 280 }
  validates :date, presence: true

  scope :upcomming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }
end
