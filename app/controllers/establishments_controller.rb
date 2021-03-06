class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]


  def index
    @establishments = Establishment.all
    @my_establishments = Establishment.where(user_id: current_user.id)
  end

  def new
    @user = current_user
    @establishment = Establishment.new
  end

  def new_teacher
    @user = current_user
    @establishment = Establishment.new
  end


  def show
    @courses = Course.all
    @my_courses = @courses.where(establishment_id: @establishment.id)
    @appointment = Appointment.where(course_id: current_user.establishment.courses)

  end

  def create
    @establishment = Establishment.new(establishment_params)
    @establishment.user = current_user

    if @establishment.save
      redirect_to establishment_path(@establishment)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @establishment.update(establishment_params)
      redirect_to establishment_path(@establishment)
    else
      render :edit
    end
  end

  def destroy
    @establishment.destroy
    @appointment = Appointment.where(course_id: current_user.establishment.courses)
    @appointment.destroy!
    redirect_to establishment_path(@establishment)
  end

  private

  def set_establishment
    @establishment = Establishment.find(params[:id])
  end


def establishment_params
  params.require(:establishment).permit!
  # params.require(:establishment).permit(:city, :country, :street, :postal_code, :description, :latitude, :longitude, :name, :photos)
end

end


