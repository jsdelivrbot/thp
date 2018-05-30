class UsersController < ApplicationController
  before_action :login_required, except:[:new,:create]

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Event APP!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:id, :name, :email, :password_digest)
  end

end
