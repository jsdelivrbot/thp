class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  def login_required
    if !(mousaillon_signed_in?)
        flash.now[:danger] = "You need to register first you cheeky bastard"
        redirect_to root_path
    end
    mousaillon_signed_in?
  end

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  devise_parameter_sanitizer.permit(:sign_up, keys:[:sign_up_code])
  devise_parameter_sanitizer.permit(:account_update, keys:[:name])
end

end
