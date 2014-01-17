class UserNotifications < ActionMailer::Base
  
  def new_user_created(resource, current_user)
    
  @resource = resource
  @current_user = current_user
    
    mail :subject => "Welcome to ICD-10 PM",
         :to      => @resource.email,
         :from    => @current_user.email
  end
  
  def new_signup(contact_result)
    
    @contact_result = contact_result
    
    mail :subject => "Contact Requesting Information",
         :to      => ("kprather@smalljumps.com, jonathan@bestpracticestore.com, twallace@smalljumps.com"),
         :from    => "support@smalljumps.com"
  end
  
end