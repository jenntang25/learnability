class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :set_user, only: [:show]
  def show
  end
  def set_user
      @user = User.find(params[:id])
    end
end
