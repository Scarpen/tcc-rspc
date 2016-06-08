class Task < ActiveRecord::Base
	include PublicActivity::Model
	belongs_to :project
	belongs_to :user

	has_many :assists, dependent: :destroy
  	has_many :users, :through => :assists
  	
  	has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy


end
