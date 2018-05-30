class UsersController < ApplicationController
 before_action :validate_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "You are getting closer to the answer!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
end

