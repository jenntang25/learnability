class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @course = Course.find(params[:course_id])

  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.date = appointment_params[:date].to_date
    @appointment.user = current_user
    @appointment.course = @course
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
  end

  def update
  end

  def edit
  end

  private

  def appointment_params
    params.require(:Appointment).permit(:course_id, :user_id)
  end
end


