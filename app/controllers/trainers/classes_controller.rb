class Trainers::ClassesController < ApplicationController
  before_action :load_trainer

  def index
    @trainer_classes = @trainer.trainer_classes
    @schedule = ScheduleService.new(@trainer, Time.now, Time.now + 1.month)
  end

  def show
    @studio_class = @studio.studio_classes.find params[:id]
  end

  def new
    @studio_class = StudioClass.new
  end

  def create
    @studio_class = @studio.studio_classes.new studio_class_params
    if @studio_class.valid?
      @studio_class.save!
      redirect_to studio_class_path(@studio, @studio_class)
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
