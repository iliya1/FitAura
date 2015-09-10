class Timeslot < ActiveRecord::Base
  belongs_to :studio_class

  def enum_days
    days.map{|day| Date::DAYNAMES[day.to_i]}.join(", ")
  end
end
