class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :avatar
      t.string :phase
      t.string  :place
      t.integer :number_members
      t.integer :creator_id
      t.string :visible_project, :default => false

      t.timestamps null: false
    end
  end
end
