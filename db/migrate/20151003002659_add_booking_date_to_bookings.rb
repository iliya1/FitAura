class AddBookingDateToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :booking_date, :date
  end
end
