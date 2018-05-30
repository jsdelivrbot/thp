class UsersController < ApplicationController

	def new
		@user = User.new
		#@user=user_params
		#@user.save
		#redirect_to new_user_path
	end

	def create
		@user = User.new(user_params)
		#@user.username = params[:username]
		#@user.email = params[:email]
		#@user.bio = params[:bio]
        if @user.save
            redirect_to new_user_path
        else
            render 'new'
        end 
	end

	def edit
		@user = :current_user
		#@user.build
	end

	def update
		#@user.username = params[:username]
		#@user.email = params[:email]
		#@user.bio = params[:bio]
        @user = :current_user
        if @user.update(user_params)
            redirect_to user_path_edit
        else
            render 'edit'
        end 
	end

private
  def user_params
    params.require(:user).permit(:username, :email, :bio)
  end
end
