class HomeController < ApplicationController
  def index
    @location = location
    @studios = Studio.where(zipcode: @location.postal_code)
  end
end
