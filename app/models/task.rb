class Task < ActiveRecord::Base

	belongs_to :project
	belongs_to :user

	has_many :assists
  	has_many :users, :through => :assists

end
