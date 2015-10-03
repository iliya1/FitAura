class HomeController < ApplicationController
  def index
    @location = location
    @studios = Studio.near([@location.latitude, @location.longitude]) if @location
  end
end
