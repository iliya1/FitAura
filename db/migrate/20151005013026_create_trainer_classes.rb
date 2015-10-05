class CreateTrainerClasses < ActiveRecord::Migration
  def change
    create_table :trainer_classes do |t|
      t.integer :trainer_id
      t.string :name
      t.text :description
      t.boolean :semiprivate, default: false

      t.timestamps null: false
    end
  end
end
