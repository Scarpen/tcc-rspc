class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.integer :topic_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
