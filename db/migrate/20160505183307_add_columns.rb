class AddColumns < ActiveRecord::Migration
  def change
  	add_column :publications, :sharing, :integer
  end
end
