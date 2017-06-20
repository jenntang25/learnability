class ReviewsController < ApplicationController
  def index
    @appointment = Appointment.find(params[:appointment_id])
    @reviews = Review.where(:appointment_id)
  end

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new(review_params)
    @review.appointment = @Appointment
    @review.user = current_user
    if @review.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :appointment_id)
  end

end
