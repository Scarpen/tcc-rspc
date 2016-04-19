class HomeeController < ApplicationController
	def index
		if !current_user
		redirect_to new_user_session_path
		end


		@users = User.all
		if current_user
			Friend.where(requester_id: current_user.id, destiny_id: @user.id).each do |p|
				@friend_requester = p.status
			end
		end
	end
end
