class TrainersController < ApplicationController
  before_action :authenticate_trainer!, :only => [:edit, :update, :dashboard, :clients]
  before_action :load_current_trainer, :only => [:edit, :update, :dashboard, :clients]

  def index
  end

  def dashboard
    flash[:event] = "viewed dashboard"
  end

  def show
    @trainer = Trainer.find params[:id]
  end

  def edit
  end

  def clients
    @bookings = @trainer.bookings
  end

  def update
    if @trainer.update_attributes trainer_attributes
      flash[:notice] = "Profile updated"
      redirect_to edit_trainer_path(current_trainer)
    else
      render :edit
    end
  end

  protected

  def load_current_trainer
    @trainer = current_trainer
  end

  private

  def trainer_attributes
    params.require(:trainer).permit( :photo , :name, :email, :about, :phone, :specialty, :training_format_ids => [])
  end

end
