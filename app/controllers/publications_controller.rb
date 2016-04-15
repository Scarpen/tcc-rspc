class PublicationsController < ApplicationController
	before_action :set_publication, only: [:show, :request_list, :edit, :update, :destroy]

	def new
		@publication = Publication.new
    @project = params[:id]
	end

  def create
    @publication = Publication.new(publication_params)
    @publication.user_id = current_user.id

    respond_to do |format|
      if @publication.save
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




	private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:description, :user_id, :project_id, :image)
    end

end
