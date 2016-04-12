class Project < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_and_belongs_to_many :abilities
	has_and_belongs_to_many :interests

	has_many :users
  	has_many :members, :through => :users

  	has_many :topics
end
