module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    flash[:info] = "You successfully logged in"
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

    # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
    flash[:info] = "You successfully logged out"
  end
  
  #Only logged in users can go to profile page
    def validate_user 
      if !(logged_in?)
        redirect_to root_path
        flash[:warning] = "Log in to see profile page"
      elsif !(current_user[:id].to_s == params[:id])
        flash[:warning] = "Only a logged in user can see its profile page"
        redirect_to root_path
      end
    end

end