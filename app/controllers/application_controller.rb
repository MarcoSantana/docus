class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_paper_trail_whodunnit




  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :last_name, :avatar, :universities_attributes)
  end


end
