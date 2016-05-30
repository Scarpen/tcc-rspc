class UsersController < ApplicationController
  before_filter :authenticate_user!

	def index
		@users = User.all

    @users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @conversations = Conversation.involving(current_user).order("created_at DESC")
    @comment = Comment.new
	end

  def notifications
    
  end

  def messages
    
  end

  def close_window  
    user = User.find(current_user.id)
    user.status = "Offline"
    user.save
  end

  def about
    @user = User.find(params[:id])
  end

  def friends
    @user = User.find(params[:id])
  end

  def projects
    @user = User.find(params[:id])
  end

  def list_abilities_interests
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :gender, :avatar, :phone, :status, :date_birthday,:city, :state)
    end
end