class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @establishments = Establishment.all
    @courses = Course.all
    @categories = Course::CATEGORIES

    if params[:search_value]
      @courses_value= Course.search(params[:search_value])
    elsif params[:search_value] == nil
    end

  end
end

