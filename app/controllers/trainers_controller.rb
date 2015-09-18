class TrainersController < ApplicationController
  def dashboard
    @trainer = current_trainer
  end

  def show
    @trainer = Trainer.find params[:id]
  end
end
