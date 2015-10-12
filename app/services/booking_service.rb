class BookingService
  def initialize(user, booking_params)
    @user = user
    @timeslot = Timeslot.find booking_params[:timeslot_id]
    @booking_date = booking_params[:booking_date].to_date
    @resource_class = @timeslot.scheduleable

    @errors = []
    validate
  end

  def valid?
    @errors.empty?
  end

  def error
    @errors.first
  end

  def validate
    @errors << "Timeslot or booking date not specified" unless @timeslot && @booking_date
    @errors << "Not enough points to book this class" if @user.points < @resource_class.points
    @errors << "No booking self for that time" if @timeslot.available_for_day(@booking_date) < 1
  end


  def book!
    @user.bookings.create! timeslot_id: @timeslot.id, booking_date: @booking_date

    @user.points = @user.points - @resource_class.points
    @user.save!
  end

  def self.booked?(user, timeslot, day)
    Booking.where(user_id: user.id, timeslot_id: timeslot.id, booking_date: day).count > 0
  end
end
