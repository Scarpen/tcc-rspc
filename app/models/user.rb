class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  

  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :token_authenticatable, :confirmable

  before_save :ensure_authentication_token
  
	def skip_confirmation!
 		self.confirmed_at = Time.now
	 end

	has_and_belongs_to_many :abilities
	has_and_belongs_to_many :interests

  has_many :members
  has_many :projects, :through => :members
  
  has_many :topics
  has_many :publications
  has_many :tasks
end
