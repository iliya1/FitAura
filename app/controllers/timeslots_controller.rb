class TimeslotsController < ApplicationController
  before_action :load_studio_and_class
  before_action :check_permissions, :except => :show

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new timeslot_params
    if @timeslot.valid?
      @timeslot.save!
      redirect_to studio_class_path(@studio, @studio_class)
    else
      render :new
    end
  end

  def edit
    @timeslot = @studio_class.timeslots.find params[:id]
  end

  def update
    @timeslot = @studio_class.timeslots.find params[:id]
    if @timeslot.update_attributes timeslot_params
      redirect_to studio_class_path(@studio, @studio_class)
    else
      render :edit
    end
  end

  protected

  def load_studio_and_class
    @studio = Studio.find params[:studio_id]
    @studio_class = @studio.studio_classes.find params[:class_id]
  end

  def check_permissions
    head 403 unless @studio == current_studio
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:start_date, :end_date, :start_time, :duration, :days => []).merge(studio_class_id: @studio_class.id)
  end

end
