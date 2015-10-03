class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :timeslot

  validates :timeslot_id, :booking_date, presence: true
  validates :timeslot_id, uniqueness: { :scope => [:user_id, :booking_date] }
end
