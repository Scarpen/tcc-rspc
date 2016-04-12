class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :avatar
      t.datetime :date_time_start
      t.datetime :date_time_end
      t.string  :place
      t.integer :number_members
      t.integer :creator_id
      t.boolean :visible_project, :default => false

      t.timestamps null: false
    end
  end
end
