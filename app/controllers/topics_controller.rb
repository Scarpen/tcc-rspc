class TopicsController < ApplicationController

  def index

  end


def new
	@topic = Topic.new
	@project = params[:id]
end

def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.date_created = Time.now
    project = Project.find(@topic.project_id)
    respond_to do |format|
      if @topic.save
        format.html { redirect_to project, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: project}
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:topic_title, :description, :user_id, :project_id)
    end

end
