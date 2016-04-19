class FriendsController < ApplicationController


	def friend_request
	    user_destiny = User.find(params[:user])
	    friend = Friend.new
	    friend.destiny_id = user_destiny.id
	    friend.requester_id = current_user.id
	    friend.status = 0
	    friend.save
	    redirect_to root_path
	end

	def accept_request
		friend = Friend.find(params[:friend])
		friend.status = 1
		friend.save
	    redirect_to root_path
  	end

  	def cancel_request
		requester = User.find(params[:requester])
		destiny = User.find(params[:destiny])
		status = User.find(params[:status])
		friend = Friend.where(requester_id: requester, destiny_id: destiny, status: status)
		friend.delete
	    redirect_to root_path
 	 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:requester_id, :destiny_id, :status)
    end
end
