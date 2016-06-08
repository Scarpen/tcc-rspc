class Publication < ActiveRecord::Base
	include PublicActivity::Model

	mount_uploader :image, AvatarUploader
	belongs_to :project
	belongs_to :user

	has_many :comments, dependent: :destroy
	has_many :shares, dependent: :destroy
	has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy

end
