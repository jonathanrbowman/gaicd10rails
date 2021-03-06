class ApplicationController < ActionController::Base
  
  require 'rails_autolink'

  before_filter :configure_permitted_parameters, if: :devise_controller?
 # before_filter :authenticate_user!
  
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
  
  def test_if_user_signed_in
    if user_signed_in?
    else
      redirect_to new_user_session_path, :notice => "Please make sure you are signed in to access this application."
    end
  end
  
  def test_if_user_signed_in_and_is_admin
    if user_signed_in? && current_user.admin?
    else
      redirect_to new_user_session_path, :notice => "Please sign in and make sure you have administrative access to view this page."
    end
  end
  
  def test_if_user_signed_in_and_owns_task
    if user_signed_in? && current_user.id == Task.find(params[:id]).user_id
    else
      redirect_to "/"
    end
  end
  
  def test_if_user_signed_in_and_owns_issue
    if user_signed_in? && current_user.id == Issue.find(params[:id]).user_id
    else
      redirect_to "/"
    end
  end
  
  def test_if_user_signed_in_and_owns_task_or_is_admin
    if user_signed_in? && (current_user.id == Task.find(params[:id]).user_id || current_user.admin?)
    else
      redirect_to new_user_session_path, :notice => "Please make sure you are signed in and authorized to make changes."
    end
  end

  protected

  def configure_permitted_parameters
    
        devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:organization, :email, :password, :password_confirmation, :current_password, :u_parent, :p_fname, :p_lname, :p_phone, :s_fname, :s_lname, :s_email, :s_phone)
    end
    
        devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:user, :current_user, :organization, :email, :password, :password_confirmation, :current_password, :u_parent, :p_fname, :p_lname, :p_phone, :s_fname, :s_lname, :s_email, :s_phone)
    end
    
  end

  protect_from_forgery with: :exception

end
