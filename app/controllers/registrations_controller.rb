class RegistrationsController < Devise::RegistrationsController
  private
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:email, :password, :password_confirmation, :name, :last_name, :avatar, :universities_attributes]
    devise_parameter_sanitizer.for(:account_update) << [:email, :password, :password_confirmation, :name, :last_name, :avatar, :universities_attributes]
    #devise_parameter_sanitizer.for(:edit) << [:email, :password, :password_confirmation, :name, :last_name, :avatar]
  end


  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :last_name, :avatar, :universities_attributes).permit(:universities_attributes)
  end
end
