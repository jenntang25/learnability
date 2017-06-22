class UsersController < ApplicationController
  skip_before_action :authenticate_user!


 def edit
 end


  def update
    current_user.update(params_user)
    redirect_to user_path(current_user)
  end

  def show
    @user = current_user
  end


  def params_user
    params.require(:user).permit!
  end
end
