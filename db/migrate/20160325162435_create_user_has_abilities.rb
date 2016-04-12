class CreateUserHasAbilities < ActiveRecord::Migration
  def change
    create_table :user_has_abilities do |t|
      t.integer :user_id
      t.integer :ability_id

      t.timestamps null: false
    end
  end
end
