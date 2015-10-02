class AddStartAndEndDateToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :start_date, :date
    add_column :timeslots, :end_date, :date
  end
end
