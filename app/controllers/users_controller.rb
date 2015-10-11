class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
    @classes = SearchService.classes(current_user.zipcode, params[:query])
    flash[:event] = "viewed dashboard"
  end

  def account
  end

end
