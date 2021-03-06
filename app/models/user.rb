class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    end
  end

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

  has_many :members, dependent: :destroy
  has_many :projects, :through => :members

  has_many :assists, dependent: :destroy
  has_many :tasks, :through => :assists

  has_many :friends, dependent: :destroy
  has_many :users, through: :friends

  has_many :topics
  has_many :publications
  has_many :comments
  has_many :tasks
  has_many :shares

  has_many :conversations, :foreign_key => :sender_id

  accepts_nested_attributes_for :interests
  accepts_nested_attributes_for :abilities


  
end
