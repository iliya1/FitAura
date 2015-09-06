class CreateStudioClasses < ActiveRecord::Migration
  def change
    create_table :studio_classes do |t|
      t.integer :studio_id
      t.string :name
      t.text :description
      t.integer :points

      t.timestamps null: false
    end
  end
end
