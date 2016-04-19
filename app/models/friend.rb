class Friend < ActiveRecord::Base
 
belongs_to :user
belongs_to :friendship, :class_name => 'User', :foreign_key =>'friendship_id'

end
