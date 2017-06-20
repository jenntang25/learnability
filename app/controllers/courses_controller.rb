class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @establishment = Establishment.find(params[:establishment_id])
    @course = Course.new
  end


  def create
    @establishments = Establishment.find(params[:establishment_id])
    @course = Course.new(course_params)
     if @course.save
      redirect_to course_path(@course, @establishment)
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
    @review = Review.all

    #@reviews = @course.appointment.review
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy!
  end

  def update
    @course = Course.find(params[:id])
    @course.update
  end

  def edit

  end

  private

  def course_params
    params.require(:course).permit(:title, :category, :price, :description)
  end

end
