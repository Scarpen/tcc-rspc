class Publication < ActiveRecord::Base

	mount_uploader :image, AvatarUploader
	belongs_to :project
	belongs_to :user

	has_many :comments

end
