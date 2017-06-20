class ReviewsController < ApplicationController
  def index
    @appointment = Appointment.find(params[:appointment_id])
    @reviews = Review.all
  end

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @appointment = Appointment.find(params[:appointment_id])
    @review.appointment = @appointment
    @review.course = @appointment.course
    #@review.user = current_user

    if @review.save
      redirect_to  appointment_reviews_path(@appointment)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars, :user_id, :appointment_id)
  end

end



