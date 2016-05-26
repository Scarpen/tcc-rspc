class Friend < ActiveRecord::Base
#include PublicActivity::Model
 
belongs_to :user
belongs_to :friend, class_name: "User"

end
