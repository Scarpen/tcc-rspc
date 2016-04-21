class FriendsController < ApplicationController
	before_action :set_friend, only: [:destroy]
	def index
	end

	def friend_request
	    user_friend = User.find(params[:user])
	    #Criando a solicitação de amizade do usuário on-line
	    friend = Friend.new
	   	friend.user_id = current_user.id
	    friend.friend_id = user_friend.id
	    friend.status = 'request'
	    friend.save

	    #Criando a solicitação de amizade que fica pendente da
	    #aprovação do outro usuário
	    friend2 = Friend.new
	    friend2.user_id = user_friend.id
	    friend2.friend_id = current_user.id
	    friend2.status = 'pending'
	    friend2.save
	    redirect_to users_path
	end

	def accept_request
		friend = Friend.find(params[:friend])
		friend.status = 'accept'
		

		friendship = Friend.where(user_id: friend.friend_id, friend_id: current_user.id, status: 'request').first
		puts 'aqui'
		puts friendship
		friendship.status = 'accept'
		puts 'poha'
		
		friendship.save
	    friend.save
	    redirect_to root_path
  	end

  	def refuse_request
  		friend = Friend.find(params[:friend])
  		friendship = Friend.where(user_id: friend.friend_id, friend_id: current_user.id, status: 'request').first
		friendship.delete
		friend.delete
	    redirect_to root_path
  	end

  	def cancel_request
		friend = Friend.find(params[:friend])
		friendship = Friend.where(user_id: friend.friend_id, friend_id: friend.user_id, status: 'accept').first
		friendship.delete
		friend.delete
	    redirect_to root_path
 	 end


	def destroy
	   @friend.destroy
	   respond_to do |format|
	      format.html { redirect_to root_path, notice: 'Friend was successfully destroyed.' }
	      format.json { head :no_content }
	   end
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