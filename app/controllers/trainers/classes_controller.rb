class Trainers::ClassesController < ApplicationController
  before_action :load_trainer
  before_action :check_permissions, :only => [:edit, :update, :create, :new, :destroy]

  def index
    @trainer_classes = @trainer.trainer_classes
    @schedule = ScheduleService.new(@trainer, Time.now, Time.now + 1.month)
  end

  def show
    @trainer_class = @trainer.trainer_classes.find params[:id]
    @timeslots = @trainer_class.timeslots
    @schedule = ScheduleService.new(@trainer, Time.now, Time.now + 1.month, @trainer_class )
  end

  def new
    @trainer_class = TrainerClass.new
  end

  def edit
    @trainer_class = @trainer.trainer_classes.find params[:id]
  end

  def destroy
    @trainer_class = @trainer.trainer_classes.find params[:id]
    if @trainer_class.bookings.count == 0
      @trainer_class.destroy
      flash[:notice] = "Class deleted"
    else
      flash[:alert] = "Can't delete class with exising bookings"
      render :edit
    end
  end


  def update
    @trainer_class = @trainer.trainer_classes.find params[:id]
    @trainer_class.update_attributes trainer_class_params
    flash[:notice] = "Class Information Updated"
    redirect_to :back
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

  def check_permissions
    head 403 unless @trainer == current_trainer
  end

  private

  def trainer_class_params
    params.require(:trainer_class).permit(:name, :description, :price, :semiprivate, :location_id)
  end

end
