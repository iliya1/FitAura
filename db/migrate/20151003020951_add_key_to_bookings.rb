class AddKeyToBookings < ActiveRecord::Migration
  def change
    remove_index :bookings, [:user_id, :timeslot_id]
    add_index :bookings, [:user_id, :timeslot_id, :booking_date], :unique => true
  end
end
