class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :studio_name, :name, :sex, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit( :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :zipcode, :email, :password, :password_confirmation, :current_password) }
  end

  def location
    if Rails.env.development?
      ip = "71.237.91.66"
      Geocoder.search(ip).first
    else
      request.location
    end
  end

  def load_studio
    @studio = Studio.find params[:studio_id]
  end

end
