class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
    @studios = Studio.where( zipcode: current_user.zipcode )
  end

  def account
  end

  def book
    timeslot = Timeslot.find params[:timeslot_id]
    studio_class = timeslot.studio_class

    if current_user.points < studio_class.points
      flash[:error] = "Not enough points to book this class"
      redirect_to :back and return
    end

    current_user.bookings.create! timeslot_id: timeslot.id

    current_user.points = current_user.points - studio_class.points
    current_user.save!

    flash[:notice] = "Class #{studio_class.name} booked"
    redirect_to :back
  end
end
