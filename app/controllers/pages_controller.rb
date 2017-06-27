class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @establishments = Establishment.all
    @courses = Course.all
    @categories = Course::CATEGORIES


    @mapping = {
      "education" => "fa flask fa-2x",
       "Sports" => "fa fa-futbol-o fa-2x",
      "business" => "fa fa-line-chart fa-2x",
       "Cooking" => "fa fa-cutlery fa-2x",
       "Health" => "fa fa-heartbeat fa-2x",
       "Technology" => "fa fa-code fa-2x",
       "Music" => "fa fa-play fa-2x",
       "Photography" => "ffa a-camera-retro fa-2x",
       "Entertainment" => "fa fa-glass fa-2x",
       "Languages" => "fa hide fa-2x",
       "Leisure" => "fa fa-glass fa-2x",
       "Programming" => "fa fa-code fa-2x",
       "Art" => "fa fa-paint-brush fa-2x",
       "Other" => "fa hide fa-2x",
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

