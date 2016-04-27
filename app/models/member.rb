class Member < ActiveRecord::Base
	include PublicActivity::Model
	
	belongs_to :user
	belongs_to :project

end
