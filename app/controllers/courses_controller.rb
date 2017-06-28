class CoursesController < ApplicationController
  after_action :verify_authorized
  # after_action :verify_policy_scoped

  before_action :set_course, only: [:show, :edit, :update, :destroy]



  def index
    @courses = Course.all
    @categories = Course::CATEGORIES


  end

  def new
    @establishment = Establishment.find(params[:establishment_id])
    @course = Course.new
    @course.establishment = @establishment
    @categories = Course::CATEGORIES
    authorize @course
  end


  def create
    @establishment = Establishment.find(params[:establishment_id])
    @course = Course.new(course_params)
    @course.establishment = @establishment

    authorize @course

    if @course.save
      redirect_to course_path(@course)

    else
      render :new
    end
  end

  def show
    @reviews = Review.where(course_id: @course.id)
    @hash = Gmaps4rails.build_markers(@course.establishment) do |establishment, marker|
      marker.lat establishment.latitude
      marker.lng establishment.longitude
    end
    @mapping = Course::CATEGORIES_MAPPING
  end



  def destroy
    @course = Course.all
    @course.destroy!
    redirect_to "pages#home"

  end

  def update

    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to course_path
    else
      render :edit
    end


  end

  def edit
    @course = Course.find(params[:id])
  end

  private

  def set_course
    @course = Course.find(params[:id])
    authorize @course
  end

  def course_params
    params.require(:course).permit(:title, :establishment_id, :category, :price, :description, photos: [] )
  end

end
