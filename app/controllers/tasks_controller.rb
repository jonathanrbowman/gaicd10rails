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
    
    @tasks_by_state = Task.where('t_state = ?', current_user.u_state)
    @task_number = @tasks_by_state.pluck(:position).uniq.count
    @task_number_result = @task_number + 1
    if params[:task][:position].to_i > 0 && params[:task][:position].to_i <= @task_number_result

      @task_list = @tasks_by_state.where("position >= #{params[:task][:position]}")
      
      #@task_list = Task.where("position >= #{params[:task][:position]} AND t_state = #{current_user.u_state}")
      @task_id = @task_list.pluck(:id)
      @user_list = User.where('u_state = ?', current_user.u_state)
      @user_id = @user_list.pluck(:id)

      @task_id.each do |x|
        y = Task.find(x).position
        y = y + 1
        Task.find(x).update_attributes(:position => y)
      end

      @user_id.each do |x|
        Task.create(:position =>  params[:task][:position], :title =>  params[:task][:title], :description =>  params[:task][:description], :user_id => x, :t_state => current_user.u_state)
      end

      flash[:notice] = 'Successfully made'
      redirect_to request.referrer

    else

      flash[:notice] = 'Please make sure you entered a step that is either next in line or greater than 0.'
      redirect_to request.referrer

    end

  end

  # PATCH/PUT /tasks/1
  def update
    
    @tasks_by_state = Task.where('t_state = ?', current_user.u_state)
    @task_from = params[:task][:position_from].to_i
    @task_to = params[:task][:position].to_i
    @tasks_to_update = @tasks_by_state.where('position = ?', @task_from).pluck(:id)
    @task_count = @tasks_by_state.pluck(:position).uniq.count
    
    if @task_to > 0 && @task_to <= @task_count

    if @task_from > @task_to
      @task_list_id = @tasks_by_state.where("position >= #{@task_to} AND position < #{@task_from}").pluck(:id)
      @task_list_id.each do |x|
        y = Task.find(x).position
        Task.find(x).update_attributes(:position => y + 1)
      end
    elsif @task_from < @task_to
      @task_list_id = @tasks_by_state.where("position <= #{@task_to} AND position > #{@task_from}").pluck(:id)
      @task_list_id.each do |x|
        y = Task.find(x).position
        Task.find(x).update_attributes(:position => y - 1)
      end
    else
    end

    @tasks_to_update.each do |x|
      Task.find(x).update_attributes(:position => @task_to, :title => params[:task][:title], :description => params[:task][:description])
    end

    redirect_to request.referrer
    
    else
      flash[:notice] = 'The step number can only be changed to a spot that already exists. Use New Task to add another step.'
      redirect_to request.referrer
    end

  end

  # DELETE /tasks/1
  def destroy
    
    @tasks_by_state = Task.where('t_state = ?', current_user.u_state)
    @position_number =  @tasks_by_state.where('id = ?', params[:id]).pluck(:position)
    @task_list =  @tasks_by_state.where('position > ?', @position_number)
    @task_id = @task_list.pluck(:id)
    @tasks_to_destroy = @tasks_by_state.where('position = ?', @position_number).pluck(:id)

    @task_id.each do |x|
      y = Task.find(x).position
      Task.find(x).update_attributes(:position => y - 1)
    end

    @tasks_to_destroy.each do |x|
      Task.destroy(x)
    end

    redirect_to request.referrer

  end

  def status_change
    @task = Task.find(params[:id])
    if @task.status == false
      @task.update_attributes(:status => true)
    else
      @task.update_attributes(:status => false)
    end
    redirect_to request.referrer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:position, :title, :description, :status, :t_state)
  end
end
