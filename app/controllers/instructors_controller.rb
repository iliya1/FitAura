class InstructorsController < ApplicationController
  before_action :load_studio
  before_action :authenticate_studio!, :except => [:index, :show]

  def index
    @instructors = @studio.instructors
  end

  def show
    @instuctor = @studio.instructors.find params[:id]
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = @studio.instructors.new instructor_params
    if @instructor.valid?
      @instructor.save!
      flash[:event] = "added instructor"
      redirect_to studio_instructors_path(@instructor)
    else
      render :new
    end
  end

  def edit
  end

  private

  def instructor_params
    params.require(:instructor).permit( :name, :about, :photo ).merge(studio_id: current_studio.id)
  end

end
