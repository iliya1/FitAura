class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :studio_class_id
      t.text :days, array: true, default:[]
      t.time :start_time
      t.integer :duration

      t.timestamps null: false
    end
  end
end
