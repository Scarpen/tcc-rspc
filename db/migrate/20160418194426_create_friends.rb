class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :requester_id
      t.integer :destiny_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
