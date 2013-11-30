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

    @task_number = Task.all.pluck(:step).uniq.count
    @task_number_result = @task_number + 1
    if params[:task][:step].to_i > 0 && params[:task][:step].to_i <= @task_number_result
     

    @task_list = Task.where('step >= ?', params[:task][:step])
    @task_id = @task_list.pluck(:id)
    @user_list = User.all
    @user_id = @user_list.pluck(:id)

    @task_id.each do |x|
      y = Task.find(x).step
      y = y + 1
      Task.find(x).update_attributes(:step => y)
    end

    @user_id.each do |x|
      Task.create(:step =>  params[:task][:step], :title =>  params[:task][:title], :description =>  params[:task][:description], :user_id => x)
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
    @task_from = Task.find(params[:id]).step
    @task_to = params[:task][:step]
    
    if @task_from > @task_to
    @tasks_to_change = [@task_from...@task_to]    
    @tasks_to_change.each do |x|
      x = x + 1
      self.update_attributes(:step => x)   
      end   
    end
    
    if @task_from < @task_to
      @tasks_to_change = [@task_to...@task_from]
      @tasks_to_change.each do |x|
      x = x - 1
      self.update_attributes(:step => x)
      end
      end
    
    @task_list = Task.where('step >= ?', params[:task][:step])
    @task_id = @task_list.pluck(:id)
    @user_list = User.all
    @user_id = @user_list.pluck(:id)

    @task_id.each do |x|
      y = Task.find(x).step
      y = y - 1
      Task.find(x).update_attributes(:step => y)
    end

    @user_id.each do |x|
      Task.update_attributes(:step =>  params[:task][:step], :title =>  params[:task][:title], :description =>  params[:task][:description], :user_id => x)
    end

    redirect_to tasks_path
  end

  # DELETE /tasks/1
  def destroy
    @step_number = Task.where('id = ?', params[:id]).pluck(:step)
    @task_list = Task.where('step >= ?', @step_number)
    @task_id = @task_list.pluck(:id)
    @user_list = User.all
    @user_id = @user_list.pluck(:id)

    @task_id.each do |x|
      y = Task.find(x).step
      y = y - 1
      Task.find(x).update_attributes(:step => y)
    end

    @user_id.each do
      Task.destroy(params[:id])
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
    params.require(:task).permit(:step, :title, :description)
  end
end
