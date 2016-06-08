class Friend < ActiveRecord::Base
#include PublicActivity::Model
 
belongs_to :user
belongs_to :friend, class_name: "User"
has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy

end
