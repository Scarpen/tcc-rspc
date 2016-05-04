class Publication < ActiveRecord::Base
	include PublicActivity::Model

	mount_uploader :image, AvatarUploader
	belongs_to :project
	belongs_to :user

	has_many :comments
	has_many :shares

end
