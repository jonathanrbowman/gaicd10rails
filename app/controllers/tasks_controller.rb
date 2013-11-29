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
    
      redirect_to tasks_path, notice: "Task was successfully created."
      
  end

  # PATCH/PUT /tasks/1
  def update
    respond_to do |format|
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render action: 'edit'
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      redirect_to tasks_url
    end
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
