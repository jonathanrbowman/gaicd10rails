class IssuesController < ApplicationController
  
  before_action :test_if_user_signed_in
  before_action :test_if_user_signed_in_and_owns_issue, only: [:show, :set_issue]
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :test_if_user_signed_in_and_is_admin, only: [:new, :create, :admin_issue_index]

  # GET /issues
  # GET /issues.json
  def index
    @issues = current_user.issues
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    
    if params[:issue][:title] == ''
      flash[:notice] = 'Please make sure you entered a title.'
    redirect_to request.referrer
    else
    

      @user_list = User.where('u_parent = ?', current_user.u_parent)
      @user_id = @user_list.pluck(:id)

      @user_id.each do |x|
        Issue.create(:title =>  params[:issue][:title], :user_id => x, :i_parent => current_user.u_parent)
      end

      flash[:notice] = 'Issue has been successfully created.'
    redirect_to request.referrer
end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    
        if params[:issue][:title] == ''
      flash[:notice] = 'Please make sure you entered a title.'
    redirect_to request.referrer
    else
    
    @issue_titles = Issue.where('title = ?', params[:issue][:title_from])
    @issues_by_parent = @issue_titles.where('i_parent = ?', current_user.u_parent).pluck(:id)

      @issues_by_parent.each do |x|
        Issue.find(x).update_attributes(:title =>  params[:issue][:title])
      end

      flash[:notice] = 'Issue has been successfully updated.'
    redirect_to request.referrer
    
    end
    
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end
  
def status_change
  
    @issue = Issue.find(params[:id])
    
     if @issue.status == false
      @issue.update_attributes(:status => true)
     else
       @issue.update_attributes(:status => false)
     end
     redirect_to issues_path
    
  end
  
  def admin_issue_index
    @parent_issues = Issue.where('i_parent = ?', current_user.u_parent).pluck(:title).uniq
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = current_user.issues.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :user_id, :status, :i_parent)
    end
end
