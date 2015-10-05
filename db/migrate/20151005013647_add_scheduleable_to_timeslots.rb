class AddScheduleableToTimeslots < ActiveRecord::Migration
  def change
    add_reference :timeslots, :scheduleable, polymorphic: true, index: true
  end
end
