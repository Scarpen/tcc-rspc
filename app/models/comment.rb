class Comment < ActiveRecord::Base
	include PublicActivity::Model

	belongs_to :user
	belongs_to :publication

	has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy

end
