class AddLocationToTrainerClass < ActiveRecord::Migration
  def change
    add_column :trainer_classes, :location_id, :integer
  end
end
