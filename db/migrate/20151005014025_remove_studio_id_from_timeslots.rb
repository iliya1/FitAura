class RemoveStudioIdFromTimeslots < ActiveRecord::Migration
  def change
    remove_column :timeslots, :studio_class_id
  end
end
