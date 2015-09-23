class Timeslot < ActiveRecord::Base
  belongs_to :studio_class
  
  has_many :bookings

  validates :start_time, presence: true

  def enum_days
    days.reject(&:empty?).join(", ")
  end
end
