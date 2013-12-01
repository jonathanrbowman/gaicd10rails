class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create

    @task_number = Task.all.pluck(:position).uniq.count
    @task_number_result = @task_number + 1
    if params[:task][:position].to_i > 0 && params[:task][:position].to_i <= @task_number_result

      @task_list = Task.where('position >= ?', params[:task][:position])
      @task_id = @task_list.pluck(:id)
      @user_list = User.all
      @user_id = @user_list.pluck(:id)

      @task_id.each do |x|
        y = Task.find(x).position
        y = y + 1
        Task.find(x).update_attributes(:position => y)
      end

      @user_id.each do |x|
        Task.create(:position =>  params[:task][:position], :title =>  params[:task][:title], :description =>  params[:task][:description], :user_id => x)
      end

      flash[:notice] = 'Successfully made'
      redirect_to tasks_path

    else

      flash[:notice] = 'Could not create'
      redirect_to tasks_path

    end

  end

  # PATCH/PUT /tasks/1
  def update
    
    @task_from = params[:task][:position_from]
    @task_to = params[:task][:position]
    
    redirect_to tasks_path

  end

  # DELETE /tasks/1
  def destroy

    @position_number = Task.where('id = ?', params[:id]).pluck(:position)
    @task_list = Task.where('position > ?', @position_number)
    @task_id = @task_list.pluck(:id)
    @tasks_to_destroy = Task.where('position = ?', @position_number).pluck(:id)
    

      @task_id.each do |x|
        y = Task.find(x).position
        Task.find(x).update_attributes(:position => y - 1)
      end
      
      @tasks_to_destroy.each do |x|
        Task.destroy(x)
      end

    redirect_to tasks_path

  end

  def status_change
    @task = Task.find(params[:id])
    if @task.status == false
      @task.update_attributes(:status => true)
    else
      @task.update_attributes(:status => false)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:position, :title, :description)
  end
end
