class Trainers::ClassesController < ApplicationController
  before_action :load_trainer

  def index
    @trainer_classes = @trainer.trainer_classes
    @schedule = ScheduleService.new(@trainer, Time.now, Time.now + 1.month)
  end

  def show
    @trainer_class = @trainer.trainer_classes.find params[:id]
  end

  def new
    @trainer_class = TrainerClass.new
  end

  def create
    @trainer_class = @trainer.trainer_classes.new trainer_class_params
    if @trainer_class.valid?
      @trainer_class.save!
      flash[:event] = "added class"
      redirect_to trainer_class_path(@trainer, @trainer_class)
    else
      render :new
    end
  end

  protected

  def load_trainer
    @trainer = Trainer.find params[:trainer_id]
  end

  private

  def trainer_class_params
    params.require(:trainer_class).permit(:name, :description, :price, :semiprivate)
  end

end
