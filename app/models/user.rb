class User < ApplicationRecord
  REGEX = /[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\z/.freeze
  has_many :events, foreign_key: :creator_id
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations, source: :event
  validates :name, uniqueness: true, length: { minimum: 5, maximum: 15 }
  validates :email, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }, format: { with: REGEX, message: 'invalid' }

  def upcomming_events
    @upcomming = attended_events.where('date >= ? ', Date.today)
  end

  def prev_events
    @past = attended_events.where('date < ?', Date.today)
  end
end
