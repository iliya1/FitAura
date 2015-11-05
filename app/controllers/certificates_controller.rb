class CertificatesController < ApplicationController
  before_action :authenticate_trainer!
  before_action :load_trainer

  def new
    @cert = Certificate.new
  end

  def edit
    @locations = current_trainer.locations
    @editing_location = @locations.find params[:id]
    @location = @editing_location
  end

  def create
    @cert = Certificate.new certificate_params
    if @cert.valid?
      @cert.save
      redirect_to trainer_path(current_trainer)
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

  def load_trainer
    @trainer = current_trainer
  end

  def certificate_params
    params.require(:certificate).permit(:title, :description).merge(trainer_id: current_trainer.id)
  end
end
