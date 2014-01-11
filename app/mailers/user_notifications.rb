class UserNotifications < ActionMailer::Base
  
  def new_user_created(resource, current_user)
    
  @resource = resource
  @current_user = current_user
    
    mail :subject => "Welcome to ICD-10 PM",
         :to      => @resource.email,
         :from    => @current_user.email
  end
  
end