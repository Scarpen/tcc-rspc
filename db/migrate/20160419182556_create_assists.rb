class CreateAssists < ActiveRecord::Migration
  def change
    create_table :assists do |t|
      t.integer :task_id
      t.integer :user_id
      t.integer :status

      t.timestamps null: false
    end
  end
end