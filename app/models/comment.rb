class Comment < ActiveRecord::Base
	include PublicActivity::Model

	belongs_to :user
	belongs_to :publication

end
