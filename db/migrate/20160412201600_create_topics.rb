class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topic_title
      t.string :description
      t.integer :project_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
