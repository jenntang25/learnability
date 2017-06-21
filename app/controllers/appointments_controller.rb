class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
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
    params.require(:appointment).permit(:date, :course_id, :description)
  end
end


