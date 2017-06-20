class CoursesController < ApplicationController
  def index
    @establishments = Establishment.all
    @courses = Course.where(establishment_id: @establishments.id)
  end

  def new
    @establishments = Establishment.find(params[:establishment_id])
    @course = Course.new
  end


  def create
    @establishments = Establishment.find(params[:establishment_id])
    @course = Course.new(course_params)
     if @course.save
      redirect_to course_path(@course) #probably will need @establishment in the argument
    else
      render :new
  end

  def show
    @course = Course.find(params[:id])
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
