class CoursesController < ApplicationController
  after_action :verify_authorized
  # after_action :verify_policy_scoped

  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all

  end

  def new
    @establishment = Establishment.find(params[:establishment_id])
    @course = Course.new
    @course.establishment = @establishment

    @categories = %w(free-time sports programming languages cooking enterteinment art other)
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

    # @course_coordinates = { lat: @course.establishment.latitude, lng: @course.establishment.longitude }

    @hash = Gmaps4rails.build_markers(@course.establishment) do |establishment, marker|
      marker.lat establishment.latitude
      marker.lng establishment.longitude
    end
  end

  def index_my_courses
    @courses = Courses.all
    @my_courses = Course.where(user_id: current_user.id)
  end

  def destroy
    @course.destroy!
  end

  def update
    # @course.update
  end

  def edit

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
