class UserNotifications < ActionMailer::Base
  
  def new_user_created(resource, current_user)
    
  @resource = resource
  @current_user = current_user
    
    mail :subject => "Welcome to ICD-10 PM",
         :to      => @resource.email,
         :from    => @current_user.email
  end

  def homepage_admin_created(homepage_email, homepage_fname, homepage_password)
    
    @homepage_email = homepage_email
    @homepage_fname = homepage_fname
    @homepage_password = homepage_password
    
    mail :subject => "Welcome to ICD-10 PM!",
         :to      => @homepage_email,
         :from    => "support@smalljumps.com"
  end
  
  def homepage_admin_created_notify_admins(homepage_email, homepage_fname, homepage_lname, homepage_organization, homepage_phone)
    
    @homepage_email = homepage_email
    @homepage_fname = homepage_fname
    @homepage_lname = homepage_lname
    @homepage_organization = homepage_organization
    @homepage_phone = homepage_phone
    
    mail :subject => "New User Signed up from Homepage",
         :to      => ("kprather@smalljumps.com, jonathan@bestpracticestore.com, twallace@smalljumps.com"),
         :from    => "support@smalljumps.com"
  end
  
end