class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    booking_service = BookingService.new(current_user, booking_params)

    if booking_service.valid?
      booking_service.book!
      flash[:notice] = "Your class has been booked"
    else
      flash[:error] = booking_service.error

    end
    redirect_to :back
  end


  private

  def booking_params
    params.require(:booking).permit(:timeslot_id, :booking_date)
  end
end
