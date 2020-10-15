class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations, source: :event
  validates :email, :name, uniqueness: true, presence: true

  def upcomming_events
    @upcomming = attended_events.where('date >= ? ', Date.today)
  end

  def prev_events
    @past = attended_events.where('date < ?', Date.today)
  end
end
