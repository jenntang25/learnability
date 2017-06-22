class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.where(user_id: current_user.id )
  end

  def new
    @course = Course.find(params[:course_id])
    @appointment = Appointment.new

  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
  end

  def update
  end

  def edit
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :description, :course_id)
  end
end


