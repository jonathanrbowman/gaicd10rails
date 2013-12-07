class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
         
  def password_complexity
    #  if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)
    if password.match(/^(?=.*[^a-zA-Z])(?=.*[a-z])(?=.*[A-Z])\S{8,}$/)
      else
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, one number, and be at least 8 characters in length."
    end
  end

  validates :organization, presence: true, uniqueness: true
  validates :p_fname, presence: true
  validates :p_lname, presence: true
  validates :p_phone, presence: true
  validate :password_complexity

  has_many :tasks, order: :position

  after_create :generate_tasks

  def generate_tasks
    tasks_by_state = Task.where('t_state = ?', User.last.u_state)
    task_count = tasks_by_state.pluck(:position).uniq.count
    task_title = tasks_by_state.pluck(:title).uniq
    task_position = tasks_by_state.pluck(:position).uniq
    task_description = tasks_by_state.pluck(:description).uniq

    task_iterator = 0

    while task_iterator < task_count
      Task.create(:position =>  task_position[task_iterator], :title =>  task_title[task_iterator], :description =>  task_description[task_iterator], :user => self, :t_state => User.last.u_state)
      task_iterator += 1
    end

  end

end
