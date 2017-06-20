class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @establishment = Establishment.find(params[:establishment_id])
    @course = Course.new
    raise
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

    #@review; a method (.where ?) to select only course reviews is still missing
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
    params.require(:course).permit(:title, :establishment_id, :category, :price, :description)
  end

end
