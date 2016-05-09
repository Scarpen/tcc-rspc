class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.text :description
      t.integer :user_id
      t.integer :project_id
      t.string :image

      t.timestamps null: false
    end
  end
end
