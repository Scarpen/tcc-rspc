class AddImgToInterests < ActiveRecord::Migration
  def change
  	add_column :interests, :img, :string
  end
end
