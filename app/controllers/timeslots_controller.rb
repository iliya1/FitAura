class TimeslotsController < ApplicationController
  before_action :load_studio_and_class

  def new
    @timeslot = Timeslot.new
  end

  protected

  def load_studio_and_class
    @studio = Studio.find params[:studio_id]
    @studio_class = @studio.studio_classes.find params[:class_id]
  end

end
