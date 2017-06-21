class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @establishment = Establishment.find(params[:establishment_id])
    @course = Course.new
    @categories = %w(free-time sports programming languages cooking enterteinment art other)
  end


  def create
    @establishment = Establishment.find(params[:establishment_id])
    @course = Course.new(course_params)
    @course.establishment = @establishment
     if @course.save
      redirect_to course_path(@course)

    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
    @reviews = Review.where(course_id: @course.id)

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
    params.require(:course).permit(:title, :establishment_id, :category, :price, :description, photos: [] )
  end

end
