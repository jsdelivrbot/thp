class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :sanitize_devise_parameters, if: :devise_controller?

  def sanitize_devise_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:address])
  end
end
