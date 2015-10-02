class AddCapacityToTimeslots < ActiveRecord::Migration
  def change
    add_column :timeslots, :capacity, :integer, default: 1
  end
end
