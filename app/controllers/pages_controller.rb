class PagesController < ApplicationController
  def home
  end
  
  def submit_contact_request
    @contact_result = params[:contact_email]
    UserNotifications.new_signup(@contact_result).deliver
  end
  
end