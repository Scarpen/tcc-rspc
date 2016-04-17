class Project < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader

	belongs_to :user
	has_and_belongs_to_many :abilities
	has_and_belongs_to_many :interests

	has_many :members
  	has_many :users, :through => :members

  	has_many :topics
  	has_many :publications

end
