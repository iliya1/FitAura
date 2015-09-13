class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :timeslot_id

      t.timestamps null: false
    end
    add_index :bookings, [:user_id, :timeslot_id], unique: true
  end
end
