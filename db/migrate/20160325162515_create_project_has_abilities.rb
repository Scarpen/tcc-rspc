class CreateProjectHasAbilities < ActiveRecord::Migration
  def change
    create_table :abilities_projects do |t|
      t.integer :project_id
      t.integer :ability_id

      t.timestamps null: false
    end
  end
end
