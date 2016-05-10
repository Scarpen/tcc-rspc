class HomeeController < ApplicationController
	def index
		if !current_user
		redirect_to new_user_session_path
		end
		@publication = Publication.new
		@comment = Comment.new
		@publications_feed = Array.new
		if current_user			
			Member.where(user_id: current_user.id).each do |project|
				if project.situation == 1 || project.situation == 2
					Publication.where(project_id: project.project_id).each do |pub|
						@publications_feed << pub
					end
				end
			end

			Friend.where(user_id: current_user.id, status: 'accept').each do |friend|
				Share.where(user_id: friend.friend_id).each do |shared_pub|
					if @publications_feed.find(shared_pub.publication.id) != true
						pub = shared_pub.publication
						pub.sharing = shared_pub.user_id
						@publications_feed << pub
					end
				end
			end
		end

		 @publications_feed = @publications_feed.sort_by{|e| e[:created_at]}.reverse

	end
end

