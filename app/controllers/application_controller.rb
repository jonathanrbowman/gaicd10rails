class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
    before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :user_company
    devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:account_update) << :user_company
  end

protect_from_forgery with: :exception
  
  
end
