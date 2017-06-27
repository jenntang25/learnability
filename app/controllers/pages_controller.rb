class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @establishments = Establishment.all
    @courses = Course.all
    @categories = Course::CATEGORIES


    @mapping = {
      "education" => "fa flask fa-5x",
       "Sports" => "fa fa-futbol-o fa-5x",
      "business" => "fa fa-line-chart fa-5x",
       "Cooking" => "fa fa-cutlery fa-5x",
       "Health" => "fa fa-heartbeat fa-5x",
       "Technology" => "fa fa-code fa-5x",
       "Music" => "fa fa-play fa-5x",
       "Photography" => "ffa a-camera-retro fa-5x",
       "Entertainment" => "fa fa-glass fa-5x",
       "Languages" => "fa hide fa-5x",
       "Leisure" => "fa fa-glass fa-5x",
       "Programming" => "fa fa-code fa-5x",
       "Art" => "fa fa-paint-brush fa-5x",
       "Other" => "fa hide fa-5x",
       }




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

