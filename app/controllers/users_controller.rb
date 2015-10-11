class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
    @studios = Studio.where( zipcode: current_user.zipcode )
    flash[:event] = "viewed dashboard"
  end

  def account
  end

end
