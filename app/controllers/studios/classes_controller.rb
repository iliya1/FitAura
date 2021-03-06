class Studios::ClassesController < ApplicationController
  before_action :load_studio
  before_action :load_class, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions, :only => [:edit, :update, :create, :new, :destroy]

  def index
    @studio_classes = @studio.studio_classes
    @schedule = ScheduleService.new(@studio, Time.now, Time.now + 1.month)
  end

  def show
    @schedule = ScheduleService.new(@studio, Time.now, Time.now + 1.month, @studio_class )
  end

  def edit
  end

  def update
    @studio_class.update_attributes studio_class_params
    flash[:notice] = "Class Information Updated"
    redirect_to :back
  end

  def new
    @studio_class = StudioClass.new
  end

  def create
    @studio_class = @studio.studio_classes.new studio_class_params
    if @studio_class.valid?
      @studio_class.save!
      flash[:event] = "added class"
      redirect_to studio_class_path(@studio, @studio_class)
    else
      render :new
    end
  end

  protected

  def load_class
    @studio_class = @studio.studio_classes.find params[:id]
  end

  def check_permissions
    head 403 unless @studio == current_studio
  end

  private

  def studio_class_params
    params.require(:studio_class).permit(:name, :description, :instructor_id, :price)
  end

end
