class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :location
      t.date :date_start
      t.date :date_end
      t.string :situation,:default => "A Fazer"
      t.integer :user_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
