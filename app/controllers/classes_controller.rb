class ClassesController < ApplicationController
  def index
    @studio = Studio.find params[:studio_id]
    @studio_classes = @studio.studio_classes
  end

end
