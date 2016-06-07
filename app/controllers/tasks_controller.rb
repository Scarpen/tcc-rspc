class TasksController < ApplicationController
	before_action :set_task, only: [:update, :destroy]
	
	def new
		@task = Task.new
		@project = params[:id]
		@users = Project.find(params[:id]).users.includes(:members).where("situation = 1")

	end

	def index
		@project = Project.find(params[:id])
		@users = @project.users.includes(:members).where("situation = 1")
		@tasks = @project.tasks
		@task = Task.new
	end

	

    def create
	    @task = Task.new(task_params)
	    @task.user_id = current_user.id

	    respond_to do |format|
	      if @task.save

	      	@task.project.members.each do |member|
	      		if current_user.id != member.user_id
	      			Assist.where(task_id: @task.id).each do |assist|
	      				if assist.user_id == member.user_id
	      					@task.create_activity(:invite_task, :owner => User.find(assist.user_id))	
	      				elsif assist.user_id != member.user_id
	      					@task.create_activity(:create, :owner => User.find(member.user_id))
	      				end
	      			end
	      		end
	      	end

	        format.html { redirect_to list_tasks_path(@task.project.id), notice: 'Tarefa criada com sucesso.' }
	        format.json { render :show, status: :created, location: @task }
	      else
	        format.html { render :new }
	        format.json { render json: @task.errors, status: :unprocessable_entity }
	      end
	    end
  	end



    def edit
    	  @task = Task.find(params[:id_task])
    	  @users = Project.find(params[:id]).users.includes(:members).where("situation = 1")
    end

    def accept
	    assist = Assist.find(params[:id_assist])
	    assist.status = 1
	    assist.save
	    redirect_to root_path
    end

	def quit_request
		assist = Assist.find(params[:id_assist])
		assist.reason = params[:assist][:reason]
		assist.status = 3
		assist.save
		redirect_to assist.task.project
	end

	def enter_request
		assist = Assist.new
		assist.user_id = current_user.id
		assist.task_id = params[:id_task]
		assist.status = 2
		assist.save
		redirect_to assist.task.project
	end

	def quit_accept
		assist = Assist.find(params[:id_assist])

		project = assist.task.project
		assist.destroy
		redirect_to project

	end

	def quit_refuse
		assist = Assist.find(params[:id_assist])
		assist.status = 1
		assist.save
		redirect_to assist.task.project

	end

	def refuse
		assist = Assist.find(params[:id_assist])
		project = assist.task.project
		assist.destroy
		redirect_to project

	end

    def update
    	  respond_to do |format|
	      if @task.update(task_params)
	        format.html { redirect_to list_tasks_path(@task.project.id), notice: 'Tarefa atualizada com sucesso.' }
	        format.json { render :show, status: :ok, location: @task }
	      else
	        format.html { render :edit }
	        format.json { render json: @task.errors, status: :unprocessable_entity }
	      end
	    end
    end


    def destroy
	    project = @task.project
	    @task.destroy
	    respond_to do |format|
	      format.html { redirect_to project, notice: 'Tarefa excluída com sucesso.' }
	      format.json { head :no_content }
	    end
    end

    def show
    	@task = Task.find(params[:id_task])
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :user_id, :project_id, :location, :date_start, :date_end, :situation,:reason, :user_ids => [])
    end   
end      