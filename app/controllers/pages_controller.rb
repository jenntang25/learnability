class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    if params[:search_value]

    @courses= Course.search(params[:search_value])

    elsif params[:search_value] == nil
    @establishment = Establishment.all
   @courses = Course.all
   end
  end
end

