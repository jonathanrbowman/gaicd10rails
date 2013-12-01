class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks, order: :position

  after_create :generate_tasks
  
  def generate_tasks
    
    @task_count = Task.all.pluck(:position).uniq.count
    @task_title = Task.all.pluck(:title).uniq
    @task_position = Task.all.pluck(:position).uniq
    @task_description = Task.all.pluck(:description).uniq
    @task_user = User.last.id

    @task_iterator = 0

    while @task_iterator < @task_count
      Task.create(:position =>  @task_position[@task_iterator], :title =>  @task_title[@task_iterator], :description =>  @task_description[@task_iterator], :user_id => @task_user)
      @task_iterator += 1
    end
    
  end

end
