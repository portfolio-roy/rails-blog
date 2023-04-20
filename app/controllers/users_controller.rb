class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if request.path == destroy_user_session_path
      sign_out(current_user)
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end
end



