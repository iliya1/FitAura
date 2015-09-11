class Timeslot < ActiveRecord::Base
  belongs_to :studio_class

  def enum_days
    days.reject(&:empty?).join(", ")
  end
end
