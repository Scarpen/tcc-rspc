class PublicationsController < ApplicationController
	before_action :set_publication, only: [:show, :request_list, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit_comment, :destroy_comment]

  def new
		@publication = Publication.new
    @project = params[:id]
	end

  def create
    @publication = Publication.new(publication_params)
    @publication.user_id = current_user.id
    respond_to do |format|
      if @publication.save

        @publication.project.users.each do |member|
          if current_user.id != member.id 
           @publication.create_activity(:create, :owner => member)
         end
        end

        format.html { redirect_to @publication.project, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication.project, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    project = @publication.project
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to project, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def new_comment
    @comment = Comment.new
    @project = params[:id_project]
    @publication = params[:id_publication]
  end

  def create_comment
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    publication = Publication.find(@comment.publication_id)
    respond_to do |format|
      if @comment.save

        @comment.publication.project.users.each do |member|
          if member.id != current_user.id
           @comment.create_activity(:create_comment, :owner => member)
         end
        end

        format.html { redirect_to project_path(publication.project_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment}
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_comment
    @comment = Comment.find(params[:id])
    @project = params[:id_project]
    @publication = params[:id_publication]
  end

  def update_comment
    @comment = Comment.find(params[:id])
    publication = Publication.find(@comment.publication_id)
    @comment.update(comment_params)
    redirect_to project_path(publication.project_id), notice: 'Comment was successfully updated.'
  end

  def destroy_comment
    @comment = Comment.find(params[:id])
    publication = Publication.find(@comment.publication_id)
    @comment.destroy
    redirect_to project_path(publication.project_id), notice: 'Comment was successfully destroyed.'
  end 

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def publication_params
      params.require(:publication).permit(:description, :user_id, :project_id, :image)
    end
    
    def comment_params
      params.require(:comment).permit(:description, :user_id, :publication_id, :project_id)
    end
end
