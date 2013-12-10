class ApplicationController < ActionController::Base
  
  require 'rails_autolink'
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!
  
  def after_sign_in_path_for(resource_or_scope)
    if current_user.admin?
      admin_view_path
    else
      tasks_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :organization
    devise_parameter_sanitizer.for(:sign_up) << :u_state
    devise_parameter_sanitizer.for(:sign_up) << :p_fname
    devise_parameter_sanitizer.for(:sign_up) << :p_lname
    devise_parameter_sanitizer.for(:sign_up) << :p_phone
    devise_parameter_sanitizer.for(:sign_up) << :s_fname
    devise_parameter_sanitizer.for(:sign_up) << :s_lname
    devise_parameter_sanitizer.for(:sign_up) << :s_email
    devise_parameter_sanitizer.for(:sign_up) << :s_phone
    devise_parameter_sanitizer.for(:account_update) << :organization
    devise_parameter_sanitizer.for(:account_update) << :u_state
    devise_parameter_sanitizer.for(:account_update) << :p_fname
    devise_parameter_sanitizer.for(:account_update) << :p_lname
    devise_parameter_sanitizer.for(:account_update) << :p_phone
    devise_parameter_sanitizer.for(:account_update) << :s_fname
    devise_parameter_sanitizer.for(:account_update) << :s_lname
    devise_parameter_sanitizer.for(:account_update) << :s_email
    devise_parameter_sanitizer.for(:account_update) << :s_phone
  end

  protect_from_forgery with: :exception

end
