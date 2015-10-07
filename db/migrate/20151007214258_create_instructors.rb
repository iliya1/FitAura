class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :about
      t.integer :studio_id

      t.timestamps null: false
    end
  end
end
