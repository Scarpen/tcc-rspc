class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :situation, :default => 0
      t.string  :paper , :default => ""

      t.timestamps null: false
    end
  end
end
