class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :request_list, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  def list_projects
    @projects = current_user.projects
    @myprojects = Project.where(creator_id: current_user.id)
  end

  def request_list 

  end

  def accept_request
    member = Member.find(params[:member])
    member.situation = 1
    project = Project.find(member.project_id)
    member.save
    redirect_to request_list_path(project)
  end

  def refuse_request
    member = Member.find(params[:member])
    project = Project.find(member.project_id)
    member.delete
    redirect_to request_list_path(project)
  end


  def send_request
    project = Project.find(params[:project])
    member = Member.new
    member.project_id = project.id
    member.user_id = current_user.id
    member.save
    redirect_to list_projects_projects_path
  end


  def follow
    project = Project.find(params[:project])
    member = Member.new
    member.project_id = project.id
    member.user_id = current_user.id
    member.situation = 2
    member.save
    redirect_to project_path(project)
  end

  def unfollow
    project = Project.find(params[:project])
    member = Member.where(project_id: project.id, user_id: current_user.id, situation: 2).first
    member.delete
    redirect_to project_path(project)
  end
  # GET /projects/1
  # GET /projects/1.json
  def show
    if current_user
      Member.where(project_id: @project.id, user_id: current_user.id).each do |p|
        @participate = p.situation
      end
    end
  end  

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.creator_id = current_user.id
    if @project.visible_project = "Privado"
      @project.visible_project = true
    else
      @project.visible_project = false
    end
    member = Member.new
    member.user_id = current_user.id
    member.situation = 1
    respond_to do |format|
      if @project.save
        member.project_id = @project.id
        member.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :creator_id, :description, :avatar, :date_time_start, :date_time_end, :place, :ability_ids => [], :interest_ids => [])
    end
end
