class TimeslotsController < ApplicationController
  before_action :load_resource
  before_action :check_permissions, :except => :show

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new timeslot_params
    if @timeslot.valid?
      @timeslot.save!
      redirect_to resource_path
    else
      render :new
    end
  end

  def edit
    @timeslot = @resource_class.timeslots.find params[:id]
  end

  def update
    @timeslot = @resource_class.timeslots.find params[:id]
    if @timeslot.update_attributes timeslot_params
      redirect_to resource_path
    else
      render :edit
    end
  end

  protected

  def load_resource
    if params[:studio_class_id]
      @resource = current_studio
      @resource_class = @resource.studio_classes.find params[:studio_class_id]
      @resource_type = "StudioClass"
    elsif params[:trainer_class_id]
      @resource = current_trainer
      @resource_class = @resource.trainer_classes.find params[:trainer_class_id]
      @resource_type = "TrainerClass"
    end
  end

  def resource_path
      if @resource_type == "StudioClass"
        studio_class_path(@resource, @resource_class)
      elsif @resource_type == "TrainerClass"
        trainer_class_path(@resource, @resource_class)
      end
  end

  def check_permissions
    head 403 unless @resource == current_studio || @resource == current_trainer
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:start_date, :end_date, :start_time, :duration, :days => []).merge(scheduleable_id: @resource_class.id, scheduleable_type:@resource_type)
  end

end
