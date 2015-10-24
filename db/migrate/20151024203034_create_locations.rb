class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :trainer_id
      t.string :title
      t.string :address1
      t.string :address2
      t.string :zipcode
      t.boolean :default

      t.timestamps null: false
    end
  end
end
