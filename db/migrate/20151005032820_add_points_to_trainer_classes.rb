class AddPointsToTrainerClasses < ActiveRecord::Migration
  def change
    add_column :trainer_classes, :points, :integer
  end
end
