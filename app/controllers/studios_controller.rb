class StudiosController < ApplicationController
  before_action :authenticate_studio!, :only => [:edit, :update, :schedule, :dashboard]
  def index
  end

  def show
    @studio = Studio.find params[:id]
  end

  def edit
    @studio = current_studio
  end

  def update
    @studio = current_studio
    if @studio.update_attributes studio_attributes
      redirect_to edit_studio_path(current_studio)
    else
      render :edit
    end
  end

  def dashboard
  end

  def schedule
  end

  protected

  def studio_attributes
    params.require(:studio).permit( :address1, :address2, :phone, :logo )
  end

end
