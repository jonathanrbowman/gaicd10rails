class PagesController < ApplicationController
  def home
  end
  
  def submit_contact_request
    if params[:contact_email] != nil
    @contact_result = params[:contact_email]
    UserNotifications.new_signup(@contact_result).deliver
    else
      return
    end
  end
  
end