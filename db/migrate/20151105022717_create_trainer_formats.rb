class CreateTrainerFormats < ActiveRecord::Migration
  def change
    create_table :trainer_formats do |t|
      t.integer :training_format_id
      t.integer :trainer_id

      t.timestamps null: false
    end
  end
end
