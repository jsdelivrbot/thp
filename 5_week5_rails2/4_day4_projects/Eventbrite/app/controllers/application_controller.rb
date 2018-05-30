class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

def login_required
    if current_user.blank?
        redirect_to('/') 
        flash[:danger]="Log in first to access your user page"
    end
  end
end
