class CreateProjectHasInterests < ActiveRecord::Migration
  def change
    create_table :interests_projects do |t|
      t.integer :project_id
      t.integer :interest_id

      t.timestamps null: false
    end
  end
end
