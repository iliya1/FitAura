class ClassesController < ApplicationController
  before_action :load_studio

  def index
    @studio_classes = @studio.studio_classes
  end

  def show
    @studio_class = @studio.studio_classes.find params[:id]
  end

  protected

  def load_studio
    @studio = Studio.find params[:studio_id]
  end

end
