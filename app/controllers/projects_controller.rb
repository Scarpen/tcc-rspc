class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :request_list, :edit, :update, :destroy, :about, :members]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    if params['search-input']
      @projects = Project.search(params['search-input']).order("created_at DESC")
    else
      @projects = Project.all.order('created_at DESC')
    end
  end

  def search_result
    @users = User.all.order('name ASC')
    @projects = Project.all.order('name ASC')
    if params['search-input']
      @users = User.search(params['search-input']).order('name ASC')
      @projects = Project.search(params['search-input']).order('name ASC')
    else
      @users = User.all.order('name ASC')
      @projects = Project.all.order('name ASC')
    end
  end

  def list_projects
    @projects = current_user.projects
    @myprojects = Project.where(creator_id: current_user.id)
  end

  def accept_request
    member = Member.find(params[:member])
    member.situation = 1
    project = Project.find(member.project_id)
    user = User.find(member.user_id)
    member.save
    member.create_activity(:accept_request, :owner => user)
    redirect_to memebers_project_path(project)
  end

  def refuse_request
    member = Member.find(params[:member])
    project = Project.find(member.project_id)
    member.delete
    redirect_to memebers_project_path(project)
  end

  def without_project
    
  end


  def send_request
    project = Project.find(params[:project])
    member = Member.where(project_id: project.id, user_id: current_user.id, situation: 2).first

    if member
      member.situation = 3
      member.save
      member.create_activity(:send_request, :owner => User.find(project.creator_id))
      flash[:success] = 'Sua solicitação foi enviada!'
      redirect_to project
    else
      member = Member.new
      member.project_id = project.id
      member.user_id = current_user.id
      member.save
      member.create_activity(:send_request, :owner => User.find(project.creator_id) )
      flash[:success] = 'Sua solicitação foi enviada!'
      redirect_to project
    end
  end


  def follow
    project = Project.find(params[:project])
    member = Member.new
    member.project_id = project.id
    member.user_id = current_user.id
    member.situation = 2
    member.save
    member.create_activity(:follow, :owner => User.find(project.creator_id))
    
    flash[:success] = 'Você está seguindo esse projeto!'
    redirect_to project_path(project)
  end

  def unfollow
    project = Project.find(params[:project])
    Member.where(project_id: project.id, user_id: current_user.id).each do |member|
      if member.situation == 2
        member.delete
        flash[:success] = 'Você não está mais seguindo este projeto!'
        redirect_to project_path(project)
      elsif member.situation == 3
        member.situation = 0
        member.save
        flash[:success] = 'Você não está mais seguindo este projeto!'
        redirect_to project_path(project)        
      end
    end
  end

  def share_publication
    publication = Publication.find(params[:publication])
    share = Share.new
    share.publication_id = publication.id
    share.user_id = current_user.id
    share.save
    flash[:success] = 'Esta publicação foi compartilhada com sucesso!'
    redirect_to projects_path(publication.project_id)
  end
  # GET /projects/1
  # GET /projects/1.json
  def show

    if current_user
      @publication = Publication.new
      @comment = Comment.new
    end

  end  

  def request_list 

  end

  def about

  end

  def members 

  end
  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # Project /projects
  # Project /projects.json
  def create
    @users = User.all
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


        user_verification = 0
        @users.each do |user|
          if current_user.id != user.id 
            user.interests.each do |interest|
              @project.interests.each do |p_interest|
                if interest.id == p_interest.id
                  if user_verification != user.id
                    user_verification = user.id
                    @project.create_activity(:create, :owner => user)
                   end
                end
              end
            end
          end
        end

        member.project_id = @project.id
        member.save
        format.html { redirect_to about_project_path(@project), notice: 'Projeto criado com sucesso.' }
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
        format.html { redirect_to about_project_path(@project), notice: 'Projeto atualizado com sucesso.' }
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
      format.html { redirect_to projects_url, notice: 'Projeto excluído com sucesso.' }
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
      params.require(:project).permit(:name, :creator_id, :description, :phase, :avatar, :date_time_start, :date_time_end, :place, :visible_project, :ability_ids => [], :interest_ids => [])
    end
end
