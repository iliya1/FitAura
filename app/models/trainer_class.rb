class TrainerClass < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :location
  has_many :timeslots, :as => :scheduleable
  has_many :bookings, through: :timeslots
  attr_writer :price

  def price
    points ? points / 10 : nil
  end

  def price=(val)
    self.points = val.to_f * 10
  end
end
