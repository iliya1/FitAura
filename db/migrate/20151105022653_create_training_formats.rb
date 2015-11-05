class CreateTrainingFormats < ActiveRecord::Migration
  def change
    create_table :training_formats do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
