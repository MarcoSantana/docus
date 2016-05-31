class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_paper_trail_whodunnit
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:account_update) { |u|
    u.permit(
      :name, :last_name, :email, :password, :password_confirmation, :current_password)
  }

  devise_parameter_sanitizer.permit(:sign_up) { |u|
    u.permit(
      :name, :last_name, :email, :password, :password_confirmation, :current_password)
  }
end


end
