class Topic < ActiveRecord::Base
	include PublicActivity::Model

	belongs_to :user
	belongs_to :project

	has_many :posts, dependent: :destroy
  	has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
  

end
