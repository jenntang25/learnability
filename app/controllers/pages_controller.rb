class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @establishments = Establishment.all
    @courses = Course.all
    @categories = Course::CATEGORIES



    if params[:search_value].present?
      @courses_value = Course.search(params[:search_value]).first(10)

      establishments = @courses_value.map { |document| document.searchable }

      establishments = establishments.map { |model|
        if model.is_a?(Establishment)
          model
        end

        if model.is_a?(Course)
          model.establishment
        end
      }.select { |i| i }

      @hash = Gmaps4rails.build_markers(establishments) do |esta, marker|
        marker.lat esta.latitude
        marker.lng esta.longitude
      end


    elsif params[:search_value] == nil
    end

  end

end

