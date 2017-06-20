class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new

  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.date = appointment_params[:date]
    #.to_date   (?)
    @appointment.user = current_user
    @appointment.course = @course
    if @appointment.save
      redirect_to courses_path
    else
          redirect_to courses_path
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

  private

  def appointment_params
    params.require(:appointment).permit(:course_id, :user_id)
  end
end


