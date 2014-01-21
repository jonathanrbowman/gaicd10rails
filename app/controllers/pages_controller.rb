class PagesController < ApplicationController
  def home
  end
  
  def create_admin_user_from_homepage
    @homepage_fname = params[:homepage_fname]
    @homepage_lname = params[:homepage_lname]
    @homepage_organization = params[:homepage_organization]
    @homepage_email = params[:homepage_email]
    @homepage_password = params[:homepage_password]
    @homepage_password_confirm = params[:homepage_password_confirm]
    @homepage_phone = params[:homepage_phone]
    
    if @homepage_fname == "" || @homepage_lname == "" || @homepage_organization == "" || @homepage_email == "" || @homepage_password == "" || @homepage_password_confirm == "" || @homepage_phone == ""
      flash[:notice] = "All fields are required. Please try again."
      redirect_to request.referrer
      return
    end
    
    unless @homepage_password.match(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/)
      flash[:notice] = "Your password needs to be 8 characters long and contain both a letter and a number."
      redirect_to request.referrer
      return
    end
    
    if @homepage_password != @homepage_password_confirm
      flash[:notice] = "Sorry, it doesn't look like your password matched the confirmation field!"
      redirect_to request.referrer
      return
    end
    
    @check_if_organization_exists = User.where('organization = ?', @homepage_organization).count
    @check_if_email_exists = User.where('email = ?', @homepage_email).count
    
    if @check_if_organization_exists >= 1
      flash[:notice] = "Sorry, this organization has already signed up. Contact us for more information."
      redirect_to request.referrer
      return
    end
    
    if @check_if_email_exists >= 1
      flash[:notice] = "Sorry, this email has already been used. Contact us for more information."
      redirect_to request.referrer
      return
    end
    
    User.create(:email => @homepage_email, :password => @homepage_password, :organization => @homepage_organization, :admin => true, :u_parent => @homepage_organization, :p_fname => @homepage_fname, :p_lname => @homepage_lname, :p_phone => @homepage_phone)
    
    Task.create([
    {:position => 1, :title => "Determine Executive Sponsor", :description => "The executive sponsor for the ICD-10 transition is typically the CFO, Revenue Cycle VP, or similar position. This person will be responsible for forming a team, securing funds, and supporting the project from the executive level.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 2, :title => "Determine Project Manager", :description => "One person needs to be responsible for the implementation of ICD-10. This person can delegate responsibilities, but ultimately it rests on his or her shoulders to execute. The project manager can be the head of the revenue cycle, the HIM director, or even the IT director.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 3, :title => "Form Project Team", :description => "The project team will consist of HIM Director, IT Director, Revenue Cycle Director, Nursing Director, Physician Liaison, Billing Office Manager, Physician Practice Manager, Quality Manager, Ancillary Directors, and any other department that utilizes or impacts ICD-9 data.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 4, :title => "Develop Communication Plan", :description => "For a video on how to develop a communication plan, click this link: http://www.youtube.com/watch?v=nXO65KrKNkc", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 5, :title => "Analyze Data Flow", :description => "Map the current data flow of your facility to find all uses of ICD-9 codes. Here is a template to get you started: https://db.tt/qllzYKK2", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 6, :title => "Develop Budget", :description => "Sample budget can be downloaded here: https://db.tt/XqaYDgTU", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 7, :title => "Engage Vendors", :description => "Sample spreadsheet to send to vendors can be found here: https://db.tt/6o3NghrB", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 8, :title => "Determine Training Needs of Staff", :description => "Sample training plan template found here: https://db.tt/hWKkymv7", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 9, :title => "Develop Coder Training Plan", :description => "This needs to be done by the HIM director.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 10, :title => "Baseline Denials", :description => "List the top ten reasons why claims are denied. Use this information for coder training, physician education, and to monitor denials post go-live.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 11, :title => "Mitigate Risk for Drop in Coder Productivity", :description => "Discuss with the project team what mechanisms will be put in place to ease the blow of a 30% coder productivity loss. This will be from increased specificity of code selection, increased physician queries, and simply adapting to the new code set.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 12, :title => "Mitigate Risk for Financial Impact", :description => "How will the facility deal with an increased A/R time?", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 13, :title => "Mitigate Risk for Poor Documentation", :description => "Every facility has the risk that physicians will not document to the level required for ICD-10. Discuss with the project team this risk, and then develop a plan to mitigate it.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 14, :title => "Develop Physician Education Plan", :description => "Sample physician education plan can be found here: https://db.tt/22VdbRaH", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 15, :title => "Upgrade Encoder", :description => "Most encoders are now ICD-10 compliant.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 16, :title => "Upgrade EMR", :description => "Upgrade EMR to ICD-10 compliant version.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 17, :title => "Begin Dual Coding Charts", :description => "Coders will need to start coding charts in both ICD-9 (for current billing purposes) and ICD-10. Coding charts now in ICD-10 allows for coders to experience the new code set as well as determine deficiencies in current documentation practices.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 18, :title => "Upgrade Ancillary Applications", :description => "Upgrade all ancillary applications to ICD-10 compliant versions.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 19, :title => "Upgrade ED Application", :description => "Upgrade Emergency Department to ICD-10 compliant version.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 20, :title => "Upgrade Patient Access Applications", :description => "Upgrade patient access applications to ICD-10 compliant versions.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 21, :title => "Upgrade Physician Practice Software", :description => "If physician practices are managed, then their software will need to be upgraded.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 22, :title => "Upgrade Billing Software", :description => "Upgrade billing software to ICD-10 compliant version.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 23, :title => "Update and Test All Interfaces", :description => "Update all interfaces that use ICD-9 codes.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 24, :title => "Update All Databases", :description => "Update all databases and spreadsheets that use ICD-9 codes.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 25, :title => "Update All Reports", :description => "Update all reports that contain ICD-9 data. These reports can be tpyically be found in the Financial, Decision Support, and Quality Departments.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 26, :title => "Internally Test All Applications", :description => "Test internally all processes from physician order to claim submission.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 27, :title => "Ready for External Testing", :description => "Complete this task to confirm that your facility is ready for external testing.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 28, :title => "Complete External Testing", :description => "Complete this task to confirm that you have completed external testing will all external vendors that use ICD-10 codes.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 29, :title => "Educate Physicians on Documentation", :description => "Continue to educate physicians on new documentation requirements of ICD-10.", :user_id => User.last.id, :t_parent => @homepage_organization},
    {:position => 30, :title => "Create Go Live Plan", :description => "For October 1st, 2014 your facility will need to have a Go Live Plan in place. Who will be working with physicians? Who will be monitoring the interfaces? Who will be monitoring the denials? Who will be the ICD-10 superuser that the staff can go to if they have questions? These are just some of the questions that need to be in the Go Live Plan.", :user_id => User.last.id, :t_parent => @homepage_organization}
    ])
    
    flash[:notice] = "Your account has been successfully created! Use the 'Log In' button at the top right."
    redirect_to request.referrer
    
    UserNotifications.homepage_admin_created(@homepage_email, @homepage_fname, @homepage_password).deliver
    UserNotifications.homepage_admin_created_notify_admins(@homepage_email, @homepage_fname, @homepage_lname, @homepage_organization, @homepage_phone).deliver
    
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