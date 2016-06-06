class Project < ActiveRecord::Base
	include PublicActivity::Model

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    end
  end

	mount_uploader :avatar, AvatarUploader

	belongs_to :user, :foreign_key => :creator_id
	has_and_belongs_to_many :abilities
	has_and_belongs_to_many :interests

	has_many :members
  has_many :users, :through => :members

  has_many :topics
  has_many :publications
  has_many :tasks
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy
  	
  validates :name, presence: true
  validates :place, presence: true



end
