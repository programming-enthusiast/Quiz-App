class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  protect_from_forgery with: :exception

  def after_sign_up_path_for(*)
    root_path
  end

  def after_sign_in_path_for(*)
    root_path
  end

  def after_sign_out_path_for(*)
    new_user_session_path
  end

  private

  def authenticate_admin!
    redirect_to root_url, alert: 'Access denied.' unless current_user.try(:is_teacher?)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :is_teacher])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :is_teacher])
  end
end
