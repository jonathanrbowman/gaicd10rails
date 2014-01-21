class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
         
  # def password_complexity
    # if password.present? and not password.match(/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/)
  # #  if password.match(/^(?=.*[^a-zA-Z])(?=.*[a-z])(?=.*[A-Z])\S{8,}$/)
      # else
      # errors.add :password, "must include at least one lowercase letter, one uppercase letter, one number, and be at least 8 characters in length."
    # end
  # end

  validate :organization, presence: true
  validate :p_fname, presence: true
  validate :p_lname, presence: true
  validate :p_phone, presence: true
 
  has_many :tasks, order: :position
  has_many :issues

  after_create :generate_tasks
  after_create :generate_issues
  
  before_destroy :destroy_users_tasks
  after_destroy :destroy_users_tasks
  
  def destroy_users_tasks
    @user_id = self.id
    @tasks_to_destroy = Task.where('user_id = ?', @user_id).pluck(:id)
    
    @tasks_to_destroy.each do |x|
      Task.destroy(x)
    end
    
  end

  def generate_tasks
    
    template_tasks = Task.where('t_parent = ?', User.last.u_parent).to_a.uniq { |task| task.position }

    template_tasks.each do |template_task|
      Task.create(:position =>  template_task.position,
        :title =>  template_task.title,
        :t_parent =>  self.u_parent,
        :description =>  template_task.description, 
        :user => self)
    end

  end
  
    def generate_issues
    
    template_issues = Issue.where('i_parent = ?', User.last.u_parent).to_a.uniq { |issue| issue.title }

    template_issues.each do |template_issue|
      Issue.create(
        :title =>  template_issue.title,
        :i_parent =>  self.u_parent, 
        :user => self)
    end

  end

end
