class AddInstructorsToStudioClasses < ActiveRecord::Migration
  def change
    add_column :studio_classes, :instructor_id, :integer
  end
end
