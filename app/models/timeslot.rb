class Timeslot < ActiveRecord::Base
  belongs_to :scheduleable, polymorphic: true
  
  has_many :bookings

  validates :start_time, presence: true

  def enum_days
    days.reject(&:empty?).join(", ")
  end

  def available_for_day(date)
    self.capacity - self.bookings_for_day(date).count
  end

  def bookings_for_day(date)
    self.bookings.where(booking_date: date)
  end

end
