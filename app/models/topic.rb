class Topic < ActiveRecord::Base

	belongs_to :user
	belongs_to :project

	has_many :posts

end
