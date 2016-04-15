class TopicsController < ApplicationController
before_action :set_topic_id, only: [:show_topic]
  def index
    project = Project.find(params[:id])
    @topics = project.topics
  end

def new
	@topic = Topic.new
	@project = params[:id]
end

def new_post
  @post = Post.new
  @topic = params[:id_topic]
end


def show_topic
end


def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    project = Project.find(@topic.project_id)
    respond_to do |format|
      if @topic.save
        format.html { redirect_to list_topics_path(project), notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: project}
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

def create_post
  @post = Post.new(post_params)
  @post.user_id = current_user.id
  topic = Topic.find(@post.topic_id)
  respond_to do |format|
    if @post.save
      format.html { redirect_to controller: 'topics', action: 'show_topic', id: @post.topic.project.id, id_topic: @post.topic.id, notice: 'Post was successfully created.' }
      format.json { render :show, status: :created, location: topic}
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

     def set_topic_id
      @topic = Topic.find(params[:id_topic])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:topic_title, :description, :user_id, :project_id)
    end

    def post_params
      params.require(:post).permit(:description, :user_id, :topic_id)
    end
end
