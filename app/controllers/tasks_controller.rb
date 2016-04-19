class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy]
	
	def new
		@task = Task.new
		@project = params[:id]
		@users = Project.find(params[:id]).users.includes(:members).where("situation = 1")

	end

    def create
	    @task = Task.new(task_params)
	    @task.user_id = current_user.id

	    respond_to do |format|
	      if @task.save
	        format.html { redirect_to @task.project, notice: 'Task was successfully created.' }
	        format.json { render :show, status: :created, location: @task }
	      else
	        format.html { render :new }
	        format.json { render json: @task.errors, status: :unprocessable_entity }
	      end
	    end
  	end

    def show
    end

    def edit
    end

    def update
    	  respond_to do |format|
	      if @task.update(task_params)
	        format.html { redirect_to @task.project, notice: 'Task was successfully updated.' }
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
	      format.html { redirect_to project, notice: 'Task was successfully destroyed.' }
	      format.json { head :no_content }
	    end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :user_id, :project_id, :location, :date_start, :date_end, :situation, :user_ids => [])
    end   
end      