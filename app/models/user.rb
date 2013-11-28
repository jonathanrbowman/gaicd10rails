class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks

  after_create :generate_tasks
  
  def generate_tasks    
    
    @user = User.last.id
    
    Task.create(:step => 1, :title => "First task", :description => "First task description", :user_id => @user )
    Task.create(:step => 2, :title => "Second task", :description => "Second task description", :user_id => @user )
    Task.create(:step => 3, :title => "Third task", :description => "Third task description", :user_id => @user )
    Task.create(:step => 4, :title => "Fourth task", :description => "Fourth task description", :user_id => @user )
    Task.create(:step => 5, :title => "Fifth task", :description => "Fifth task description", :user_id => @user )
  end

end
