class AddInstructorToStudioClass < ActiveRecord::Migration
  def change
    add_column :studio_classes, :instructor_name, :string
  end
end
