class LocationsController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @locations = current_trainer.locations
  end

  def new
    @locations = current_trainer.locations
    @location = Location.new
  end

  def edit
    @locations = current_trainer.locations
    @editing_location = @locations.find params[:id]
    @location = @editing_location
  end

  def create
    @locations = current_trainer.locations
    @location = Location.new location_params
    if @location.valid?
      @location.save
      redirect_to trainer_locations_path(current_trainer)
    else
      render :new
    end
  end

  def update
    @locations = current_trainer.locations
    @editing_location = @locations.find params[:id]
    @location = @editing_location
    if @editing_location.update_attributes location_params
      redirect_to trainer_locations_path(current_trainer)
    else
      render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:title, :address1, :address2, :zipcode, :default).merge(trainer_id: current_trainer.id)
  end
end
