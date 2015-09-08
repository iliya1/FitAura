class ClassesController < ApplicationController
  before_action :load_studio

  def index
    @studio_classes = @studio.studio_classes
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

  def load_studio
    @studio = Studio.find params[:studio_id]
  end

  private

  def studio_class_params
    params.require(:studio_class).permit(:name, :description, :points)
  end

end
