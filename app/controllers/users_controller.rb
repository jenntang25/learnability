class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :set_user, only: [:show]


 def edit
    authorize @establishment
 end


  def update
    authorize @establishment
  end

  def show
  end


  def set_user
    @user = User.find(params[:id])
    authorize @user
    end
end
